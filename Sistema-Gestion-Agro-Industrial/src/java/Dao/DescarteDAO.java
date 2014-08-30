/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entDescarte;
import Entidades.entVivero;
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
public class DescarteDAO {

//    public static List<entVivero> Listar(boolean activo) throws Exception
//    {
//        List<entVivero> lista = null;
//        Connection conn =null;
//        CallableStatement stmt = null;
//        ResultSet dr = null;
//        try {
//            String sql="select id_vivero,nombre,descripcion,codigo_control,estado,usuario_responsable,fecha_modificacion,codigo_control"
//                    + " from vivero ";
//            if(activo)
//                        sql+=" where estado=1"; 
//
//            conn = ConexionDAO.getConnection();
//            stmt = conn.prepareCall(sql);
//            dr = stmt.executeQuery();
//
//            while(dr.next())
//            {
//                if(lista==null)
//                    lista= new ArrayList<entVivero>();
//                
//                    entVivero entidad = new entVivero();
//                    entidad.setId_vivero(dr.getInt(1));
//                    entidad.setNombre(dr.getString(2)); 
//                    entidad.setDescripcion(dr.getString(3)); 
//                    entidad.setCodigo_control(dr.getString(4)); 
//                    entidad.setEstado(dr.getBoolean(5)); 
//                    entidad.setUsuario_responsable(dr.getString(6)); 
//                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
//                    entidad.setCodigo_control(dr.getString(8));
//                    lista.add(entidad);
//            }
//
//        } catch (Exception e) {
//            throw new Exception("Listar "+e.getMessage(), e);
//        }
//        finally{
//            try {
//                dr.close();
//                stmt.close();
//                conn.close();
//            } catch (SQLException e) {
//            }
//        }
//        return lista;
//    }

    public  static int insertar(entDescarte entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement stmt = null;
        try {
            
           String sql="INSERT INTO DESCARTE(ID_JABA,ID_PARIHUELA,ID_LOTE,NUM_JABAS,PESO_BRUTO,ES_RACIMO,ES_CAMPO,FECHA_REGISTRO,"
                      + "USUARIO_RESPONSABLE,FECHA_MODIFICACION)VALUES(?,?,?,?,?,?,?,GETDATE(),?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjJaba().getId_jaba());
            stmt.setInt(2, entidad.getObjParihuela().getId_parihuela());
            stmt.setInt(3, entidad.getObjLote().getId_lote());
            stmt.setDouble(4, entidad.getNum_jabas());
            stmt.setDouble(5, entidad.getPeso_bruto());
            stmt.setBoolean(6, entidad.getIs_racimo());
            stmt.setBoolean(7, entidad.getIs_campo());
            stmt.setString(8, entidad.getUsuario_responsable());
            stmt.executeUpdate();
           
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()){
                rpta=rs.getInt(1);
            }
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
    
//    public static boolean actualizar(entVivero entidad) throws Exception
//    {
//        boolean rpta = false;
//        Connection conn =null;
//        CallableStatement stmt = null;
//        try {
//             String sql="UPDATE vivero SET nombre = ?,descripcion= ?,estado= ?,"
//                     + "usuario_responsable = ?,fecha_modificacion = GETDATE(),codigo_control = ? WHERE id_vivero = ?;";
//             
//            conn = ConexionDAO.getConnection();
//            stmt = conn.prepareCall(sql);             
//            stmt.setString(1, entidad.getNombre());
//            stmt.setString(2, entidad.getDescripcion());
//            stmt.setBoolean(3, entidad.getEstado());
//            stmt.setString(4, entidad.getUsuario_responsable());
//            stmt.setString(5, entidad.getCodigo_control());
//            stmt.setInt(6,entidad.getId_vivero());
//                
//           rpta = stmt.executeUpdate() == 1;
//        } catch (Exception e) {
//            throw new Exception("Error Actualizar "+e.getMessage(), e);
//        }
//        finally{
//            try {
//                stmt.close();
//                conn.close();
//            } catch (SQLException e) {
//            }
//        }
//        return rpta;
//    }    
}