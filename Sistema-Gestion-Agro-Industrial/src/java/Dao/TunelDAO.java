/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entTunel;
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
public class TunelDAO {
    
    
    public static List<entTunel> Listar(boolean activo,int carga) throws Exception
    {
        List<entTunel> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_tunel,nombre,descripcion,pos_x,pos_y,pos_h,estado,usuario_responsable,fecha_modificacion"
                    + " from tunel ";
                    if(activo)
                    {
                        sql+=" where estado=1"; 
                        if(carga==1)
                            sql+=" and CARGADO=1"; 
                        else if(carga==0)
                            sql+=" and CARGADO=0"; 
                    }
                    else
                    {
                        if(carga==1)
                            sql+=" where and CARGADO=1"; 
                        else if(carga==0)
                            sql+=" where and CARGADO=0"; 
                    }
            

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entTunel>();
                
                    entTunel entidad = new entTunel();
                    entidad.setId_tunel(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setDescripcion(dr.getString(3)); 
                    entidad.setPos_x(dr.getInt(4));
                    entidad.setPos_y(dr.getInt(5));
                    entidad.setPos_h(dr.getInt(6));
                    entidad.setEstado(dr.getBoolean(7)); 
                    entidad.setUsuario_responsable(dr.getString(8)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(9)); 
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
    
    public  static int insertar(entTunel entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO tunel(nombre,descripcion,pos_x,pos_y,pos_h,estado,usuario_responsable,fecha_modificacion,CARGADO)"
                   + " VALUES(?,?,?,?,?,?,?,GETDATE(),0);";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getDescripcion());
            stmt.setInt(3, entidad.getPos_x());
            stmt.setInt(4, entidad.getPos_y());
            stmt.setInt(5, entidad.getPos_h());
            stmt.setBoolean(6, entidad.getEstado());
            stmt.setString(7, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entTunel entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE tunel SET nombre = ?,descripcion= ?,pos_x=?,pos_y=?,pos_h=?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_tunel = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getDescripcion());
            stmt.setInt(3, entidad.getPos_x());
            stmt.setInt(4, entidad.getPos_y());
            stmt.setInt(5, entidad.getPos_h());
            stmt.setBoolean(6, entidad.getEstado());
            stmt.setString(7, entidad.getUsuario_responsable());
            stmt.setInt(8,entidad.getId_tunel());
                
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
