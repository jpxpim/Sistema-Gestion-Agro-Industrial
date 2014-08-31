/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entLineaProduccion;
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
public class LineaProduccionDAO {

    public static List<entLineaProduccion> Listar(boolean activo) throws Exception
    {
        List<entLineaProduccion> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select ID_LINEA_PRODUCCION,NOMBRE,ESTADO,USUARIO_RESPONSABLE,FECHA_MODIFICACION from LINEA_PRODUCCION";
            if(activo)
                        sql+=" where ESTADO=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entLineaProduccion>();
                    
                    entLineaProduccion entidad = new entLineaProduccion();
                    entidad.setId_linea_produccion(dr.getInt(1));
                    entidad.setNombre(dr.getString(2));  
                    entidad.setEstado(dr.getBoolean(3)); 
                    entidad.setUsuario_responsable(dr.getString(4)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(5)); 
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
    public  static int insertar(entLineaProduccion entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO LINEA_PRODUCCION(NOMBRE,ESTADO,USUARIO_RESPONSABLE,FECHA_MODIFICACION)"
                   + " VALUES(?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getNombre());
            stmt.setBoolean(2, entidad.isEstado());
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
    
    public static boolean actualizar(entLineaProduccion entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
            
             String sql="UPDATE LINEA_PRODUCCION SET NOMBRE = ?,ESTADO= ?,USUARIO_RESPONSABLE = ?,"
                     + "FECHA_MODIFICACION = GETDATE() WHERE ID_LINEA_PRODUCCION = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);         
            stmt.setString(1, entidad.getNombre());
            stmt.setBoolean(2, entidad.isEstado());
            stmt.setString(3, entidad.getUsuario_responsable());
            stmt.setInt(4,entidad.getId_linea_produccion());
                
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
