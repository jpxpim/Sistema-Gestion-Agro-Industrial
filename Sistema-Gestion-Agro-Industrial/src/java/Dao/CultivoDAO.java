/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCultivo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class CultivoDAO 
{
    public static List<entCultivo> Listar() throws Exception
    {
        List<entCultivo> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_cultivo,nombre,descripcion,estado,usuario_responsable,fecha_modificacion"
                    + "from cultivo";

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entCultivo>();
                
                    entCultivo entidad = new entCultivo();
                    entidad.setId_cultivo(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setDescripcion(dr.getString(3)); 
                    entidad.setEstado(dr.getBoolean(4)); 
                    entidad.setUsuario_responsable(dr.getString(5)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(6)); 
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
