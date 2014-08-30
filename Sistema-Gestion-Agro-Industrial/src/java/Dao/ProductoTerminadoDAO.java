/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entProductoTerminado;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class ProductoTerminadoDAO {
    
public static List<entProductoTerminado> Listar(boolean activo) throws Exception
    {
        List<entProductoTerminado> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
                    String sql="SELECT P.ID_PRODUCTO_TERMINADO,P.ID_DIA_RECEPCION,P.SELECCIONADOR,P.EMBALADOR,P.CODIGO_CONTROL,\n" +
                    "P.FECHA_PRODUCCION,P.ESTADO,P.USUARIO_RESPONSABLE,P.FECHA_MODIFICACION,\n" +
                    "E.ID_ENVASE,E.CODIGO_CONTROL,E.NOMBRE,E.PESO,E.PESO_CARGA,E.ESTADO,\n" +
                    "C.ID_CALIBRE,C.CODIGO_CONTROL,C.NOMBRE,C.ID_CULTIVO,C.ESTADO,\n" +
                    "CAT.ID_CATEGORIA,CAT.NOMBRE,CAT.ESTADO,CAT.CODIGO_CONTROL,\n" +
                    "COL.ID_COLOR,COL.CODIGO_CONTROL,COL.NOMBRE,COL.ID_CULTIVO,COL.ESTADO,\n" +
                    "L.ID_LOTE,L.CODIGO_CONTROL,L.NOMBRE,L.ESTADO,\n" +
                    "LP.ID_LINEA_PRODUCCION,LP.NOMBRE,LP.ESTADO\n" +
                    "FROM PRODUCTO_TERMINADO P\n" +
                    "JOIN ENVASE E ON P.ID_ENVASE=E.ID_ENVASE\n" +
                    "JOIN RECETA R ON E.ID_RECETA=R.ID_RECETA\n" +
                    "JOIN CALIBRE C ON P.ID_CALIBRE=C.ID_CALIBRE\n" +
                    "JOIN CATEGORIA CAT ON P.ID_CATEGORIA=CAT.ID_CATEGORIA\n" +
                    "JOIN COLOR COL ON P.ID_COLOR=COL.ID_COLOR\n" +
                    "JOIN LOTE L ON P.ID_LOTE=P.ID_LOTE\n" +
                    "JOIN LINEA_PRODUCCION LP ON P.ID_LINEA_PRODUCCION=LP.ID_LINEA_PRODUCCION"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entProductoTerminado>();                    
                    
                    entProductoTerminado entidad = new entProductoTerminado();
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
    
    public  static int insertar(entProductoTerminado entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO producto_terminado(id_dia_recepcion,id_envase,id_calibre,id_categoria"
                   + ",id_color,id_lote,id_linea_produccion,seleccionador,embalador"
                   + ",fecha_produccion,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,?,?,?,?,GETDATE(),?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getId_dia_recepcion());
            stmt.setInt(2, entidad.getObjEnvase().getId_envase());
            stmt.setInt(3, entidad.getObjCalibre().getId_calibre());
            stmt.setInt(4, entidad.getObjCategoria().getId_categoria());
            stmt.setInt(5, entidad.getObjColor().getId_color());
            stmt.setInt(6, entidad.getObjLote().getId_lote());
            stmt.setInt(7, entidad.getObjLineaProduccion().getId_linea_produccion());
            stmt.setString(8, entidad.getSeleccionador());
            stmt.setString(9, entidad.getEmbalador());
            stmt.setInt(10, entidad.getEstado());
            stmt.setString(11, entidad.getUsuario_responsable());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            
            if (rs.next()){
                rpta=rs.getInt(1);
            }
            Calendar c = new GregorianCalendar();
            String dia="";
            String mes="";
            if(c.get(Calendar.DATE)>9) dia = Integer.toString(c.get(Calendar.DATE));
            else dia="0"+Integer.toString(c.get(Calendar.DATE));
            if(c.get(Calendar.MONTH)>9) mes = Integer.toString(c.get(Calendar.MONTH));
            else mes="0"+Integer.toString(c.get(Calendar.MONTH));
            String anio = Integer.toString(c.get(Calendar.YEAR));
            sql = "UPDATE PRODUCTO_TERMINADO SET CODIGO_CONTROL="+dia+mes+anio+" WHERE ID_PRODUCTO_TERMINADO="+rpta;
            stmt = conn.prepareCall(sql);
            stmt.executeUpdate();
            
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
    
}
