/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entSector;
import Entidades.entSubSector;
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
public class SubSectorDAO 
{
    public static List<entSubSector> Listar(boolean activo) throws Exception
    {
        List<entSubSector> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select SS.id_sub_sector,SS.nombre,SS.descripcion,SS.codigo_control,SS.estado,SS.usuario_responsable,SS.fecha_modificacion,"
                    + "S.id_sector,S.nombre,S.descripcion,S.codigo_control,S.estado,S.usuario_responsable,S.fecha_modificacion,SS.grower_senasa"
                    + " from sub_sector SS join sector S on SS.id_sector=S.id_sector";
            if(activo)
                        sql+=" where SS.estado=1"; 
                    

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entSubSector>();
                
                    entSubSector entidad = new entSubSector();
                    entidad.setId_sub_sector(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setDescripcion(dr.getString(3)); 
                    entidad.setCodigo_control(dr.getString(4)); 
                    entidad.setEstado(dr.getBoolean(5)); 
                    entidad.setUsuario_responsable(dr.getString(6)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
                    entidad.setGrower_senasa(dr.getString(15));
                    
                    entSector sector = new entSector();
                    sector.setId_sector(dr.getInt(8));
                    sector.setNombre(dr.getString(9)); 
                    sector.setDescripcion(dr.getString(10)); 
                    sector.setCodigo_control(dr.getString(11)); 
                    sector.setEstado(dr.getBoolean(12)); 
                    sector.setUsuario_responsable(dr.getString(13)); 
                    sector.setFecha_modificacion(dr.getTimestamp(14)); 
                    entidad.setObjSector(sector);
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

    public  static int insertar(entSubSector entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO sub_sector(id_sector,nombre,descripcion,codigo_control,grower_senasa,estado,usuario_responsable,fecha_modificacion)"
                   + "VALUES(?,?,?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjSector().getId_sector());
            stmt.setString(2, entidad.getNombre());
            stmt.setString(3, entidad.getDescripcion());
            stmt.setString(4, entidad.getCodigo_control());
            stmt.setString(5, entidad.getGrower_senasa());
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
    
    
    public static boolean actualizar(entSubSector entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE sub_sector SET id_sector = ?,nombre = ?,descripcion= ?,codigo_control=?,estado= ?,"
                     + "usuario_responsable = ?,fecha_modificacion = GETDATE(), grower_senasa=? WHERE id_sub_sector = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);  
            stmt.setInt(1, entidad.getObjSector().getId_sector());
            stmt.setString(2, entidad.getNombre());
            stmt.setString(3, entidad.getDescripcion());
            stmt.setString(4, entidad.getCodigo_control());
            stmt.setBoolean(5, entidad.getEstado());
            stmt.setString(6, entidad.getUsuario_responsable());
            stmt.setString (7,entidad.getGrower_senasa());
            stmt.setInt(8,entidad.getId_sub_sector());
            
                
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
