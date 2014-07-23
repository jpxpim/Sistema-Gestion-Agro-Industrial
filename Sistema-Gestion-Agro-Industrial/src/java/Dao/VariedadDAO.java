/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCultivo;
import Entidades.entVariedad;
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
public class VariedadDAO {
    
    public static List<entVariedad> Listar(boolean activo) throws Exception
    {
        List<entVariedad> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select V.id_variedad,V.nombre,V.descripcion,V.estado,V.usuario_responsable,V.fecha_modificacion,"
                    + "C.id_cultivo,C.nombre,C.descripcion,C.estado,C.usuario_responsable,C.fecha_modificacion"
                    + " from variedad V join cultivo C on V.id_cultivo=C.id_cultivo";
            if(activo)
                        sql+=" where V.estado=1"; 
                    

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entVariedad>();
                
                    entVariedad entidad = new entVariedad();
                    entidad.setId_variedad(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setDescripcion(dr.getString(3)); 
                    entidad.setEstado(dr.getBoolean(4)); 
                    entidad.setUsuario_responsable(dr.getString(5)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(6)); 
                    
                    entCultivo cultivo = new entCultivo();
                    cultivo.setId_cultivo(dr.getInt(7));
                    cultivo.setNombre(dr.getString(8)); 
                    cultivo.setDescripcion(dr.getString(9)); 
                    cultivo.setEstado(dr.getBoolean(10)); 
                    cultivo.setUsuario_responsable(dr.getString(11)); 
                    cultivo.setFecha_modificacion(dr.getTimestamp(12)); 
                    
                    entidad.setObjCultivo(cultivo);
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

    public  static int insertar(entVariedad entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO variedad(id_cultivo,nombre,descripcion,estado,usuario_responsable,fecha_modificacion)"
                   + "VALUES(?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjCultivo().getId_cultivo());
            stmt.setString(2, entidad.getNombre());
            stmt.setString(3, entidad.getDescripcion());
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
    
    public static boolean actualizar(entVariedad entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE variedad SET id_cultivo = ?,nombre = ?,descripcion= ?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_variedad = ?;";
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);  
            stmt.setInt(1, entidad.getObjCultivo().getId_cultivo());
            stmt.setString(2, entidad.getNombre());
            stmt.setString(3, entidad.getDescripcion());
            stmt.setBoolean(4, entidad.getEstado());
            stmt.setString(5, entidad.getUsuario_responsable());
            stmt.setInt(6,entidad.getId_variedad());
                
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
