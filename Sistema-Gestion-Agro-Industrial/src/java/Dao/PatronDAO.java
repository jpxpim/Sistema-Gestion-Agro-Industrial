/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entPatron;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class PatronDAO {
    public static List<entPatron> Listar(boolean activo) throws Exception
    {
        List<entPatron> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_patron,nombre,descripcion,estado,usuario_responsable,fecha_modificacion"
                    + "from patron ";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entPatron>();
                
                    entPatron entidad = new entPatron();
                    entidad.setId_patron(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setDescripcion(dr.getString(3)); 
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

    public  static int insertar(entPatron entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
            
           String sql="INSERT INTO patron(nombre,descripcion,estado,usuario_responsable,fecha_modifiacion)"
                   + "VALUES(?,?,?,?,GETDATE(),0);";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getDescripcion());
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
    
    public static boolean actualizar(entPatron entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE patron SET nombre = ?,descripcion= ?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_patron = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getDescripcion());
            stmt.setBoolean(3, entidad.getEstado());
            stmt.setString(4, entidad.getUsuario_responsable());
            stmt.setInt(5,entidad.getId_patron());
                
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
