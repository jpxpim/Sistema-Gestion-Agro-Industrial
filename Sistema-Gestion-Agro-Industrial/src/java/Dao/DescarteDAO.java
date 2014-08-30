/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entDescarte;
import Entidades.entJaba;
import Entidades.entLote;
import Entidades.entParihuela;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class DescarteDAO {

    public static List<entDescarte> Listar() throws Exception
    {
        List<entDescarte> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select D.ID_DESCARTE,D.NUM_JABAS,D.PESO_BRUTO,D.ES_RACIMO,D.ES_CAMPO,D.FECHA_REGISTRO,"
                    + "D.USUARIO_RESPONSABLE,D.FECHA_MODIFICACION,D.ID_JABA,J.NOMBRE,J.PESO,D.ID_PARIHUELA,P.NOMBRE,"
                    + "P.PESO,D.ID_LOTE,L.NOMBRE,L.CODIGO_CONTROL from DESCARTE D JOIN JABA J ON D.ID_JABA=J.ID_JABA "
                    + "JOIN PARIHUELA P ON D.ID_PARIHUELA=P.ID_PARIHUELA JOIN LOTE L ON D.ID_LOTE=L.ID_LOTE";
            
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entDescarte>();
                    
                    entJaba objJaba = new entJaba();
                    objJaba.setId_jaba(dr.getInt(9));
                    objJaba.setNombre(dr.getString(10));
                    objJaba.setPeso(dr.getDouble(11));
                    
                    entParihuela objParihuela = new entParihuela();
                    objParihuela.setId_parihuela(dr.getInt(12));
                    objParihuela.setNombre(dr.getString(13));
                    objParihuela.setPeso(dr.getDouble(14));
                    
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr.getInt(15));
                    objLote.setNombre(dr.getString(16));
                    objLote.setCodigo_control(dr.getString(17));
                    
                    entDescarte entidad = new entDescarte();
                    entidad.setId_descarte(dr.getInt(1));
                    entidad.setNum_jabas(dr.getDouble(2)); 
                    entidad.setPeso_bruto(dr.getDouble(3)); 
                    entidad.setIs_racimo(dr.getBoolean(4)); 
                    entidad.setIs_campo(dr.getBoolean(5));
                    entidad.setFecha_registro(dr.getTimestamp(6));  
                    entidad.setUsuario_responsable(dr.getString(7)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(8)); 
                    entidad.setObjJaba(objJaba);
                    entidad.setObjParihuela(objParihuela);
                    entidad.setObjLote(objLote);
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
    
    public static boolean actualizar(entDescarte entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE DESCARTE SET ID_JABA = ?,ID_PARIHUELA= ?,ID_LOTE= ?,NUM_JABAS = ?,PESO_BRUTO = ?,"
                     + "ES_RACIMO = ?,ES_CAMPO = ?,USUARIO_RESPONSABLE = ?,FECHA_MODIFICACION = GETDATE() WHERE ID_DESCARTE = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setInt(1, entidad.getObjJaba().getId_jaba());
            stmt.setInt(2, entidad.getObjParihuela().getId_parihuela());
            stmt.setInt(3, entidad.getObjLote().getId_lote());
            stmt.setDouble(4, entidad.getNum_jabas());
            stmt.setDouble(5, entidad.getPeso_bruto());
            stmt.setBoolean(6, entidad.getIs_racimo());
            stmt.setBoolean(7, entidad.getIs_campo());
            stmt.setString(8, entidad.getUsuario_responsable());
            stmt.setInt(9, entidad.getId_descarte());    
            
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
