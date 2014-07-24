/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entFormulario;
import Entidades.entFormularioUsuario;
import Entidades.entUsuario;
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
public class FormularioUsuarioDAO 
{

    public static List<entFormularioUsuario> Listar() throws Exception
    {
    List<entFormularioUsuario> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select FU.id_formulario_usuario,FU.usuario_responsable,FU.fecha_modificacion, "
                    + " U.id_usuario,U.login,U.contrasena,U.codigo_erp,U.nombre,U.apellido,U.email,U.telefono,U.celular,U.fecha_nacimiento, "
                    + " U.foto,U.estado,U.usuario_responsable,U.fecha_modificacion, "
                    + " F.id_formulario,F.url,F.etiqueta,F.padre,F.estado,F.usuario_responsable,F.fecha_modificacion"
                    + " from formulario_usuario FU "
                    + " LEFT JOIN USUARIO U ON FU.ID_USUARIO=U.ID_USUARIO "
                    + " LEFT JOIN FORMULARIO F ON FU.ID_FORMULARIO=F.ID_FORMULARIO";
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entFormularioUsuario>();
                    
                                      
                    entUsuario objUsuario = new entUsuario();
                    objUsuario.setId_usuario(dr.getInt(4));
                    objUsuario.setLogin(dr.getString(5));
                    objUsuario.setContrasena(dr.getString(6));
                    objUsuario.setCodigo_erp(dr.getString(7));
                    objUsuario.setNombre(dr.getString(8));
                    objUsuario.setApellido(dr.getString(9));
                    objUsuario.setEmail(dr.getString(10));
                    objUsuario.setTelefono(dr.getString(11));
                    objUsuario.setCelular(dr.getString(12));
                    objUsuario.setFecha_nacimiento(dr.getDate(13));
                    objUsuario.setFoto(dr.getString(14));
                    objUsuario.setEstado(dr.getBoolean(15));
                    objUsuario.setUsuario_responsable(dr.getString(16));
                    objUsuario.setFecha_modificacion(dr.getTimestamp(17));
                             
                    entFormulario objFormulario = new entFormulario();
                    objFormulario.setId_formulario(dr.getInt(18));
                    objFormulario.setUrl(dr.getString(19)); 
                    objFormulario.setEtiqueta(dr.getString(20)); 
                    objFormulario.setPadre(dr.getInt(21)); 
                    objFormulario.setEstado(dr.getBoolean(22)); 
                    objFormulario.setUsuario_responsable(dr.getString(23)); 
                    objFormulario.setFecha_modificacion(dr.getTimestamp(24)); 
                    
                    //FormUsua
                    entFormularioUsuario entidad = new entFormularioUsuario();
                    entidad.setId_formulario_usuario(dr.getInt(1));
                    entidad.setObjFormulario(objFormulario);
                    entidad.setObjUSuario(objUsuario);
                    entidad.setUsuario_responsable(dr.getString(2)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(3)); 
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

    
    public  static int insertar(entFormularioUsuario entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO formulario_usuario(id_usuario,id_formulario,usuario_responsable,fecha_modificacion)"
                   + "VALUES(?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjUSuario().getId_usuario());
            stmt.setInt(2, entidad.getObjFormulario().getId_formulario());
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
    
    public static boolean actualizar(entFormularioUsuario entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE formulario_usuario SET id_usuario = ?,id_formulario= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_formulario_usuario = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setInt(1, entidad.getObjUSuario().getId_usuario());
            stmt.setInt(2, entidad.getObjFormulario().getId_formulario());
            stmt.setString(3, entidad.getUsuario_responsable());
            stmt.setInt(4,entidad.getId_formulario_usuario());
                
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
