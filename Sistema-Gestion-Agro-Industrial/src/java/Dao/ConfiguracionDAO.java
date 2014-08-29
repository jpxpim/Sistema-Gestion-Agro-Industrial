/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entConfiguracion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author rosemary
 */
public class ConfiguracionDAO {
    public static entConfiguracion buscar() throws Exception
    {
        entConfiguracion entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select ID_CONFIGURACION,NOM_BD_ERP_EXT,IP_BD_ERP_EXT,PUERTO_ERP_EXT,USUARIO_BD_ERP_EXT,"
                    + " CONTRA_BD_ERP_EXT,TIEMPO_ALERTA,USUARIO_CLAVE,SINCRO_DASH,PRODUCTOR_EMPRESA,USUARIO_CIERRE_RECEPCION_1,"
                    + " USUARIO_CIERRE_RECEPCION_2,USUARIO_CIERRE_RECEPCION_3 from CONFIGURACION ";
            
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            if(dr.next())
            {
                    entidad = new entConfiguracion();
                    entidad.setId_configuracion(dr.getInt(1));
                    entidad.setNom_bd_erp_ext(dr.getString(2)); 
                    entidad.setIp_bd_erp_ext(dr.getString(3)); 
                    entidad.setPuerto_erp_ext(dr.getString(4));
                    entidad.setUsuario_bd_erp_ext(dr.getString(5)); 
                    entidad.setContra_bd_erp_ext(dr.getString(6)); 
                    entidad.setTiempo_alerta(dr.getInt(7)); 
                    entidad.setUsuario_clave(dr.getString(8));
                    entidad.setSincro_dash(dr.getInt(9));
                    entidad.setProductor_empresa(dr.getInt(10));
                    entidad.setUsuario_cierre_recepcion_1(dr.getInt(11));
                    entidad.setUsuario_cierre_recepcion_2(dr.getInt(12));
                    entidad.setUsuario_cierre_recepcion_3(dr.getInt(13));
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
    
        
    public static boolean actualizar(entConfiguracion entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {

             String sql="UPDATE configuracion SET NOM_BD_ERP_EXT = ?,IP_BD_ERP_EXT= ?,PUERTO_ERP_EXT=?,USUARIO_BD_ERP_EXT= ?,"
                     + "CONTRA_BD_ERP_EXT = ?,TIEMPO_ALERTA = ?,USUARIO_CLAVE = ?,SINCRO_DASH = ?,PRODUCTOR_EMPRESA= ?,"
                     + "  USUARIO_CIERRE_RECEPCION_1=?, USUARIO_CIERRE_RECEPCION_2=?, USUARIO_CIERRE_RECEPCION_3=? WHERE ID_CONFIGURACION = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNom_bd_erp_ext());
            stmt.setString(2, entidad.getIp_bd_erp_ext());
            stmt.setString(3, entidad.getPuerto_erp_ext());
            stmt.setString(4, entidad.getUsuario_bd_erp_ext());
            stmt.setString(5, entidad.getContra_bd_erp_ext());
            stmt.setInt(6,entidad.getTiempo_alerta());
            stmt.setString(7,entidad.getUsuario_clave());
            stmt.setInt(8,entidad.getSincro_dash());
            stmt.setInt(9,entidad.getProductor_empresa());
            stmt.setInt(10,entidad.getUsuario_cierre_recepcion_1());
            stmt.setInt(11,entidad.getUsuario_cierre_recepcion_2());
            stmt.setInt(12,entidad.getUsuario_cierre_recepcion_3());
            stmt.setInt(13,entidad.getId_configuracion());
                
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
