/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCalibre;
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
public class CalibreDAO {

    public static List<entCalibre> Listar(boolean activo) throws Exception
    {
        List<entCalibre> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select C.ID_CALIBRE,C.CODIGO_CONTROL,C.NOMBRE,C.ESTADO,C.USUARIO_RESPONSABLE,C.FECHA_MODIFICACION,"
                    + "C.ID_CULTIVO,CU.NOMBRE,CU.DESCRIPCION,CU.CODIGO_CONTROL,CU.ESTADO,CU.USUARIO_RESPONSABLE,"
                    + "CU.FECHA_MODIFICACION from CALIBRE C JOIN CULTIVO CU ON C.ID_CULTIVO=CU.ID_CULTIVO";
            if(activo)
                        sql+=" where C.ESTADO=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entCalibre>();
                    
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr.getInt(7));
                    objCultivo.setNombre(dr.getString(8)); 
                    objCultivo.setDescripcion(dr.getString(9)); 
                    objCultivo.setCodigo_control(dr.getString(10)); 
                    objCultivo.setEstado(dr.getBoolean(11)); 
                    objCultivo.setUsuario_responsable(dr.getString(12)); 
                    objCultivo.setFecha_modificacion(dr.getTimestamp(13)); 
                    
                    entCalibre entidad = new entCalibre();
                    entidad.setId_calibre(dr.getInt(1));
                    entidad.setCodigo_control(dr.getString(2));
                    entidad.setNombre(dr.getString(3));  
                    entidad.setEstado(dr.getBoolean(4)); 
                    entidad.setUsuario_responsable(dr.getString(5)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(6)); 
                    entidad.setObjCultivo(objCultivo);
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
