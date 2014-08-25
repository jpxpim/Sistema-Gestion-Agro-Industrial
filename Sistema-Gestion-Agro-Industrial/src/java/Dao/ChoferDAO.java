/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entChofer;
import Entidades.entTransportista;
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
public class ChoferDAO 
{
    
    public static List<entChofer> Listar(boolean activo) throws Exception
    {
        List<entChofer> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="SELECT C.ID_CHOFER,C.NOMBRE,C.BREVETE,C.ESTADO,C.USUARIO_RESPONSABLE,C.FECHA_MODIFICACION ,\n" +
                "T.ID_TRANSPORTISTA,T.RAZON_SOCIAL,T.RUC,T.ESTADO,T.USUARIO_RESPONSABLE,T.FECHA_MODIFICACION\n" +
                "FROM CHOFER C\n" +
                "JOIN TRANSPORTISTA T ON C.ID_TRANSPORTISTA=T.ID_TRANSPORTISTA  ";
            if(activo)
                        sql+=" where C.estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entChofer>();
                    //transportista
                    entTransportista objTransportista= new entTransportista();
                    objTransportista.setId_transportista(dr.getInt(7));
                    objTransportista.setRazon_social(dr.getString(8)); 
                    objTransportista.setRuc(dr.getString(9)); 
                    objTransportista.setEstado(dr.getBoolean(10)); 
                    objTransportista.setUsuario_responsable(dr.getString(11)); 
                    objTransportista.setFecha_modificacion(dr.getTimestamp(12));
                    //chofer
                    entChofer entidad = new entChofer();
                    entidad.setId_chofer(dr.getInt(1));
                    entidad.setNombre(dr.getString(2)); 
                    entidad.setBrevete(dr.getString(3)); 
                    entidad.setEstado(dr.getBoolean(4)); 
                    entidad.setUsuario_responsable(dr.getString(5)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(6)); 
                    entidad.setObjTransportista(objTransportista);
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
    
    public  static int insertar(entChofer entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO chofer(id_transportista,nombre,brevete,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjTransportista().getId_transportista());
            stmt.setString(2, entidad.getNombre());
            stmt.setString(3, entidad.getBrevete());
            stmt.setBoolean(4, entidad.getEstado());
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
    
    public static boolean actualizar(entChofer entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE chofer SET nombre = ?,brevete= ?,estado= ?,"
                     + " usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_chofer = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getNombre());
            stmt.setString(2, entidad.getBrevete());
            stmt.setBoolean(3, entidad.getEstado());
            stmt.setString(4, entidad.getUsuario_responsable());
            stmt.setInt(5,entidad.getId_chofer());
                
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
