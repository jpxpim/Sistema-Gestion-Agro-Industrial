/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entEmpleado;
import Entidades.entInsumo;
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
public class CargarCamposBDExternaDAO {
    
    public static List<entEmpleado> ListarEmpleadosBDexterna() throws Exception
    {
        List<entEmpleado> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select EMPLEADO,NOMBRE,APELLIDO_PATERNO+EMPLEADO_MATERNO from PER_TRABAJADOR";

            conn = ConexionDAO.getConnectionBdExterna();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entEmpleado>();                    
                    
                    entEmpleado entidad = new entEmpleado();
                    entidad.setDni(dr.getString(1));
                    entidad.setNombre(dr.getString(2));
                    entidad.setApellido(dr.getString(3));  
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
    public  static int insertarTrabajadoresBDExterna() throws Exception
    {

        Connection conn=null;
        int rpta=0;
        try {
            
            

            List<entEmpleado> lista = CargarCamposBDExternaDAO.ListarEmpleadosBDexterna();
            int i=0;
            conn=ConexionDAO.getConnection();
            
            while (lista.size()<i)
            {
                CallableStatement PA = conn.prepareCall("{ call SP_insertarEmpleado(?,?,?,?) }");
                PA.setString(1, lista.get(i).getDni());
                PA.setString(2, lista.get(i).getNombre());
                PA.setString(3, lista.get(i).getApellido());
                PA.setInt(4,0);
                PA.registerOutParameter(4,java.sql.Types.INTEGER);
                PA.execute();
                i++;
                rpta=PA.getInt(4);
            }
            
        } catch (Exception e) {
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally{
            try {
                conn.close();
            } catch (Exception e) {
                throw new Exception ("Error al Insertar" + e.getLocalizedMessage(),e);
            }
        }
        return rpta;
    } 
    
    public static List<entInsumo> ListarInsumoBDexterna() throws Exception
    {
        List<entInsumo> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select PRODUCTO,GLOSA from PRODUCTO";

            conn = ConexionDAO.getConnectionBdExterna();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entInsumo>();                    
                    entInsumo entidad = new entInsumo();
                    entidad.setCod_erp(dr.getString(1));
                    entidad.setNombre(dr.getString(2));
                    
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
    
    public  static int insertarInsumoBDExterna() throws Exception
    {

        Connection conn=null;
        int rpta=0;
        try {
            
            

            List<entInsumo> lista = CargarCamposBDExternaDAO.ListarInsumoBDexterna();
            int i=0;
            conn=ConexionDAO.getConnection();
            
            while (lista.size()<i)
            {
                CallableStatement PA = conn.prepareCall("{ call SP_insertarInsumo (?,?,?) }");
                PA.setString(1, lista.get(i).getCod_erp());
                PA.setString(2, lista.get(i).getNombre());
                PA.setInt(3,0);
                PA.registerOutParameter(3,java.sql.Types.INTEGER);
                PA.execute();
                i++;
                rpta=PA.getInt(4);
            }
            
        } catch (Exception e) {
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally{
            try {
                conn.close();
            } catch (Exception e) {
                throw new Exception ("Error al Insertar" + e.getLocalizedMessage(),e);
            }
        }
        return rpta;
    } 
}
