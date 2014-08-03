/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entProductor;
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
public class ProductorDAO 
{
    public static List<entProductor> Listar(boolean activo) throws Exception
    {
        List<entProductor> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_productor,nombre,codigo_erp,codigo_control,estado,usuario_responsable,fecha_modificacion"
                    + " from productor ";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entProductor>();
                
                    entProductor entidad = new entProductor();
                    entidad.setId_productor(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setCodigo_erp(dr.getString(3)); 
                    entidad.setCodigo_control(dr.getString(4));
                    entidad.setEstado(dr.getBoolean(5)); 
                    entidad.setUsuario_responsable(dr.getString(6)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
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
    
    public  static int insertar(entProductor entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO productor(nombre,codigo_erp,codigo_control,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getCodigo_erp());
            stmt.setString(3, entidad.getCodigo_control());
            stmt.setBoolean(4, entidad.getEstado());
            stmt.setString(5, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entProductor entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE productor SET nombre = ?,codigo_erp= ?,codigo_control=?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_productor = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getCodigo_erp());
            stmt.setString(3, entidad.getCodigo_control());
            stmt.setBoolean(4, entidad.getEstado());
            stmt.setString(5, entidad.getUsuario_responsable());
            stmt.setInt(6,entidad.getId_productor());
                
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