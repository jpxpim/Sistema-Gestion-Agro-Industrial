/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entRaleo;
import Entidades.entCabeceraRaleo;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class RaleoDAO {

    public static entRaleo BuscarPorId(int id) throws Exception
     {
        entRaleo entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr1 = null;
        try {
            String sql="select D.ID_RALEO, D.FECHA_REGISTRO,D.ESTADO,D.USUARIO_RESPONSABLE,D.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE,CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +                        
                        "C.ID_CAMPANIA,C.NOMBRE, C.FECHA_INICIO,C.FECHA_FIN,\n" +
                        "L.ID_LOTE,L.NOMBRE,L.HECTAREAS,L.ANIO_SIEMBRA,\n" +                    
                        "V.ID_VARIEDAD,V.NOMBRE,V.CODIGO_CONTROL,\n" +
                        "CV.ID_CULTIVO,CV.NOMBRE\n" +
                        " from RALEO D\n" +
                        " JOIN EVALUADOR E ON D.ID_EVALUADOR=E.ID_EVALUADOR\n" +
                        " JOIN CAMPANIA_LOTE CL ON  D.ID_CAMPANIA_LOTE=CL.ID_CAMPANIA_LOTE\n" +
                        " JOIN CAMPANIA C ON CL.ID_CAMPANIA=C.ID_CAMPANIA\n" +
                        " JOIN LOTE L ON CL.ID_LOTE=L.ID_LOTE\n" +
                        " JOIN VARIEDAD V ON L.ID_VARIEDAD=V.ID_VARIEDAD\n" +
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO where D.ID_RALEO="+id; 

            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareCall(sql);
            dr1 = stmt.executeQuery();

            if(dr1.next())
            {
                    //Evaluador
                    entEvaluador objEvaluador = new entEvaluador();
                    objEvaluador.setId_evaluador(dr1.getInt(6));
                    objEvaluador.setNombre(dr1.getString(7)); 
                    objEvaluador.setApellido(dr1.getString(8)); 
                    objEvaluador.setCodigo_erp(dr1.getString(9));        
                    //Cultivo
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr1.getInt(24));
                    objCultivo.setNombre(dr1.getString(25)); 
                    //Variedad
                    entVariedad objVariedad = new entVariedad();
                    objVariedad.setId_variedad(dr1.getInt(21));
                    objVariedad.setNombre(dr1.getString(22)); 
                    objVariedad.setCodigo_control(dr1.getString(23));
                    objVariedad.setObjCultivo(objCultivo);
                    //Lote
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr1.getInt(17));
                    objLote.setNombre(dr1.getString(18)); 
                    objLote.setHectareas(dr1.getDouble(19));
                    objLote.setAnio_siembra(dr1.getInt(20));
                    objLote.setObjVariedad(objVariedad);
                    //Campania
                    entCampania objCampania = new entCampania();
                    objCampania.setId_campania(dr1.getInt(13));
                    objCampania.setNombre(dr1.getInt(14)); 
                    objCampania.setFecha_inicio(dr1.getTimestamp(15)); 
                    objCampania.setFecha_fin(dr1.getTimestamp(16));
                    
                    //Campania_Lote
                    entCampaniaLote objCampaniaLote = new entCampaniaLote();
                    objCampaniaLote.setId_campania_lote(dr1.getInt(10));
                    objCampaniaLote.setFechaPodaFormacion(dr1.getTimestamp(11)); 
                    objCampaniaLote.setNumero_plantas(dr1.getInt(12)); 
                    objCampaniaLote.setObjCampania(objCampania);
                    objCampaniaLote.setObjLote(objLote);
                    
                    //Analisis_Raleo
                    entidad = new entRaleo();
                    entidad.setId_raleo(dr1.getInt(1));
                    entidad.setFecha_registro(dr1.getTimestamp(2));                     
                    entidad.setEstado(dr1.getBoolean(3)); 
                    entidad.setUsuario_responsable(dr1.getString(4)); 
                    entidad.setFecha_modificacion(dr1.getTimestamp(5)); 
                    entidad.setObjCampaniaLote(objCampaniaLote);
                    entidad.setObjEvaluador(objEvaluador);
                    
                    List<entCabeceraRaleo> listaCabecera = null;
                    sql="select ID_CABECERA_RALEO,ID_RALEO,POSICION,NUM_HILERA,NUM_PLANTA,NUM_RACIMO_PLANTA,NUM_BAYA_1,NUM_BAYA_2,NUM_BAYA_3,"
                        + "TIPO_RACIMO_1,TIPO_RACIMO_2,TIPO_RACIMO_3,CALIDAD_RACIMO_1,CALIDAD_RACIMO_2,CALIDAD_RACIMO_3,LARGO_RACIMO_1"
                        + ",LARGO_RACIMO_2,LARGO_RACIMO_3,OBSERVACION_1,OBSERVACION_2,OBSERVACION_3 from CABECERA_RALEO where ID_RALEO="+entidad.getId_raleo()+" order by POSICION asc";
                    CallableStatement ct1 = conn.prepareCall(sql);
                    ResultSet dr2 = ct1.executeQuery();
                        while(dr2.next())
                        {           
                            if(listaCabecera==null)
                            listaCabecera= new ArrayList<entCabeceraRaleo>();
                            
                            entCabeceraRaleo objCabeceraRaleo = new entCabeceraRaleo();
                            objCabeceraRaleo.setId_cabecera_raleo(dr2.getInt(1));
                            objCabeceraRaleo.setId_raleo(dr2.getInt(2));
                            objCabeceraRaleo.setPosicion(dr2.getInt(3));
                            objCabeceraRaleo.setNum_hilera(dr2.getInt(4));
                            objCabeceraRaleo.setNum_planta(dr2.getInt(5));
                            objCabeceraRaleo.setNum_racimo_planta(dr2.getInt(6));
                            objCabeceraRaleo.setNum_baya_1(dr2.getInt(7));
                            objCabeceraRaleo.setNum_baya_2(dr2.getInt(8));
                            objCabeceraRaleo.setNum_baya_3(dr2.getInt(9));
                            objCabeceraRaleo.setTipo_racimo_1(dr2.getInt(10));
                            objCabeceraRaleo.setTipo_racimo_2(dr2.getInt(11));
                            objCabeceraRaleo.setTipo_racimo_3(dr2.getInt(12));
                            objCabeceraRaleo.setCalidad_racimo_1(dr2.getInt(13));
                            objCabeceraRaleo.setCalidad_racimo_2(dr2.getInt(14));
                            objCabeceraRaleo.setCalidad_racimo_3(dr2.getInt(15));
                            objCabeceraRaleo.setLargo_racimo_1(dr2.getInt(16));
                            objCabeceraRaleo.setLargo_racimo_2(dr2.getInt(17));
                            objCabeceraRaleo.setLargo_racimo_3(dr2.getInt(18));
                            objCabeceraRaleo.setObservaciones_1(dr2.getString(19));
                            objCabeceraRaleo.setObservaciones_2(dr2.getString(20));                            
                            objCabeceraRaleo.setObservaciones_3(dr2.getString(21));                            
                            
                            
                            listaCabecera.add(objCabeceraRaleo);
                        }
                    entidad.setList(listaCabecera);
                    ct1.close();
                    dr2.close();
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
                dr1.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return entidad;
    }
    public static List<entRaleo> Listar(boolean activo) throws Exception
    {
        List<entRaleo> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select D.ID_RALEO, D.FECHA_REGISTRO,D.ESTADO,D.USUARIO_RESPONSABLE,D.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE,CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +                        
                        "C.ID_CAMPANIA,C.NOMBRE, C.FECHA_INICIO,C.FECHA_FIN,\n" +
                        "L.ID_LOTE,L.NOMBRE,L.HECTAREAS,L.ANIO_SIEMBRA,\n" +                    
                        "V.ID_VARIEDAD,V.NOMBRE,V.CODIGO_CONTROL,\n" +
                        "CV.ID_CULTIVO,CV.NOMBRE\n" +
                        " from RALEO D\n" +
                        " JOIN EVALUADOR E ON D.ID_EVALUADOR=E.ID_EVALUADOR\n" +
                        " JOIN CAMPANIA_LOTE CL ON  D.ID_CAMPANIA_LOTE=CL.ID_CAMPANIA_LOTE\n" +
                        " JOIN CAMPANIA C ON CL.ID_CAMPANIA=C.ID_CAMPANIA\n" +
                        " JOIN LOTE L ON CL.ID_LOTE=L.ID_LOTE\n" +
                        " JOIN VARIEDAD V ON L.ID_VARIEDAD=V.ID_VARIEDAD\n" +
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO";
            if(activo)
                        sql+=" where D.estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entRaleo>();
                    //Evaluador
                    entEvaluador objEvaluador = new entEvaluador();
                    objEvaluador.setId_evaluador(dr.getInt(6));
                    objEvaluador.setNombre(dr.getString(7)); 
                    objEvaluador.setApellido(dr.getString(8)); 
                    objEvaluador.setCodigo_erp(dr.getString(9));        
                    //Cultivo
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr.getInt(24));
                    objCultivo.setNombre(dr.getString(25)); 
                    //Variedad
                    entVariedad objVariedad = new entVariedad();
                    objVariedad.setId_variedad(dr.getInt(21));
                    objVariedad.setNombre(dr.getString(22)); 
                    objVariedad.setCodigo_control(dr.getString(23));
                    objVariedad.setObjCultivo(objCultivo);
                    //Lote
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr.getInt(17));
                    objLote.setNombre(dr.getString(18)); 
                    objLote.setHectareas(dr.getDouble(19));
                    objLote.setAnio_siembra(dr.getInt(20));
                    objLote.setObjVariedad(objVariedad);
                    //Campania
                    entCampania objCampania = new entCampania();
                    objCampania.setId_campania(dr.getInt(13));
                    objCampania.setNombre(dr.getInt(14)); 
                    objCampania.setFecha_inicio(dr.getTimestamp(15)); 
                    objCampania.setFecha_fin(dr.getTimestamp(16));
                    
                    //Campania_Lote
                    entCampaniaLote objCampaniaLote = new entCampaniaLote();
                    objCampaniaLote.setId_campania_lote(dr.getInt(10));
                    objCampaniaLote.setFechaPodaFormacion(dr.getTimestamp(11)); 
                    objCampaniaLote.setNumero_plantas(dr.getInt(12)); 
                    objCampaniaLote.setObjCampania(objCampania);
                    objCampaniaLote.setObjLote(objLote);
                    
                    //Analisis_Raleo
                    entRaleo entidad = new entRaleo();
                    entidad.setId_raleo(dr.getInt(1));
                    entidad.setFecha_registro(dr.getTimestamp(2));                     
                    entidad.setEstado(dr.getBoolean(3)); 
                    entidad.setUsuario_responsable(dr.getString(4)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(5)); 
                    entidad.setObjCampaniaLote(objCampaniaLote);
                    entidad.setObjEvaluador(objEvaluador);
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
    
    public  static int insertar(entRaleo entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO raleo(id_campania_lote,id_evaluador,estado,usuario_responsable,fecha_modificacion,fecha_registro)"
                   + " VALUES(?,?,?,?,GETDATE(),GETDATE());";
           
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt.setBoolean(3, entidad.isEstado());
            stmt.setString(4, entidad.getUsuario_responsable());
            stmt.executeUpdate();
            ResultSet rs1 = stmt.getGeneratedKeys();            
            if (rs1.next()){
                rpta=rs1.getInt(1);
                for(int i=0; i<entidad.getList().size();i++)
                {
                sql="INSERT INTO CABECERA_RALEO(ID_RALEO,POSICION,NUM_HILERA,NUM_PLANTA,NUM_RACIMO_PLANTA,NUM_BAYA_1,NUM_BAYA_2,NUM_BAYA_3,"
                        + "TIPO_RACIMO_1,TIPO_RACIMO_2,TIPO_RACIMO_3,CALIDAD_RACIMO_1,CALIDAD_RACIMO_2,CALIDAD_RACIMO_3,LARGO_RACIMO_1"
                        + ",LARGO_RACIMO_2,LARGO_RACIMO_3,OBSERVACION_1,OBSERVACION_2,OBSERVACION_3)"
                            + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                    PreparedStatement pst1 = conn.prepareStatement(sql);
                    pst1.setInt(1, rpta);
                    pst1.setInt(2,(i+1));
                    pst1.setInt(3, entidad.getList().get(i).getNum_hilera());
                    pst1.setInt(4, entidad.getList().get(i).getNum_planta());
                    pst1.setInt(5, entidad.getList().get(i).getNum_racimo_planta());
                    pst1.setInt(6, entidad.getList().get(i).getNum_baya_1());
                    pst1.setInt(7, entidad.getList().get(i).getNum_baya_2());
                    pst1.setInt(8, entidad.getList().get(i).getNum_baya_3());
                    pst1.setInt(9, entidad.getList().get(i).getTipo_racimo_1());
                    pst1.setInt(10, entidad.getList().get(i).getTipo_racimo_2());
                    pst1.setInt(11, entidad.getList().get(i).getTipo_racimo_3());
                    pst1.setInt(12, entidad.getList().get(i).getCalidad_racimo_1());
                    pst1.setInt(13, entidad.getList().get(i).getCalidad_racimo_2());
                    pst1.setInt(14, entidad.getList().get(i).getCalidad_racimo_3());
                    pst1.setInt(15, entidad.getList().get(i).getLargo_racimo_1());
                    pst1.setInt(16, entidad.getList().get(i).getLargo_racimo_2());
                    pst1.setInt(17, entidad.getList().get(i).getLargo_racimo_3());
                    pst1.setString(18, entidad.getList().get(i).getObservaciones_1());
                    pst1.setString(19, entidad.getList().get(i).getObservaciones_2());
                    pst1.setString(20, entidad.getList().get(i).getObservaciones_3());
                    pst1.execute();
                    pst1.close();
                }
            }
            rs1.close();
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
    
    public static boolean actualizar(entRaleo entidad) throws Exception
    {
        boolean rpta1 = false;
        Connection conn =null;
        CallableStatement stmt1 = null;
        try {
             String sql="UPDATE RALEO SET id_campania_lote = ?,id_evaluador= ?,estado=?,usuario_responsable = ?,fecha_modificacion = GETDATE() "
                     + " WHERE id_raleo = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt1 = conn.prepareCall(sql); 
            stmt1.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt1.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt1.setBoolean(3, entidad.isEstado());
            stmt1.setString(4, entidad.getUsuario_responsable());
            stmt1.setInt(5,entidad.getId_raleo());                
            rpta1 = stmt1.executeUpdate() == 1;
            if(rpta1)
            {   
                for(int i=0; i<entidad.getList().size();i++)
                {        
                    sql="UPDATE CABECERA_RALEO SET NUM_HILERA = ?,NUM_PLANTA = ?,NUM_RACIMO_PLANTA = ?,NUM_BAYA_1 = ?,NUM_BAYA_2 = ?,NUM_BAYA_3 = ?,"
                        + "TIPO_RACIMO_1 = ?,TIPO_RACIMO_2 = ?,TIPO_RACIMO_3 = ?,CALIDAD_RACIMO_1 = ?,CALIDAD_RACIMO_2 = ?,CALIDAD_RACIMO_3 = ?,"
                            + "LARGO_RACIMO_1 = ?,LARGO_RACIMO_2 = ?,LARGO_RACIMO_3 = ?,OBSERVACION_1 = ?,OBSERVACION_2 = ?,OBSERVACION_3 = ? WHERE ID_CABECERA_RALEO = ?;";
                    CallableStatement stmt2 = conn.prepareCall(sql);    
                    stmt2.setInt(1, entidad.getList().get(i).getNum_hilera());
                    stmt2.setInt(2, entidad.getList().get(i).getNum_planta());
                    stmt2.setInt(3, entidad.getList().get(i).getNum_racimo_planta());
                    stmt2.setInt(4, entidad.getList().get(i).getNum_baya_1());
                    stmt2.setInt(5, entidad.getList().get(i).getNum_baya_2());
                    stmt2.setInt(6, entidad.getList().get(i).getNum_baya_3());
                    stmt2.setInt(7, entidad.getList().get(i).getTipo_racimo_1());
                    stmt2.setInt(8, entidad.getList().get(i).getTipo_racimo_2());
                    stmt2.setInt(9, entidad.getList().get(i).getTipo_racimo_3());
                    stmt2.setInt(10, entidad.getList().get(i).getCalidad_racimo_1());
                    stmt2.setInt(11, entidad.getList().get(i).getCalidad_racimo_2());
                    stmt2.setInt(12, entidad.getList().get(i).getCalidad_racimo_3());
                    stmt2.setInt(13, entidad.getList().get(i).getLargo_racimo_1());
                    stmt2.setInt(14, entidad.getList().get(i).getLargo_racimo_2());
                    stmt2.setInt(15, entidad.getList().get(i).getLargo_racimo_3());
                    stmt2.setString(16, entidad.getList().get(i).getObservaciones_1());
                    stmt2.setString(17, entidad.getList().get(i).getObservaciones_2());
                    stmt2.setString(18, entidad.getList().get(i).getObservaciones_3());
                    stmt2.setInt(19, entidad.getList().get(i).getId_cabecera_raleo());
                    stmt2.executeUpdate();             
                    stmt2.close();
                }
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
