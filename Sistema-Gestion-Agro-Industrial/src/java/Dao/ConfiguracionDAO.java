/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entConfiguracion;
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
public class ConfiguracionDAO {
    public static List<entConfiguracion> Listar() throws Exception
    {
        List<entConfiguracion> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_configuracion,nomb_bd_erp_ext, ip_bd_erp_ext, puertp_erp_ext, usuario_bd_erp_ext,"
                    + " contra_bd_erp_ext, tiempo_alerta,usuario_clave, max_intentos_login, sincro_dash, minutos_bloqueo, productor_empresa"
                    + " from configuracion ";


            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entConfiguracion>();
                
                    entConfiguracion entidad = new entConfiguracion();
                    entidad.setId_configuracion(dr.getInt(1));
                    entidad.setNom_bd_erp_ext(dr.getString(2)); 
                    entidad.setIp_bd_erp_ext(dr.getString(3)); 
                    entidad.setPuerto_erp_ext(dr.getString(4));
                    entidad.setUsuario_bd_erp_ext(dr.getString(5)); 
                    entidad.setContra_bd_erp_ext(dr.getString(6)); 
                    entidad.setTiempo_alerta(dr.getInt(7)); 
                    entidad.setUsuario_clave(dr.getString(8));
                    entidad.setMax_intentos_login(dr.getInt(9));
                    entidad.setSincro_dash(dr.getInt(10));
                    entidad.setMinutos_bloqueo(dr.getInt(11));
                    entidad.setProductor_empresa(dr.getInt(12));
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
    
        
    public static boolean actualizar(entConfiguracion entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE configuracion SET nom_bd_erp_ext = ?,ip_bd_erp_ext= ?,puerto_bd_erp_ext=?,usuario_bd_erp_ext= ?,"
                     + "contra_bd_erp_ext = ?,tiempo_alerta = ?,usuario_clave = ?,max_intentos_login = ?,sincro_dash= ?,"
                     + "  minutos_bloqueo=?, productor_empresa=? WHERE id_configuracion = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNom_bd_erp_ext());
            stmt.setString(2, entidad.getIp_bd_erp_ext());
            stmt.setString(3, entidad.getPuerto_erp_ext());
            stmt.setString(4, entidad.getUsuario_bd_erp_ext());
            stmt.setString(5, entidad.getContra_bd_erp_ext());
            stmt.setInt(6,entidad.getTiempo_alerta());
            stmt.setString(7,entidad.getUsuario_clave());
            stmt.setInt(8,entidad.getMax_intentos_login());
            stmt.setInt(9,entidad.getSincro_dash());
            stmt.setInt(10,entidad.getMinutos_bloqueo());
            stmt.setInt(11,entidad.getProductor_empresa());
            stmt.setInt(12,entidad.getId_configuracion());
                
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
