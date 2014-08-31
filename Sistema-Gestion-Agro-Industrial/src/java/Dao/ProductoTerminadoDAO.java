/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entProductoTerminado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author rosemary
 */
public class ProductoTerminadoDAO {
    
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
