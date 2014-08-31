/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entPaleta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

/**
 *
 * @author rosemary
 */
public class PaletaDAO {
    
        
    public static boolean actualizar(entPaleta entidad) throws Exception
    {
        boolean rpta1 = false;
        Connection conn =null;
        CallableStatement stmt1 = null;
        try {
             String sql="UPDATE paleta SET id_cliente = ?,id_estado_paleta= ?,usuario_responsable = ?,fecha_modificacion = GETDATE() "
                     + " WHERE id_paleta = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt1 = conn.prepareCall(sql); 
            stmt1.setInt(1, entidad.getObjCliente().getId_cliente());
            stmt1.setInt(2, entidad.getId_estado_paleta());
            stmt1.setString(9, entidad.getUsuario_responsable());
            stmt1.setInt(10,entidad.getId_paleta());                
            rpta1 = stmt1.executeUpdate() == 1;
            if(rpta1)
            {   
                for(int i=0; i<entidad.getListaDetallePaleta().size();i++)
                {
                    sql="UPDATE DET_PALETA SET ESTADO= ?,FECHA_MODIFICACION=GETDATE() "
                         + " WHERE ID_DET_PALETA = ?;";
                    CallableStatement stmt2 = conn.prepareCall(sql);    
                    stmt2.setInt(1, entidad.getId_estado_paleta());
                    stmt2.setInt(7, entidad.getListaDetallePaleta().get(i).getId_det_paleta());
                    stmt2.executeUpdate();
                    stmt2.close();
                }
                PreparedStatement  stmt = null;    
                String sql0="INSERT INTO det_estado_paleta(id_paleta,estado_nuevo,fecha_modificacion)"
                       + " VALUES(?,?,GETDATE());";

                conn = ConexionDAO.getConnection();
                stmt = conn.prepareStatement(sql0, Statement.RETURN_GENERATED_KEYS);
                stmt.setInt(1, entidad.getId_paleta());
                stmt.setInt(2, entidad.getId_estado_paleta());
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                
            }
           conn.commit();
        } catch (Exception e) {
             if (conn != null) {
                    conn.rollback();
                }
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally{
            try {
                stmt1.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return rpta1;
    }

    
}
