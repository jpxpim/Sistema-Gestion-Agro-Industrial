/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entDiaRecepcion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author rosemary
 */
public class DiaRecepcionDAO 
{
     public static entDiaRecepcion verificar() throws Exception
    {
        entDiaRecepcion entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select top 1 ID_DIA_RECEPCION,HORA_INICIO,HORA_FIN,ES_CERRADO,USUARIO_RESPONSABLE_INICIO,"
                    + "USUARIO_RESPONSABLE_FIN,FECHA_MODIFICACION from DIA_RECEPCION where ES_CERRADO=0 order by ID_DIA_RECEPCION asc ";

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            if(dr.next())
            {
                
                    entidad = new entDiaRecepcion();
                    entidad.setId_dia_recepcion(dr.getInt(1));
                    entidad.setHora_inicio(dr.getTimestamp(2)); 
                    entidad.setHora_fin(dr.getTimestamp(3)); 
                    entidad.setEs_cerrado(dr.getBoolean(4)); 
                    entidad.setUsuario_responsable_inicio(dr.getString(5)); 
                    entidad.setUsuario_responsable_fin(dr.getString(6)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
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
        return entidad;
    }

      public  static int insertar(entDiaRecepcion entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO DIA_RECEPCION(HORA_INICIO,HORA_FIN,ES_CERRADO,USUARIO_RESPONSABLE_INICIO,"
                   + "USUARIO_RESPONSABLE_FIN,FECHA_MODIFICACION)VALUES(GETDATE(),GETDATE(),0,?,'',GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getUsuario_responsable_inicio());
            stmt.executeUpdate();
           
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()){
                rpta=rs.getInt(1);
            }
            rs.close();
        } catch (Exception e) {
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
      
        public static boolean actualizar(entDiaRecepcion entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE DIA_RECEPCION SET HORA_FIN = GETDATE(),ES_CERRADO= 1,"
                     + "USUARIO_RESPONSABLE_FIN= ? WHERE ID_DIA_RECEPCION = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getUsuario_responsable_fin());
            stmt.setInt(2,entidad.getId_dia_recepcion());
                
           rpta = stmt.executeUpdate() == 1;
        } catch (Exception e) {
            throw new Exception("Error Actualizar "+e.getMessage(), e);
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
