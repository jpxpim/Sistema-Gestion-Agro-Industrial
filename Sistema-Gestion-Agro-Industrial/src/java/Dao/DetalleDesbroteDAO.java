/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entDetalleDesbrote;
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
public class DetalleDesbroteDAO {
    
    public static List<entDetalleDesbrote> ListarPorDesbrote(int idDesbrote) throws Exception
    {
        List<entDetalleDesbrote> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql=" select id_det_desbrote, id_desbrote, posicion, num_1,num_2,num_3,num_4,num_5,num_6,num_7,num_8,num_9,num_10,num_11,num_12,num_13,num_14,num_15 \n" +
                        " from DET_DESBROTE where id_det_desbrote ="+idDesbrote;
            
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entDetalleDesbrote>();
                
                    entDetalleDesbrote entidad = new entDetalleDesbrote();
                    entidad.setId_det_desbrote(dr.getInt(1));
                    entidad.setId_desbrote(dr.getInt(2));
                    entidad.setPosicion(dr.getInt(3));
                    entidad.setNum_1(dr.getInt(4));
                    entidad.setNum_2(dr.getInt(5));
                    entidad.setNum_3(dr.getInt(6));
                    entidad.setNum_4(dr.getInt(7));
                    entidad.setNum_5(dr.getInt(8));
                    entidad.setNum_6(dr.getInt(9));
                    entidad.setNum_7(dr.getInt(10));
                    entidad.setNum_8(dr.getInt(11));
                    entidad.setNum_9(dr.getInt(12));
                    entidad.setNum_10(dr.getInt(13));
                    entidad.setNum_11(dr.getInt(14));
                    entidad.setNum_12(dr.getInt(15));
                    entidad.setNum_13(dr.getInt(16));
                    entidad.setNum_14(dr.getInt(17));
                    entidad.setNum_15(dr.getInt(18));
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
    
        public  static int insertar(entDetalleDesbrote entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="insert into DET_DESBROTE (id_brotacion,posicion,num_1,num_2,num_3,num_4,num_5,num_6,num_7,num_8,num_9,num_10,num_11,num_12,num_13,num_14,num_15)"
                   + " values\n" +
                       " (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getId_desbrote());
            stmt.setInt(2, entidad.getPosicion());
            stmt.setInt(3, entidad.getNum_1());
            stmt.setInt(4, entidad.getNum_2());
            stmt.setInt(5, entidad.getNum_3());
            stmt.setInt(6, entidad.getNum_4());
            stmt.setInt(7, entidad.getNum_5());
            stmt.setInt(8, entidad.getNum_6());
            stmt.setInt(9, entidad.getNum_7());
            stmt.setInt(10, entidad.getNum_8());
            stmt.setInt(11, entidad.getNum_9());
            stmt.setInt(12, entidad.getNum_10());
            stmt.setInt(13, entidad.getNum_11());
            stmt.setInt(14, entidad.getNum_12());
            stmt.setInt(14, entidad.getNum_13());
            stmt.setInt(14, entidad.getNum_14());
            stmt.setInt(14, entidad.getNum_15());
            
            
            
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
    
    public static boolean actualizar(entDetalleDesbrote entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="update DET_DESBROTE set ID_DESBROTE=?,POSICION=?,NUM_1=? ,NUM_2=? ,NUM_3=? ,NUM_4=? ,NUM_5=? ,NUM_6=? ,NUM_7=? , \n" +
                        " NUM_8=? ,NUM_9=? ,NUM_10=? ,NUM_11=? ,NUM_12=? ,NUM_13=? ,NUM_14=? ,NUM_15=? where ID_DET_DESBROTE=? ";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setInt(1, entidad.getId_desbrote());
            stmt.setInt(2, entidad.getPosicion());
            stmt.setInt(3, entidad.getNum_1());
            stmt.setInt(4, entidad.getNum_2());
            stmt.setInt(5, entidad.getNum_3());
            stmt.setInt(6, entidad.getNum_4());
            stmt.setInt(7, entidad.getNum_5());
            stmt.setInt(8, entidad.getNum_6());
            stmt.setInt(9, entidad.getNum_7());
            stmt.setInt(10, entidad.getNum_8());
            stmt.setInt(11, entidad.getNum_9());
            stmt.setInt(12, entidad.getNum_10());
            stmt.setInt(13, entidad.getNum_11());
            stmt.setInt(14, entidad.getNum_12());
            stmt.setInt(15, entidad.getNum_13());
            stmt.setInt(16, entidad.getNum_14());
            stmt.setInt(17, entidad.getNum_15());
            stmt.setInt(18, entidad.getId_det_desbrote());
                
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
