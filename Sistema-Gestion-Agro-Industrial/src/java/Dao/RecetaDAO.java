/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entDetalleReceta;
import Entidades.entInsumo;
import Entidades.entReceta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class RecetaDAO {

    public static List<entReceta> Listar(boolean activo) throws Exception
    {
        List<entReceta> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select ID_RECETA,NOMBRE,ESTADO,USUARIO_RESPONSABLE,FECHA_MODIFICACION from RECETA";
            if(activo)
                        sql+=" where ESTADO=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entReceta>();
                
                    entReceta entidad = new entReceta();
                    entidad.setId_receta(dr.getInt(1));
                    entidad.setNombre(dr.getString(2));  
                    entidad.setEstado(dr.getBoolean(3)); 
                    entidad.setUsuario_responsable(dr.getString(4)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(5)); 
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
    
     public static List<entDetalleReceta> ListarDetalle(int IdReceta) throws Exception
    {
        List<entDetalleReceta> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select D.ID_DET_RECETA,D.ID_RECETA,D.CANTIDAD,D.ID_INSUMO,I.COD_ERP,I.NOMBRE,"
                    + "I.FECHA_MODIFICACION from DET_RECETA D JOIN INSUMO I ON  D.ID_INSUMO=I.ID_INSUMO "
                    + "WHERE D.ID_RECETA="+IdReceta;


            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entDetalleReceta>();
                
                    entInsumo objInsumo=new entInsumo();
                    objInsumo.setId_insumo(dr.getInt(4));
                    objInsumo.setCod_erp(dr.getString(5));
                    objInsumo.setNombre(dr.getString(6)); 
                    objInsumo.setFecha_modificacion(dr.getTimestamp(7)); 
                    
                    entDetalleReceta entidad = new entDetalleReceta();
                    entidad.setId_det_receta(dr.getInt(1));
                    entidad.setId_receta(dr.getInt(2));
                    entidad.setCantidad(dr.getDouble(3));  
                    entidad.setObjInsumo(objInsumo);
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
     
     public static List<entReceta> ListarCompleto(boolean activo) throws Exception
    {
        List<entReceta> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_vivero,nombre,descripcion,codigo_control,estado,usuario_responsable,fecha_modificacion,codigo_control"
                    + " from vivero ";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entReceta>();
                
                    entReceta entidad = new entReceta();
//                    entidad.setId_vivero(dr.getInt(1));
//                    entidad.setNombre(dr.getString(2)); 
//                    entidad.setDescripcion(dr.getString(3)); 
//                    entidad.setCodigo_control(dr.getString(4)); 
//                    entidad.setEstado(dr.getBoolean(5)); 
//                    entidad.setUsuario_responsable(dr.getString(6)); 
//                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
//                    entidad.setCodigo_control(dr.getString(8));
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
     
     
    public  static int insertar(entReceta entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO RECETA(NOMBRE,ESTADO,USUARIO_RESPONSABLE,FECHA_MODIFICACION)"
                   + "VALUES(?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getNombre());
            stmt.setBoolean(2, entidad.isEstado());
            stmt.setString(3, entidad.getUsuario_responsable());
            stmt.executeUpdate();
           
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()){
                rpta=rs.getInt(1);
                for(entDetalleReceta detalle : entidad.getList())
                {
                    sql="INSERT INTO DET_RECETA(ID_RECETA,ID_INSUMO,CANTIDAD)"
                        + " VALUES(?,?,?);";
                    PreparedStatement psInsertaDetalle = conn.prepareStatement(sql);
                    psInsertaDetalle.setInt(1, rpta);
                    psInsertaDetalle.setInt(2,detalle.getObjInsumo().getId_insumo());
                    psInsertaDetalle.setDouble(3,detalle.getCantidad());
                    psInsertaDetalle.execute();
                    psInsertaDetalle.close();
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
    
    public static boolean actualizar(entReceta entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE RECETA SET nombre = ?,estado= ?,usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE ID_RECETA = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);  
            conn.setAutoCommit(false);
            stmt.setString(1, entidad.getNombre());
            stmt.setBoolean(2, entidad.isEstado());
            stmt.setString(3, entidad.getUsuario_responsable());
            stmt.setInt(4,entidad.getId_receta());
                
           rpta = stmt.executeUpdate() == 1;
           if(rpta)
           {
                for(entDetalleReceta detalle : entidad.getList())     
                {
                    if(detalle.getId_det_receta()==0)
                    {
                        sql="INSERT INTO DET_RECETA(ID_RECETA,ID_INSUMO,CANTIDAD)"
                            + " VALUES(?,?,?);";
                        PreparedStatement psInsertaDetalle = conn.prepareStatement(sql);
                        psInsertaDetalle.setInt(1, entidad.getId_receta());
                        psInsertaDetalle.setInt(2,detalle.getObjInsumo().getId_insumo());
                        psInsertaDetalle.setDouble(3,detalle.getCantidad());
                        psInsertaDetalle.execute();
                        psInsertaDetalle.close();
                    }
                    if(detalle.isEliminado_session())
                    {
                         sql="delete DET_RECETA where ID_DET_RECETA=?;";
                        PreparedStatement psEliminarDetalle = conn.prepareStatement(sql);
                        psEliminarDetalle.setInt(1, detalle.getId_det_receta());
                        psEliminarDetalle.execute();
                        psEliminarDetalle.close();
                        
                    }
                }
               
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
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return rpta;
    }    
}
