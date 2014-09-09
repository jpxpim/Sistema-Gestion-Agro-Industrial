/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Com.Operaciones;
import Entidades.entCalibre;
import Entidades.entCliente;
import Entidades.entDetallePaleta;
import Entidades.entLote;
import Entidades.entPaleta;
import Entidades.entProductoTerminado;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class PaletaDAO {
    
        
    public static boolean actualizar(entPaleta entidad) throws Exception
    {
        boolean rpta1 = false;
        Connection conn =null;
        CallableStatement stmt1 = null;
        try {
             String sql="UPDATE paleta SET id_cliente = ?,id_estado_paleta= ?,usuario_responsable = ?,fecha_modificacion = GETDATE() "
                     + " WHERE id_paleta = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt1 = conn.prepareCall(sql); 
            stmt1.setInt(1, entidad.getObjCliente().getId_cliente());
            stmt1.setInt(2, entidad.getEstado_paleta());
            stmt1.setString(9, entidad.getUsuario_responsable());
            stmt1.setInt(10,entidad.getId_paleta());                
            rpta1 = stmt1.executeUpdate() == 1;
            if(rpta1)
            {   
                for(int i=0; i<entidad.getListaDetallePaleta().size();i++)
                {
                    sql="UPDATE DET_PALETA SET ESTADO= ?,FECHA_MODIFICACION=GETDATE() "
                         + " WHERE ID_DET_PALETA = ?;";
                    CallableStatement stmt2 = conn.prepareCall(sql);    
                    stmt2.setInt(1, entidad.getEstado_paleta());
                    stmt2.setInt(7, entidad.getListaDetallePaleta().get(i).getId_det_paleta());
                    stmt2.execute();
                    stmt2.close();
                }
                PreparedStatement  stmt = null;    
                String sql0="INSERT INTO det_estado_paleta(id_paleta,estado_nuevo,fecha_modificacion)"
                       + " VALUES(?,?,GETDATE());";

                conn = ConexionDAO.getConnection();
                stmt = conn.prepareStatement(sql0, Statement.RETURN_GENERATED_KEYS);
                stmt.setInt(1, entidad.getId_paleta());
                stmt.setInt(2, entidad.getEstado_paleta());
                stmt.execute();
                
            }
           conn.commit();
        } catch (Exception e) {
             if (conn != null) {
                    conn.rollback();
                }
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally{
            try {
                stmt1.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return rpta1;
    }
    
    public  static int insertar(entPaleta entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO PALETA(ID_DIA_RECEPCION,ID_CLIENTE,FECHA_PRODUCCION,POSICION_PALETA,ESTADO_PALETA"
                   + ",CODIGO_CONTROL,USUARIO_RESPONSABLE,FECHA_MODIFICACION)"
                   + " VALUES(?,?,GETDATE(),?,?,?,?,GETDATE());";
           
           int estado=2;
                if(entidad.isCompleto())
                    estado=1;
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getId_dia_recepcion());
            stmt.setInt(2, entidad.getObjCliente().getId_cliente());
            stmt.setInt(3, 1);
            stmt.setInt(4, estado);
            stmt.setString(5, Operaciones.getCodigoControl(false, 0));
            stmt.setString(6, entidad.getUsuario_responsable());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            
            if (rs.next()){
                rpta=rs.getInt(1);
                
                sql="INSERT INTO DET_ESTADO_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,?,GETDATE());";
                PreparedStatement psPosicion = conn.prepareStatement(sql);
                psPosicion.setInt(1, rpta);
                psPosicion.setInt(2,estado);
                psPosicion.execute();
                psPosicion.close();
                
                sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,1,GETDATE());";
                PreparedStatement psEstado = conn.prepareStatement(sql);
                psEstado.setInt(1, rpta);
                psEstado.execute();
                psEstado.close();
                
                for(entDetallePaleta detalle : entidad.getListaDetallePaleta())
                {
                    sql="INSERT INTO DET_PALETA(ID_PALETA,ID_PRODUCTO_TERMINADO,ESTADO,ID_PALETA_ORIGEN,FECHA_MODIFICACION)"
                        + " VALUES(?,?,1,0,GETDATE());";
                    PreparedStatement psInsertaDetalle = conn.prepareStatement(sql);
                    psInsertaDetalle.setInt(1, rpta);
                    psInsertaDetalle.setInt(2,detalle.getObjProductoTerminado().getId_producto_terminado());
                    psInsertaDetalle.execute();
                    psInsertaDetalle.close();

                    sql="update PRODUCTO_TERMINADO set ESTADO=1 where ID_PRODUCTO_TERMINADO=?;";
                    PreparedStatement psEstadoProducto = conn.prepareStatement(sql);
                    psEstadoProducto.setInt(1, detalle.getObjProductoTerminado().getId_producto_terminado());
                    psEstadoProducto.execute();
                    psEstadoProducto.close();
                }
                
                
            }
            rs.close();
            conn.commit();
        } catch (Exception e) {
             if (conn != null) {
                    conn.rollback();
                }
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally{
            try {
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return rpta;
    } 
    
     public  static int insertarRepaletizado(entPaleta entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO PALETA(ID_DIA_RECEPCION,ID_CLIENTE,FECHA_PRODUCCION,POSICION_PALETA,ESTADO_PALETA"
                   + ",CODIGO_CONTROL,USUARIO_RESPONSABLE,FECHA_MODIFICACION)"
                   + " VALUES((select TOP 1 ID_DIA_RECEPCION from DIA_RECEPCION ORDER BY ID_DIA_RECEPCION DESC)"
                   + ",?,GETDATE(),?,?,?,?,GETDATE());";
           
           int estado=2;
                if(entidad.isCompleto())
                    estado=1;
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjCliente().getId_cliente());
            stmt.setInt(2, 3);
            stmt.setInt(3, estado);
            stmt.setString(4, Operaciones.getCodigoControl(false, 0));
            stmt.setString(5, entidad.getUsuario_responsable());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            
            if (rs.next()){
                rpta=rs.getInt(1);
                
                sql="INSERT INTO DET_ESTADO_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,?,GETDATE());";
                PreparedStatement psPosicion = conn.prepareStatement(sql);
                psPosicion.setInt(1, rpta);
                psPosicion.setInt(2,estado);
                psPosicion.execute();
                psPosicion.close();
                
                sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,3,GETDATE());";
                PreparedStatement psEstado = conn.prepareStatement(sql);
                psEstado.setInt(1, rpta);
                psEstado.execute();
                psEstado.close();
                
                for(entDetallePaleta detalle : entidad.getListaDetallePaleta())
                {
                    sql="INSERT INTO DET_PALETA(ID_PALETA,ID_PRODUCTO_TERMINADO,ESTADO,ID_PALETA_ORIGEN,FECHA_MODIFICACION)"
                        + " VALUES(?,?,1,?,GETDATE());";
                    PreparedStatement psInsertaDetalle = conn.prepareStatement(sql);
                    psInsertaDetalle.setInt(1, rpta);
                    psInsertaDetalle.setInt(2,detalle.getObjProductoTerminado().getId_producto_terminado());
                    psInsertaDetalle.setInt(3,detalle.getId_paleta());
                    psInsertaDetalle.execute();
                    psInsertaDetalle.close();

                    sql="update PRODUCTO_TERMINADO set ESTADO=1 where ID_PRODUCTO_TERMINADO=?;";
                    PreparedStatement psEstadoProducto = conn.prepareStatement(sql);
                    psEstadoProducto.setInt(1, detalle.getObjProductoTerminado().getId_producto_terminado());
                    psEstadoProducto.execute();
                    psEstadoProducto.close();
                    
                    sql="update DET_PALETA set ESTADO=5 where ID_DET_PALETA=?;";
                    PreparedStatement psEstadoDetPaleta = conn.prepareStatement(sql);
                    psEstadoDetPaleta.setInt(1, detalle.getId_det_paleta());
                    psEstadoDetPaleta.execute();
                    psEstadoDetPaleta.close();
                    
                    
                }
                
                
            }
            rs.close();
            conn.commit();
        } catch (Exception e) {
             if (conn != null) {
                    conn.rollback();
                }
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally{
            try {
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return rpta;
    } 
     public static List<entPaleta> ListarPacking() throws Exception
    {
        List<entPaleta> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
                    String sql="select P.ID_PALETA,P.CODIGO_CONTROL,P.FECHA_PRODUCCION,p.ESTADO_PALETA,P.POSICION_PALETA,C.NOMBRE from \n" +
                                "PALETA P JOIN CLIENTE C ON P.ID_CLIENTE=C.ID_CLIENTE where POSICION_PALETA!=2 and POSICION_PALETA!=4"; 
                    
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entPaleta>();                    
                    entPaleta entidad = new entPaleta();
                 
                    entidad.setId_paleta(dr.getInt(1));
                    entidad.setCodigo_control(dr.getString(2)); 
                    entidad.setFecha_produccion(dr.getTimestamp(3));
                    entidad.setEstado_paleta(dr.getInt(4));
                    entidad.setPosicion_paleta(dr.getInt(5));
                    entidad.setObjCliente(new entCliente(dr.getString(6)));
                    lista.add(entidad);
            }

        } catch (Exception e) {
            throw new Exception("Listar "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return lista;
    }       
     public static List<entDetallePaleta> ListarPorProductoTerminadoMovimientos(boolean incompleto) throws Exception
    {
        List<entDetallePaleta> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
                    String sql="select DP.ID_DET_PALETA,DP.ID_PALETA,PT.ID_PRODUCTO_TERMINADO,PT.CODIGO_CONTROL,PT.ID_LOTE,\n" +
                                "C.NOMBRE,E.CANT_CAJAS_PALETA,P.ESTADO_PALETA from PALETA P JOIN DET_PALETA  DP ON P.ID_PALETA=DP.ID_PALETA \n" +
                                "JOIN PRODUCTO_TERMINADO PT ON PT.ID_PRODUCTO_TERMINADO=DP.ID_PRODUCTO_TERMINADO join CALIBRE C \n" +
                                "ON PT.ID_CALIBRE=C.ID_CALIBRE JOIN ENVASE E ON PT.ID_ENVASE=E.ID_ENVASE where P.POSICION_PALETA=3 \n" +
                                "AND DP.ESTADO=1";
                            if(incompleto)
                           sql+=" and P.ESTADO_PALETA=2"; 
                    
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entDetallePaleta>();                    
                    
                    
                    entCalibre objCalibre = new entCalibre();
                    objCalibre.setNombre(dr.getString(6));
//                    
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr.getInt(5));
                    
                    entProductoTerminado objProductoTerminado = new entProductoTerminado();
                    objProductoTerminado.setId_producto_terminado(dr.getInt(3));
                    objProductoTerminado.setCodigo_control(dr.getString(4)); 
                    objProductoTerminado.setObjLote(objLote);
                    objProductoTerminado.setObjCalibre(objCalibre);
                    objProductoTerminado.setId_dia_recepcion(dr.getInt(7));
                    
                    entDetallePaleta entidad = new entDetallePaleta();
                    entidad.setId_det_paleta(dr.getInt(1));
                    entidad.setId_paleta(dr.getInt(2));
                    entidad.setId_paleta_origen(dr.getInt(8));
                    entidad.setObjProductoTerminado(objProductoTerminado);
                    lista.add(entidad);
            }

        } catch (Exception e) {
            throw new Exception("Listar "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return lista;
    }   
     
  
}
