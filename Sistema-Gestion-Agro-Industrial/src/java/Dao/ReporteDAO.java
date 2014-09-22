
package Dao;


import Entidades.entReporte;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;


import java.util.ArrayList;
import java.util.List;

public class ReporteDAO {    
    public static List<entReporte> listarStockResumen(int Posicion, int Estado) throws Exception {
        List<entReporte> listReporte = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql=" exec SP_reporte_stock_resumen "+Posicion+","+Estado;
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                 if(listReporte == null)
                    listReporte = new ArrayList<entReporte>();
                    entReporte Reporte = new entReporte();
                    Reporte.setParametro_1(dr.getString(1));
                    Reporte.setParametro_2(dr.getString(2));
                    Reporte.setParametro_3(dr.getString(3));
                    Reporte.setParametro_4(""+dr.getDouble(4));
                    Reporte.setParametro_5(dr.getString(5));
                    Reporte.setParametro_6(dr.getString(6));
                    Reporte.setParametro_7(""+dr.getInt(7));
                    Reporte.setParametro_8(""+dr.getDouble(8));
                    listReporte.add(Reporte);
            }
        } catch (Exception e) {
            throw new Exception("Listar Reporte "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return listReporte;
    } 
    
      public static List<entReporte> listarCajasEmbaladasXTrabajador(int Operacion, String Inicio, String Fin) throws Exception {
        List<entReporte> listReporte = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql=" exec SP_reporte_cajas_embaladas_por_trabajador "+Operacion+",'"+Inicio+"','"+Fin+"'";
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                 if(listReporte == null)
                    listReporte = new ArrayList<entReporte>();
                    entReporte Reporte = new entReporte();
                    Reporte.setParametro_1(dr.getString(1));
                    Reporte.setParametro_2(dr.getString(2));
                    Reporte.setParametro_3(dr.getString(3));
                    Reporte.setParametro_4(""+dr.getInt(4));
                    listReporte.add(Reporte);
            }
        } catch (Exception e) {
            throw new Exception("Listar Reporte "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return listReporte;
    } 
}
