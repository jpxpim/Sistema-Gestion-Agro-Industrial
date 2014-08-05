/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCampania;
import Entidades.entCampaniaLote;
import Entidades.entLote;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class CampaniaLoteDAO 
{
    public static List<entCampaniaLote> Listar() throws Exception
    {
        List<entCampaniaLote> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select CL.id_campania_lote,CL.fecha_poda_formacion,CL.numero_plantas,CL.usuario_responsable,CL.fecha_modificacion, "
                    + " L.id_lote,L.nombre "
                    + " C.id_campania,C.nombre "
                    + " from campania_lote CL "
                    + " join lote L on CL.id_lote=L.id_lote "
                    + " join campania C on CL.id_campania=C.id_campania ";
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();
            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entCampaniaLote>();
                
                
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr.getInt(6));
                    objLote.setNombre(dr.getString(7));
                    
                    
                    entCampania objCampania = new entCampania();
                    objCampania.setId_campania(dr.getInt(8));
                    objCampania.setNombre(dr.getString(9));
                    
                    entCampaniaLote entidad = new entCampaniaLote();
                    entidad.setId_campania_lote(dr.getInt(1));
                    entidad.setFechaPodaFormacion(dr.getTimestamp(2)); 
                    entidad.setNumero_plantas(dr.getInt(3)); 
                    entidad.setUsuario_responsable(dr.getString(4));
                    entidad.setFecha_modificacion(dr.getTimestamp(5));
                    entidad.setObjCampania(objCampania);
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
    
    public  static int insertar(entCampaniaLote entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO campania_lote(id_lote,id_campania,fecha_poda_formacion,numero_plantas,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjLote().getId_lote());
            stmt.setInt(2, entidad.getObjCampania().getId_campania());
            stmt.setDate(3, new java.sql.Date(entidad.getFechaPodaFormacion().getTime()));
            stmt.setInt(4,entidad.getNumero_plantas());
            stmt.setString(5, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entCampaniaLote entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE campania_lote SET id_lote = ?,id_campania= ?,fecha_poda_formacion=?, "
                     + "numero_plantas=?,usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_campania_lote = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setInt(1, entidad.getObjLote().getId_lote());
            stmt.setInt(2, entidad.getObjCampania().getId_campania());
            stmt.setTimestamp(3, new Timestamp(entidad.getFechaPodaFormacion().getTime()));
            stmt.setInt(4, entidad.getNumero_plantas());
            stmt.setString(5, entidad.getUsuario_responsable());
            stmt.setInt(6,entidad.getId_campania_lote());
                
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
