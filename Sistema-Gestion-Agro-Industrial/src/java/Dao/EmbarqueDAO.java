/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entEmbarque;
import Entidades.entCliente;
import Entidades.entDetalleEmbarque;
import Entidades.entPaleta;
import Entidades.entTunel;
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
public class EmbarqueDAO 
{
    public  static int insertar(entEmbarque entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {

           String sql="INSERT INTO EMBARQUE(ID_CLIENTE_FACTURABLE,ID_EXPORTADOR,ID_CONSIGNATARIO,"
                   + "ID_OPERADOR_LOGISTICO,ID_VIA_EMBARQUE,ID_LINEA_NAVIERA,PREC_OP_LOGISTICO,"
                   + "ID_CONTENEDOR,ID_PTO_EMBARQUE,ID_PTO_DESTINO,PREC_SENASA,PREC_ADUANAS,PREC_LINEA_NAV,"
                   + "VAPOR,CONTAINER,ID_CHOFER,PLACA_CONTAINER,PLACA_CARRETA,FECHA_TRASLADO,FECHA_PARTIDA,"
                   + "FECHA_ARRIBO,ID_DISTRITO_ORIGEN,COLD_TREAT,PACKING_LIST,T_SET_POINT,T_DESPACHO,"
                   + "VENTILACION,HUMEDAD,CANT_FILTROS,BOOKING,HORA_INICIO,HORA_FIN,USUARIO_RESPONSABLE,"
                   + "FECHA_MODIFICACION)values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
                   + "?,?,?,?,?,?,GETDATE())";

            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjClienteFacturable().getId_cliente());
            stmt.setInt(2, entidad.getObjClienteExportador().getId_cliente());
            stmt.setInt(3, entidad.getObjClienteConsignatario().getId_cliente());
            stmt.setInt(4, entidad.getObjOperadorLogistico().getId_operador_logistico());
            stmt.setInt(5, entidad.getObjViaEmbarque().getId_via_embarque());
            stmt.setInt(6, entidad.getObjLineaNaviera().getId_linea_naviera());
            stmt.setString(7, entidad.getPrec_op_logistico());
            stmt.setInt(8, entidad.getObjContenedor().getId_contenedor());
            stmt.setInt(9, entidad.getObjPuertoEmabarque().getId_puerto());
            stmt.setInt(10, entidad.getObjPuertoDestino().getId_puerto());
            stmt.setString(11, entidad.getPrec_senasa());
            stmt.setString(12, entidad.getPrec_aduanas());
            stmt.setString(13, entidad.getPrec_linea_nav());
            stmt.setString(14, entidad.getVapor());
            stmt.setString(15, entidad.getContainer());
            stmt.setInt(16, entidad.getObjChofer().getId_chofer());
            stmt.setString(17, entidad.getPlaca_container());
            stmt.setString(18, entidad.getPlaca_carreta());
            stmt.setTimestamp(19, new Timestamp(entidad.getFecha_traslado().getTime()));
            stmt.setTimestamp(20, new Timestamp(entidad.getFecha_partida().getTime()));
            stmt.setTimestamp(21, new Timestamp(entidad.getFecha_arribo().getTime()));
            stmt.setInt(22, entidad.getObjDistrito().getId_istrito());
            stmt.setBoolean(23, entidad.isCold_treat());
            stmt.setString(24, entidad.getPacking_list());
            stmt.setDouble(25, entidad.getT_set_point());
            stmt.setDouble(26, entidad.getT_despacho());
            stmt.setDouble(27, entidad.getVentilacion());
            stmt.setDouble(28, entidad.getHumedad());
            stmt.setDouble(29, entidad.getCant_filtros());
            stmt.setString(30, entidad.getBooking());
            stmt.setTimestamp(31, new Timestamp(entidad.getHora_inicio().getTime()));
            stmt.setTimestamp(32, new Timestamp(entidad.getHora_fin().getTime()));
            stmt.setString(33, entidad.getUsuario_responsable());

            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next())
            {
                rpta=rs.getInt(1);
                for(int i=0; i<entidad.getList().size();i++)
                {
                sql="INSERT INTO DET_EMBARQUE(ID_EMBARQUE,ID_PALETA,POS_X,POS_Y,SENSOR,THERMOREGISTRO)"
                            + " VALUES(?,?,?,?,?,?);";
                    PreparedStatement pst1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    pst1.setInt(1,rpta);
                    pst1.setInt(2,entidad.getList().get(i).getObjPaleta().getId_paleta());
                    pst1.setInt(3,entidad.getList().get(i).getPos_x());
                    pst1.setInt(4,entidad.getList().get(i).getPos_y());
                    pst1.setInt(5,entidad.getList().get(i).getSensor());
                    pst1.setString(6,entidad.getList().get(i).getThermoregistro());
                    pst1.executeUpdate();

                sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,4,GETDATE());";                
                PreparedStatement psEstado = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                psEstado.setInt(1, entidad.getList().get(i).getObjPaleta().getId_paleta());
                psEstado.execute();
                psEstado.close(); 

                sql="update PALETA set POSICION_PALETA=4 where ID_PALETA=?;";
                            PreparedStatement psEstadoPaleta = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                            psEstadoPaleta.setInt(1,entidad.getList().get(i).getObjPaleta().getId_paleta());
                            psEstadoPaleta.execute();
                            psEstadoPaleta.close();  

                }

            }
            rs.close();
            conn.commit();
        } catch (Exception e) {
             if (conn != null) {
                    conn.rollback();
                }
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
