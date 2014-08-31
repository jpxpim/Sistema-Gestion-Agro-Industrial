/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entEmpleado;
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
public class EmpleadoDAO {

    public static List<entEmpleado> Listar(boolean activo) throws Exception
    {
        List<entEmpleado> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select ID_EMPLEADO,DNI,NOMBRE,APELLIDO,ESTADO,FECHA_MODIFICACION from EMPLEADO";
                    if(activo)
                        sql+=" where ESTADO=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entEmpleado>();                    
                    
                    entEmpleado entidad = new entEmpleado();
                    entidad.setId_empleado(dr.getInt(1));
                    entidad.setDni(dr.getString(2));
                    entidad.setNombre(dr.getString(3));
                    entidad.setApellido(dr.getString(4));  
                    entidad.setEstado(dr.getBoolean(5)); 
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
