/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entPuerto;
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
public class PuertoDAO 
{
    public static List<entPuerto> Listar(boolean activo) throws Exception
    {
        List<entPuerto> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_puerto,nombre,estado,usuario_responsable,fecha_modificacion"
                    + " from puerto ";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entPuerto>();
                
                    entPuerto entidad = new entPuerto();
                    entidad.setId_puerto(dr.getInt(1));
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
    
    public  static int insertar(entPuerto entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO puerto(nombre,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getNombre());
            stmt.setBoolean(2, entidad.getEstado());
            stmt.setString(3, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entPuerto entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE puerto SET nombre = ?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_puerto = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNombre());
            stmt.setBoolean(2, entidad.getEstado());
            stmt.setString(3, entidad.getUsuario_responsable());
            stmt.setInt(4,entidad.getId_puerto());
                
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
