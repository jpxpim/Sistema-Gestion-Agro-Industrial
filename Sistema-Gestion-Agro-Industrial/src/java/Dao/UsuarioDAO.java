/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class UsuarioDAO {
     
    public static List<entUsuario> Listar(boolean activo) throws Exception
    {
        List<entUsuario> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_usuario,login,contrasena,codigo_erp,nombre,apellido,email,telefono,celular,fecha_nacimiento,"
                    + " foto,estado,usuario_responsable,fecha_modificacion,es_administrador "
                    + " from usuario where es_administrador=0 ";
            if(activo)
                        sql+=" and estado=1 "; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entUsuario>();
                
                    entUsuario entidad = new entUsuario();
                    entidad.setId_usuario(dr.getInt(1));
                    entidad.setLogin(dr.getString(2));
                    entidad.setContrasena(dr.getString(3));
                    entidad.setCodigo_erp(dr.getString(4));
                    entidad.setNombre(dr.getString(5));
                    entidad.setApellido(dr.getString(6));
                    entidad.setEmail(dr.getString(7));
                    entidad.setTelefono(dr.getString(8));
                    entidad.setCelular(dr.getString(9));
                    entidad.setFecha_nacimiento(dr.getDate(10));
                    entidad.setFoto(dr.getBytes(11));
                    entidad.setEstado(dr.getBoolean(12));
                    entidad.setUsuario_responsable(dr.getString(13));
                    entidad.setFecha_modificacion(dr.getTimestamp(14));
                    entidad.setEs_administrador(dr.getBoolean(15));
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
    
    public static byte[] getFoto(int IdUsuario) throws Exception
    {
        byte[] foto = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select foto from usuario where id_usuario="+IdUsuario; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            if(dr.next())
            {
                   foto=dr.getBytes(1);
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
        return foto;
    }
    
    public  static int insertar(entUsuario entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO usuario(login,contrasena,codigo_erp,nombre,apellido,email,telefono,celular,fecha_nacimiento,"
                   + " foto,estado,usuario_responsable,fecha_modificacion,es_administrador)"
                   + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,GETDATE(),0);";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getLogin());
            stmt.setString(2, entidad.getContrasena());
            stmt.setString(3, entidad.getCodigo_erp());
            stmt.setString(4, entidad.getNombre());
            stmt.setString(5, entidad.getApellido());
            stmt.setString(6, entidad.getEmail());
            stmt.setString(7, entidad.getTelefono());
            stmt.setString(8, entidad.getCelular());
            stmt.setDate(9, new java.sql.Date(entidad.getFecha_nacimiento().getTime()));
            stmt.setBytes(10, entidad.getFoto());
            stmt.setBoolean(11, entidad.getEstado());
            stmt.setString(12, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entUsuario entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE usuario SET login = ?,"
                     + "codigo_erp= ?,nombre=?,apellido=?,email=?,telefono=?,celular=?,fecha_nacimiento=?,"
                     + " estado= ?,"
                     + " usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_usuario = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getLogin());
            stmt.setString(2, entidad.getCodigo_erp());
            stmt.setString(3, entidad.getNombre());
            stmt.setString(4, entidad.getApellido());
            stmt.setString(5, entidad.getEmail());
            stmt.setString(6, entidad.getTelefono());
            stmt.setString(7, entidad.getCelular());
            stmt.setTimestamp(8, new Timestamp(entidad.getFecha_nacimiento().getTime()));            
            stmt.setBoolean(9, entidad.getEstado());
            stmt.setString(10, entidad.getUsuario_responsable());
            stmt.setInt(11,entidad.getId_usuario());  
            rpta = stmt.executeUpdate() == 1;
            if(entidad.getFoto()!=null)
            {
                sql="UPDATE usuario SET foto=? WHERE id_usuario = ?;";
                CallableStatement stmtFoto = conn.prepareCall(sql);
                stmtFoto.setBytes(1, entidad.getFoto());
                stmtFoto.setInt(2,entidad.getId_usuario()); 
                stmtFoto.executeUpdate();
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
    
     public static boolean contrasena(int IdUsuario,String contrasena) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE usuario SET contrasena = ? WHERE id_usuario = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, contrasena);
            stmt.setInt(2,IdUsuario);  
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
     public static boolean restablecer(int Id,String Contrasena) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE usuario SET contrasena = ?,fecha_modificacion = GETDATE() WHERE id_usuario = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, Contrasena);
            stmt.setInt(2,Id);  
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
