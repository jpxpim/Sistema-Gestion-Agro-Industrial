/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entColor;
import Entidades.entCultivo;
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
public class ColorDAO {

    public static List<entColor> Listar(boolean activo) throws Exception
    {
        List<entColor> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select C.ID_COLOR,C.CODIGO_CONTROL,C.NOMBRE,C.ESTADO,C.USUARIO_RESPONSABLE,"
                    + "C.FECHA_MODIFICACION,C.ID_CULTIVO,CU.NOMBRE,CU.DESCRIPCION,CU.CODIGO_CONTROL,"
                    + "CU.ESTADO,CU.USUARIO_RESPONSABLE,CU.FECHA_MODIFICACION from COLOR C JOIN CULTIVO "
                    + "CU ON C.ID_CULTIVO=CU.ID_CULTIVO";
            if(activo)
                        sql+=" where C.ESTADO=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entColor>();
                    
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr.getInt(7));
                    objCultivo.setNombre(dr.getString(8)); 
                    objCultivo.setDescripcion(dr.getString(9)); 
                    objCultivo.setCodigo_control(dr.getString(10)); 
                    objCultivo.setEstado(dr.getBoolean(11)); 
                    objCultivo.setUsuario_responsable(dr.getString(12)); 
                    objCultivo.setFecha_modificacion(dr.getTimestamp(13)); 
                    
                    entColor entidad = new entColor();
                    entidad.setId_color(dr.getInt(1));
                    entidad.setCodigo_control(dr.getString(2));
                    entidad.setNombre(dr.getString(3));  
                    entidad.setEstado(dr.getBoolean(4)); 
                    entidad.setUsuario_responsable(dr.getString(5)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(6)); 
                    entidad.setObjCultivo(objCultivo);
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

    public  static int insertar(entColor entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO color(nombre,codigo_control,id_cultivo,estado,usuario_responsable,fecha_modificacion)"
                   + "VALUES(?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getCodigo_control());
            stmt.setInt(3, entidad.getObjCultivo().getId_cultivo());
            stmt.setBoolean(4, entidad.isEstado());
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
    
    public static boolean actualizar(entColor entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE color SET nombre = ?,estado= ?,id_cultivo=?,usuario_responsable = ?,"
                     + "fecha_modificacion = GETDATE(),codigo_control = ? WHERE id_color = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNombre());
            stmt.setBoolean(2, entidad.isEstado());
             stmt.setInt(3, entidad.getObjCultivo().getId_cultivo());
            stmt.setString(4, entidad.getUsuario_responsable());
            stmt.setString(5, entidad.getCodigo_control());
            stmt.setInt(6,entidad.getId_color());
                
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
