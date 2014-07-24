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
                    + " foto,estado,usuario_responsable,fecha_modificacion"
                    + " from usuario ";
            if(activo)
                        sql+=" where estado=1"; 

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
                    entidad.setFoto(dr.getString(11));
                    entidad.setEstado(dr.getBoolean(12));
                    entidad.setUsuario_responsable(dr.getString(13));
                    entidad.setFecha_modificacion(dr.getTimestamp(14));
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
    
    public  static int insertar(entUsuario entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO usuario(login,contrasena,codigo_erp,nombre,apellido,email,telefono,celular,fecha_nacimiento,"
                   + " foto,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,GETDATE());";
           
            DateFormat formato_fecha = new SimpleDateFormat("dd/MM/yyyy");
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
            stmt.setString(10, entidad.getFoto());
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
             String sql="UPDATE usuario SET login = ?,contrasena= ?,"
                     + "codigo_erp= ?,nombre=?,apellido=?,email=?,telefono=?,celular=?,fecha_nacimiento=?,foto=?,"
                     + " estado= ?,"
                     + " usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_usuario = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getLogin());
            stmt.setString(2, entidad.getContrasena());
            stmt.setString(3, entidad.getCodigo_erp());
            stmt.setString(4, entidad.getNombre());
            stmt.setString(5, entidad.getApellido());
            stmt.setString(6, entidad.getEmail());
            stmt.setString(7, entidad.getTelefono());
            stmt.setString(8, entidad.getCelular());
            stmt.setDate(9, (Date) entidad.getFecha_nacimiento());
            stmt.setString(10, entidad.getFoto());
            stmt.setBoolean(11, entidad.getEstado());
            stmt.setString(12, entidad.getUsuario_responsable());
            stmt.setInt(13,entidad.getId_usuario());  
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
