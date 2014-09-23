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
public class ModuloDAO 
{
      public static List<entModulo> ListarUsuario(int idUsuario) throws Exception
    {
        List<entModulo> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select distinct M.id_modulo,M.etiqueta,M.estado,M.usuario_responsable,M.fecha_modificacion,M.url "
                    + "from modulo M inner join FORMULARIO F on M.ID_MODULO=F.ID_MODULO inner join FORMULARIO_USUARIO "
                    + "FU on FU.ID_FORMULARIO=F.ID_FORMULARIO where FU.ID_USUARIO="+idUsuario;

            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista = new ArrayList<entModulo>();
                
                    entModulo entidad = new entModulo();
                    entidad.setId_modulo(dr.getInt(1));
                    entidad.setEtiqueta(dr.getString(2)); 
                    entidad.setEstado(dr.getInt(3)); 
                    entidad.setUsuario_responsable(dr.getString(4)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(5)); 
                    entidad.setUrl(dr.getString(6)); 
                        List<entFormulario> listaFormulario = null;
                        sql="select F.id_formulario,F.url,F.etiqueta,F.padre,F.estado,F.usuario_responsable,F.fecha_modificacion,F.control_form "
                            + "from formulario F join modulo M on F.id_modulo=M.id_modulo inner join FORMULARIO_USUARIO FU on "
                            + "FU.ID_FORMULARIO=F.ID_FORMULARIO where FU.ID_USUARIO="+idUsuario+" and F.ID_MODULO="+entidad.getId_modulo()
                            +" order by F.padre asc,F.etiqueta asc";
                            CallableStatement csFormulario = conn.prepareCall(sql);
                            ResultSet rsFormulario = csFormulario.executeQuery();

                            while (rsFormulario.next()){
                                if(listaFormulario==null)
                                listaFormulario = new ArrayList<entFormulario>();

                                    entFormulario objFormulario = new entFormulario();
                                    objFormulario.setId_formulario(rsFormulario.getInt(1));
                                    objFormulario.setUrl(rsFormulario.getString(2)); 
                                    objFormulario.setEtiqueta(rsFormulario.getString(3)); 
                                    objFormulario.setPadre(rsFormulario.getInt(4)); 
                                    objFormulario.setEstado(rsFormulario.getBoolean(5)); 
                                    objFormulario.setUsuario_responsable(rsFormulario.getString(6)); 
                                    objFormulario.setFecha_modificacion(rsFormulario.getTimestamp(7)); 
                                    objFormulario.setControl_form(rsFormulario.getInt(8));
                                    listaFormulario.add(objFormulario);
                            }
                            csFormulario.close();
                            rsFormulario.close();
                    entidad.setList(listaFormulario);
                    lista.add(entidad);
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
                dr.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return lista;
    }
      
    public static List<entModulo> Listar(boolean activo) throws Exception
    {
        List<entModulo> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_modulo,etiqueta,estado,usuario_responsable,fecha_modificacion,url"
                    + " from modulo ";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entModulo>();
                
                    entModulo entidad = new entModulo();
                    entidad.setId_modulo(dr.getInt(1));
                    entidad.setEtiqueta(dr.getString(2)); 
                    entidad.setEstado(dr.getInt(3)); 
                    entidad.setUsuario_responsable(dr.getString(4)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(5)); 
                    entidad.setUrl(dr.getString(6)); 
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
    
    public  static int insertar(entModulo entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO modulo(etiqueta,url,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getEtiqueta());
            stmt.setString(2, entidad.getUrl());
            stmt.setInt(3, entidad.getEstado());
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
    
    public static boolean actualizar(entModulo entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE modulo SET etiqueta = ?,url= ?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_modulo = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getEtiqueta());
            stmt.setString(2, entidad.getUrl());
            stmt.setInt(3, entidad.getEstado());
            stmt.setString(4, entidad.getUsuario_responsable());
            stmt.setInt(5,entidad.getId_modulo());
                
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
