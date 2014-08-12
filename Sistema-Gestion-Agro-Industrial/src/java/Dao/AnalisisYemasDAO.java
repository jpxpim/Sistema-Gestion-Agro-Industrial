/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entAnalisisYemas;
import Entidades.entCampania;
import Entidades.entCampaniaLote;
import Entidades.entCultivo;
import Entidades.entEvaluador;
import Entidades.entLote;
import Entidades.entVariedad;
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
public class AnalisisYemasDAO 
{
    public static List<entAnalisisYemas> Listar(boolean activo) throws Exception
    {
        List<entAnalisisYemas> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select AY.ID_ANALISIS_YEMAS, AY.FEMINELAS,AY.FERTILIDAD,AY.FECHA_MUESTRA,AY.ESTADO,AY.USUARIO_RESPONSABLE,AY.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE, CL.ID_LOTE, CL.ID_CAMPANIA, CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +
                        "C.ID_CAMPANIA,C.NOMBRE, C.FECHA_INICIO,C.FECHA_FIN,\n" +
                        "L.ID_LOTE,L.NOMBRE,L.HECTAREAS,L.ANIO_SIEMBRA,\n" +
                        "V.ID_VARIEDAD,V.NOMBRE,V.CODIGO_CONTROL,\n" +
                        "CV.ID_CULTIVO,CV.NOMBRE\n" +
                        " from ANALISIS_YEMAS AY\n" +
                        " JOIN EVALUADOR E ON AY.ID_EVALUADOR=E.ID_EVALUADOR\n" +
                        " JOIN CAMPANIA_LOTE CL ON  AY.ID_CAMPANIA_LOTE=CL.ID_CAMPANIA_LOTE\n" +
                        " JOIN CAMPANIA C ON CL.ID_CAMPANIA=C.ID_CAMPANIA\n" +
                        " JOIN LOTE L ON CL.ID_LOTE=L.ID_LOTE\n" +
                        " JOIN VARIEDAD V ON L.ID_VARIEDAD=V.ID_VARIEDAD\n" +
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO";
            if(activo)
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entAnalisisYemas>();
                    //Evaluador
                    entEvaluador objEvaluador = new entEvaluador();
                    objEvaluador.setId_evaluador(dr.getInt(8));
                    objEvaluador.setNombre(dr.getString(9)); 
                    objEvaluador.setApellido(dr.getString(10)); 
                    objEvaluador.setCodigo_erp(dr.getString(11));        
                    //Cultivo
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr.getInt(28));
                    objCultivo.setNombre(dr.getString(29)); 
                    //Variedad
                    entVariedad objVariedad = new entVariedad();
                    objVariedad.setId_variedad(dr.getInt(25));
                    objVariedad.setNombre(dr.getString(26)); 
                    objVariedad.setCodigo_control(dr.getString(27));
                    objVariedad.setObjCultivo(objCultivo);
                    //Lote
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr.getInt(21));
                    objLote.setNombre(dr.getString(22)); 
                    objLote.setHectareas(dr.getDouble(23));
                    objLote.setAnio_siembra(dr.getInt(24));
                    objLote.setObjVariedad(objVariedad);
                    //Campania
                    entCampania objCampania = new entCampania();
                    objCampania.setId_campania(dr.getInt(17));
                    objCampania.setNombre(dr.getInt(18)); 
                    objCampania.setFecha_inicio(dr.getTimestamp(19)); 
                    objCampania.setFecha_fin(dr.getTimestamp(20));
                    //Campania_Lote
                    entCampaniaLote objCampaniaLote = new entCampaniaLote();
                    objCampaniaLote.setId_campania_lote(dr.getInt(12));
                    objCampaniaLote.setFechaPodaFormacion(dr.getTimestamp(15)); 
                    objCampaniaLote.setNumero_plantas(dr.getInt(16)); 
                    objCampaniaLote.setObjCampania(objCampania);
                    objCampaniaLote.setObjLote(objLote);
                    
                    //Analisis_Yemas
                    entAnalisisYemas entidad = new entAnalisisYemas();
                    entidad.setId_analisis_yemas(dr.getInt(1));
                    entidad.setFeminelas(dr.getDouble(2)); 
                    entidad.setFertilidad(dr.getDouble(3)); 
                    entidad.setFecha_muestra(dr.getTimestamp(4));
                    entidad.setEstado(dr.getBoolean(5)); 
                    entidad.setUsuario_responsable(dr.getString(6)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(7)); 
                    entidad.setObjCampaniaLote(objCampaniaLote);
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
    
    public  static int insertar(entAnalisisYemas entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO analisis_yemas(id_campania_lote,id_evaluador,feminelas,fertilidad,fecha_muestra,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt.setDouble(3, entidad.getFeminelas());
            stmt.setDouble(4, entidad.getFertilidad());
            stmt.setTimestamp(5, new Timestamp(entidad.getFecha_muestra().getTime()));            
            stmt.setBoolean(6, entidad.getEstado());
            stmt.setString(7, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entAnalisisYemas entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE analisis_yemas SET id_campania_lote = ?,id_evaluador= ?,feminelas=?,fertilidad= ?,"
                     + " fecha_muestra=?,estado=?,usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_analisis_yemas = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql); 
            stmt.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt.setDouble(3, entidad.getFeminelas());
            stmt.setDouble(4, entidad.getFertilidad());
            stmt.setTimestamp(5, new Timestamp(entidad.getFecha_muestra().getTime()));            
            stmt.setBoolean(6, entidad.getEstado());
            stmt.setString(7, entidad.getUsuario_responsable());
            stmt.setInt(8,entidad.getId_analisis_yemas());
                
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
