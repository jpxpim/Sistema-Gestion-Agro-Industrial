/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entEnvase;
import Entidades.entReceta;
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
public class EnvaseDAO {

    public static List<entEnvase> Listar(boolean activo) throws Exception
    {
        List<entEnvase> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select E.ID_ENVASE,E.CODIGO_CONTROL,E.NOMBRE,E.PESO,E.PESO_CARGA,E.ESTADO,E.USUARIO_RESPONSABLE,"
                    + "E.FECHA_MODIFICACION,E.ID_RECETA,R.NOMBRE,R.ESTADO,R.USUARIO_RESPONSABLE,R.FECHA_MODIFICACION,E.CANT_CAJAS_PALETA "
                    + "from ENVASE E JOIN RECETA R ON E.ID_RECETA=R.ID_RECETA ";
            if(activo)
                        sql+=" where E.ESTADO=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entEnvase>();
                    
                    entReceta objReceta = new entReceta();
                    objReceta.setId_receta(dr.getInt(9));
                    objReceta.setNombre(dr.getString(10)); 
                    objReceta.setEstado(dr.getBoolean(11)); 
                    objReceta.setUsuario_responsable(dr.getString(12)); 
                    objReceta.setFecha_modificacion(dr.getTimestamp(13)); 
                    
                    entEnvase entidad = new entEnvase();
                    entidad.setId_envase(dr.getInt(1));
                    entidad.setCodigo_control(dr.getString(2));
                    entidad.setNombre(dr.getString(3)); 
                    entidad.setPeso(dr.getDouble(4)); 
                    entidad.setPeso_carga(dr.getDouble(5)); 
                    entidad.setEstado(dr.getBoolean(6)); 
                    entidad.setUsuario_responsable(dr.getString(7)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(8)); 
                    entidad.setCant_cajas_paleta(dr.getInt(14)); 
                    entidad.setObjReceta(objReceta);
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

      public  static int insertar(entEnvase entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO ENVASE(ID_RECETA,CODIGO_CONTROL,NOMBRE,PESO,PESO_CARGA,CANT_CAJAS_PALETA,ESTADO,USUARIO_RESPONSABLE,FECHA_MODIFICACION)"
                   + "VALUES(?,?,?,?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1,entidad.getObjReceta().getId_receta());
            stmt.setString(2, entidad.getCodigo_control());
            stmt.setString(3, entidad.getNombre());
            stmt.setDouble(4, entidad.getPeso());
            stmt.setDouble(5, entidad.getPeso_carga());
            stmt.setInt(6,entidad.getCant_cajas_paleta());
            stmt.setBoolean(7, entidad.isEstado());
            stmt.setString(8, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entEnvase entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
            //,,,,,,,,
             String sql="UPDATE ENVASE SET ID_RECETA = ?,CODIGO_CONTROL= ?,NOMBRE= ?,"
                     + "PESO= ?,PESO_CARGA= ?,CANT_CAJAS_PALETA = ?,ESTADO = ?,"
                     + "USUARIO_RESPONSABLE = ?,FECHA_MODIFICACION = GETDATE() WHERE ID_ENVASE = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
           stmt.setInt(1,entidad.getObjReceta().getId_receta());
            stmt.setString(2, entidad.getCodigo_control());
            stmt.setString(3, entidad.getNombre());
            stmt.setDouble(4, entidad.getPeso());
            stmt.setDouble(5, entidad.getPeso_carga());
            stmt.setInt(6,entidad.getCant_cajas_paleta());
            stmt.setBoolean(7, entidad.isEstado());
            stmt.setString(8, entidad.getUsuario_responsable());
            stmt.setInt(9,entidad.getId_envase());
                
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
