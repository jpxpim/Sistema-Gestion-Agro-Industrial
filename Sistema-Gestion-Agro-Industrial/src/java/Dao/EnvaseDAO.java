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
                    + "E.FECHA_MODIFICACION,E.ID_RECETA,R.NOMBRE,R.ESTADO,R.USUARIO_RESPONSABLE,R.FECHA_MODIFICACION "
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

    
}
