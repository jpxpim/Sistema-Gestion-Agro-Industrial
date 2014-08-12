/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;
import Entidades.entFormulario;
import Entidades.entModulo;
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
public class FormularioDAO {
    
    public static List<entFormulario> ListarModuloUsuario(int idUsuario ,int idModulo) throws Exception
    {
        List<entFormulario> lista = new ArrayList<entFormulario>();
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select F.id_formulario,F.url,F.etiqueta,F.padre,F.estado,F.usuario_responsable,F.fecha_modificacion,F.control_form "
                    + "from formulario F join modulo M on F.id_modulo=M.id_modulo inner join FORMULARIO_USUARIO FU on "
                    + "FU.ID_FORMULARIO=F.ID_FORMULARIO where FU.ID_USUARIO="+idUsuario+" and F.ID_MODULO="+idModulo
                    +" order by F.padre asc,F.etiqueta asc";
            
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                    entFormulario entidad = new entFormulario();
                    entidad.setId_formulario(dr.getInt(1));
                    entidad.setUrl(dr.getString(2)); 
                    entidad.setEtiqueta(dr.getString(3)); 
                    entidad.setPadre(dr.getInt(4)); 
                    entidad.setEstado(dr.getBoolean(5)); 
                    entidad.setUsuario_responsable(dr.getString(6)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
                    entidad.setControl_form(dr.getInt(8));
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
    
    public static entFormulario BuscarPorId(int id) throws Exception
    {
        entFormulario entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select F.id_formulario,F.url,F.etiqueta,F.padre,F.estado,F.usuario_responsable,F.fecha_modificacion,"
                    + " M.id_modulo,M.etiqueta,M.estado,M.usuario_responsable,M.fecha_modificacion "
                    + " from formulario F "
                    + " join modulo M on F.id_modulo=M.id_modulo "
                    + " where id_formulario="+id;
            
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            if(dr.next())
            {
                
                    entModulo modulo = new entModulo();
                    modulo.setId_modulo(dr.getInt(8));
                    modulo.setEtiqueta(dr.getString(9)); 
                    modulo.setEstado(dr.getInt(10)); 
                    modulo.setUsuario_responsable(dr.getString(11)); 
                    modulo.setFecha_modificacion(dr.getTimestamp(12)); 
                
                    entidad = new entFormulario();
                    entidad.setId_formulario(dr.getInt(1));
                    entidad.setUrl(dr.getString(2)); 
                    entidad.setEtiqueta(dr.getString(3)); 
                    entidad.setPadre(dr.getInt(4)); 
                    entidad.setEstado(dr.getBoolean(5)); 
                    entidad.setUsuario_responsable(dr.getString(6)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
                    entidad.setObjModulo(modulo);
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
    
    public static List<entFormulario> Listar(boolean activo,boolean padre) throws Exception
    {
        List<entFormulario> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select F.id_formulario,F.url,F.etiqueta,F.padre,F.estado,F.usuario_responsable,F.fecha_modificacion,"
                    + " M.id_modulo,M.etiqueta,M.estado,M.usuario_responsable,M.fecha_modificacion "
                    + " from formulario F "
                    + " join modulo M on F.id_modulo=M.id_modulo ";
            if(activo || padre)
                        sql+=" where "; 
            if (activo)
                        sql+=" estado=1 "; 

            if (padre && activo==false)
                        sql+=" padre=0 "; 
            else
                        sql+=" and padre=0";
            
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entFormulario>();
                
                    entModulo modulo = new entModulo();
                    modulo.setId_modulo(dr.getInt(8));
                    modulo.setEtiqueta(dr.getString(9)); 
                    modulo.setEstado(dr.getInt(10)); 
                    modulo.setUsuario_responsable(dr.getString(11)); 
                    modulo.setFecha_modificacion(dr.getTimestamp(12)); 
                
                    entFormulario entidad = new entFormulario();
                    entidad.setId_formulario(dr.getInt(1));
                    entidad.setUrl(dr.getString(2)); 
                    entidad.setEtiqueta(dr.getString(3)); 
                    entidad.setPadre(dr.getInt(4)); 
                    entidad.setEstado(dr.getBoolean(5)); 
                    entidad.setUsuario_responsable(dr.getString(6)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
                    entidad.setObjModulo(modulo);
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

    public  static int insertar(entFormulario entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO formulario(id_modulo,url,etiqueta,padre,control_form,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjModulo().getId_modulo());
            stmt.setString(2, entidad.getUrl());
            stmt.setString(3, entidad.getEtiqueta());
            stmt.setInt(4, entidad.getPadre());
            stmt.setInt(5, entidad.getControl_form());
            stmt.setBoolean(6, entidad.getEstado());
            stmt.setString(7, entidad.getUsuario_responsable());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            
            if (rs.next()){
                rpta=rs.getInt(1);
                sql="select id_usuario from usuario where es_administrador=1";
                 CallableStatement ct = conn.prepareCall(sql);
                 ResultSet dr = ct.executeQuery();
                    while(dr.next())
                    {                        
                        sql="INSERT INTO formulario_usuario(id_usuario,id_formulario,usuario_responsable,fecha_modificacion)"
                            + " VALUES(?,?,?,GETDATE());";
                        
                        PreparedStatement pst = conn.prepareStatement(sql);
                        pst.setInt(1, dr.getInt(1));
                        pst.setInt(2, rpta);
                        pst.setString(3, entidad.getUsuario_responsable());
                        pst.execute(); 
                        pst.close();
                    }
                ct.close();
                dr.close();
            }
            rs.close();
            conn.commit();
        } catch (Exception e) {
             if (conn != null) {
                    conn.rollback();
                }
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                    stmt.close();
                }
            }
        return rpta;
    } 
    
    public static boolean actualizar(entFormulario entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE formulario SET id_modulo=?,url = ?,etiqueta= ?,padre=?,control_form=?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_formulario = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setInt(1, entidad.getObjModulo().getId_modulo());
            stmt.setString(2, entidad.getUrl());
            stmt.setString(3, entidad.getEtiqueta());
            stmt.setInt(4, entidad.getPadre());
            stmt.setInt(5, entidad.getControl_form());
            stmt.setBoolean(6, entidad.getEstado());
            stmt.setString(7, entidad.getUsuario_responsable());
            stmt.setInt(8,entidad.getId_formulario());
                
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
