/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entAnalisis;
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
public class AnalisisDAO {
    
    public static List<entAnalisis> Listar(boolean activo) throws Exception
    {
        List<entAnalisis> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_analisis,nombre,tabla_nombre,estado,usuario_responsable,fecha_modificacion"
                    + " from analisis ";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entAnalisis>();
                
                    entAnalisis entidad = new entAnalisis();
                    entidad.setId_analisis(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setTabla_nombre(dr.getString(3)); 
                    entidad.setEstado(dr.getBoolean(4)); 
                    entidad.setUsuario_responsable(dr.getString(5)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(6)); 
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
    
    public  static int insertar(entAnalisis entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO analisis(nombre,tabla_nombre,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getTabla_nombre());
            stmt.setBoolean(3, entidad.getEstado());
            stmt.setString(4, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entAnalisis entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE analisis SET nombre = ?,tabla_nombre= ?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_analisis = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getTabla_nombre());
            stmt.setBoolean(3, entidad.getEstado());
            stmt.setString(4, entidad.getUsuario_responsable());
            stmt.setInt(5,entidad.getId_analisis());
                
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
