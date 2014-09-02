/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entInsumo;
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
public class InsumoDAO {

    public static List<entInsumo> Listar() throws Exception
    {
        List<entInsumo> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select ID_INSUMO,COD_ERP,NOMBRE,FECHA_MODIFICACION from INSUMO ";

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entInsumo>();
                
                    entInsumo entidad = new entInsumo();
                    entidad.setId_insumo(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setCod_erp(dr.getString(3)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(4)); 
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
