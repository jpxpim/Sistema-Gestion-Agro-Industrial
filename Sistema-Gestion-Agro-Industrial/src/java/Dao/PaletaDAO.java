/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Com.Operaciones;
import Entidades.entDetallePaleta;
import Entidades.entPaleta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

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
            stmt1.setInt(2, entidad.getId_estado_paleta());
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
                    stmt2.setInt(1, entidad.getId_estado_paleta());
                    stmt2.setInt(7, entidad.getListaDetallePaleta().get(i).getId_det_paleta());
                    stmt2.executeUpdate();
                    stmt2.close();
                }
                PreparedStatement  stmt = null;    
                String sql0="INSERT INTO det_estado_paleta(id_paleta,estado_nuevo,fecha_modificacion)"
                       + " VALUES(?,?,GETDATE());";

                conn = ConexionDAO.getConnection();
                stmt = conn.prepareStatement(sql0, Statement.RETURN_GENERATED_KEYS);
                stmt.setInt(1, entidad.getId_paleta());
                stmt.setInt(2, entidad.getId_estado_paleta());
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                
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
                PreparedStatement psPosicion = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                psPosicion.setInt(1, rpta);
                psPosicion.setInt(2,estado);
                psPosicion.execute();
                psPosicion.close();
                
                sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,1,GETDATE());";
                PreparedStatement psEstado = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
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
    
}
