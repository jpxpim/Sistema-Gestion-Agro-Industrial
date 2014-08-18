/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entTransportista;
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
public class TransportistaDAO {
    
    public static List<entTransportista> Listar(boolean activo) throws Exception
    {
        List<entTransportista> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_transportista,razon_social,ruc,estado,usuario_responsable,fecha_modificacion"
                    + " from transportista ";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entTransportista>();
                
                    entTransportista entidad = new entTransportista();
                    entidad.setId_transportista(dr.getInt(1));
                    entidad.setRazon_social(dr.getString(2)); 
                    entidad.setRuc(dr.getString(3)); 
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
    
    public  static int insertar(entTransportista entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO transportista(razon_social,ruc,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getRazon_social());
            stmt.setString(2, entidad.getRuc());
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
    
    public static boolean actualizar(entTransportista entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE transportista SET razon_social = ?,ruc= ?,estado= ?,"
                     + " usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_transportista = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getRazon_social());
            stmt.setString(2, entidad.getRuc());
            stmt.setBoolean(3, entidad.getEstado());
            stmt.setString(4, entidad.getUsuario_responsable());
            stmt.setInt(5,entidad.getId_transportista());
                
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
