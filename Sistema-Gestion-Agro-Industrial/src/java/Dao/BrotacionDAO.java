/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entBrotacion;
import Entidades.entCabeceraBrotacion;
import Entidades.entCampania;
import Entidades.entCampaniaLote;
import Entidades.entCultivo;
import Entidades.entDetalleBrotacion;
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
public class BrotacionDAO {

    public static entBrotacion BuscarPorId(int id) throws Exception
     {
        entBrotacion entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr1 = null;
        try {
            String sql="select B.ID_BROTACION, B.FECHA_REGISTRO,B.ESTADO,B.USUARIO_RESPONSABLE,B.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE,CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +                        
                        "C.ID_CAMPANIA,C.NOMBRE, C.FECHA_INICIO,C.FECHA_FIN,\n" +
                        "L.ID_LOTE,L.NOMBRE,L.HECTAREAS,L.ANIO_SIEMBRA,\n" +                    
                        "V.ID_VARIEDAD,V.NOMBRE,V.CODIGO_CONTROL,\n" +
                        "CV.ID_CULTIVO,CV.NOMBRE\n" +
                        " from BROTACION B\n" +
                        " JOIN EVALUADOR E ON B.ID_EVALUADOR=E.ID_EVALUADOR\n" +
                        " JOIN CAMPANIA_LOTE CL ON  B.ID_CAMPANIA_LOTE=CL.ID_CAMPANIA_LOTE\n" +
                        " JOIN CAMPANIA C ON CL.ID_CAMPANIA=C.ID_CAMPANIA\n" +
                        " JOIN LOTE L ON CL.ID_LOTE=L.ID_LOTE\n" +
                        " JOIN VARIEDAD V ON L.ID_VARIEDAD=V.ID_VARIEDAD\n" +
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO where B.ID_BROTACION="+id; 

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
                    
                    //Analisis_Brotacion
                    entidad = new entBrotacion();
                    entidad.setId_brotacion(dr1.getInt(1));
                    entidad.setFecha_registro(dr1.getTimestamp(2));                     
                    entidad.setEstado(dr1.getBoolean(3)); 
                    entidad.setUsuario_responsable(dr1.getString(4)); 
                    entidad.setFecha_modificacion(dr1.getTimestamp(5)); 
                    entidad.setObjCampaniaLote(objCampaniaLote);
                    entidad.setObjEvaluador(objEvaluador);
                    
                    List<entCabeceraBrotacion> listaCabecera = null;
                    sql="select ID_CABECERA_BROTACION,ID_BROTACION,POSICION,NUM_HILERA,NUM_PLANTA,NUM_SALIDA_PLANTA,NUM_CARGADOR_PLANTA from "
                            + "CABECERA_BROTACION where ID_BROTACION="+entidad.getId_brotacion()+" order by POSICION asc";
                    CallableStatement ct1 = conn.prepareCall(sql);
                    ResultSet dr2 = ct1.executeQuery();
                        while(dr2.next())
                        {           
                            if(listaCabecera==null)
                            listaCabecera= new ArrayList<entCabeceraBrotacion>();
                            
                            entCabeceraBrotacion objCabeceraBrotacion = new entCabeceraBrotacion();
                            objCabeceraBrotacion.setId_cabecera_brotacion(dr2.getInt(1));
                            objCabeceraBrotacion.setId_brotacion(dr2.getInt(2));
                            objCabeceraBrotacion.setPosicion(dr2.getInt(3));
                            objCabeceraBrotacion.setNum_hilera(dr2.getInt(4));
                            objCabeceraBrotacion.setNum_planta(dr2.getInt(5));
                            objCabeceraBrotacion.setNum_salida_planta(dr2.getInt(6));
                            objCabeceraBrotacion.setNum_cargador_planta(dr2.getInt(7));                            
                            
                            List<entDetalleBrotacion> listaDetalle=null;
                            
                            sql=" select id_det_brotacion, id_cabecera_brotacion, posicion, num_1,num_2,num_3,num_4,num_5,num_6,num_7,num_8,num_9,num_10,num_11,num_12\n" +
                            " from DET_BROTACION where id_cabecera_brotacion ="+objCabeceraBrotacion.getId_cabecera_brotacion()+" order by POSICION asc";
                            CallableStatement ct2 = conn.prepareCall(sql);
                            ResultSet dr3 = ct2.executeQuery();
                               while(dr3.next())
                               {  
                                    if(listaDetalle==null)
                                    listaDetalle= new ArrayList<entDetalleBrotacion>();

                                    entDetalleBrotacion objDetalleBrotacion = new entDetalleBrotacion();
                                    objDetalleBrotacion.setId_det_brotacion(dr3.getInt(1));
                                    objDetalleBrotacion.setId_cabecera_brotacion(dr3.getInt(2));
                                    objDetalleBrotacion.setPosicion(dr3.getInt(3));
                                    objDetalleBrotacion.setNum_1(dr3.getInt(4));
                                    objDetalleBrotacion.setNum_2(dr3.getInt(5));
                                    objDetalleBrotacion.setNum_3(dr3.getInt(6));
                                    objDetalleBrotacion.setNum_4(dr3.getInt(7));
                                    objDetalleBrotacion.setNum_5(dr3.getInt(8));
                                    objDetalleBrotacion.setNum_6(dr3.getInt(9));
                                    objDetalleBrotacion.setNum_7(dr3.getInt(10));
                                    objDetalleBrotacion.setNum_8(dr3.getInt(11));
                                    objDetalleBrotacion.setNum_9(dr3.getInt(12));
                                    objDetalleBrotacion.setNum_10(dr3.getInt(13));
                                    objDetalleBrotacion.setNum_11(dr3.getInt(14));
                                    objDetalleBrotacion.setNum_12(dr3.getInt(15));
                                    listaDetalle.add(objDetalleBrotacion);

                               }
                            ct2.close();
                            dr3.close();
                            objCabeceraBrotacion.setList(listaDetalle);
                            listaCabecera.add(objCabeceraBrotacion);
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
    public static List<entBrotacion> Listar(boolean activo) throws Exception
    {
        List<entBrotacion> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select B.ID_BROTACION, B.FECHA_REGISTRO,B.ESTADO,B.USUARIO_RESPONSABLE,B.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE,CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +                        
                        "C.ID_CAMPANIA,C.NOMBRE, C.FECHA_INICIO,C.FECHA_FIN,\n" +
                        "L.ID_LOTE,L.NOMBRE,L.HECTAREAS,L.ANIO_SIEMBRA,\n" +                    
                        "V.ID_VARIEDAD,V.NOMBRE,V.CODIGO_CONTROL,\n" +
                        "CV.ID_CULTIVO,CV.NOMBRE\n" +
                        " from BROTACION B\n" +
                        " JOIN EVALUADOR E ON B.ID_EVALUADOR=E.ID_EVALUADOR\n" +
                        " JOIN CAMPANIA_LOTE CL ON  B.ID_CAMPANIA_LOTE=CL.ID_CAMPANIA_LOTE\n" +
                        " JOIN CAMPANIA C ON CL.ID_CAMPANIA=C.ID_CAMPANIA\n" +
                        " JOIN LOTE L ON CL.ID_LOTE=L.ID_LOTE\n" +
                        " JOIN VARIEDAD V ON L.ID_VARIEDAD=V.ID_VARIEDAD\n" +
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO";
            if(activo)
                        sql+=" where B.estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entBrotacion>();
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
                    
                    //Analisis_Brotacion
                    entBrotacion entidad = new entBrotacion();
                    entidad.setId_brotacion(dr.getInt(1));
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
    
    public  static int insertar(entBrotacion entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO brotacion(id_campania_lote,id_evaluador,estado,usuario_responsable,fecha_modificacion,fecha_registro)"
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
                sql="INSERT INTO CABECERA_BROTACION(ID_BROTACION,POSICION,NUM_HILERA,NUM_PLANTA,NUM_SALIDA_PLANTA,NUM_CARGADOR_PLANTA)"
                            + " VALUES(?,?,?,?,?,?);";
                    PreparedStatement pst1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    pst1.setInt(1, rpta);
                    pst1.setInt(2,(i+1));
                    pst1.setInt(3, entidad.getList().get(i).getNum_hilera());
                    pst1.setInt(4, entidad.getList().get(i).getNum_planta());
                    pst1.setInt(5, entidad.getList().get(i).getNum_salida_planta());
                    pst1.setInt(6, entidad.getList().get(i).getNum_cargador_planta());
                    pst1.executeUpdate();
                    ResultSet rs2 = pst1.getGeneratedKeys();
                    if (rs2.next()){
                        for(int j=0; j<entidad.getList().get(i).getList().size();j++)
                        {
                        sql="INSERT INTO DET_BROTACION(ID_CABECERA_BROTACION,POSICION,NUM_1,NUM_2,NUM_3,NUM_4,NUM_5,NUM_6,NUM_7,NUM_8,NUM_9,NUM_10,NUM_11,NUM_12)"
                            + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                            PreparedStatement pst2 = conn.prepareStatement(sql);
                            pst2.setInt(1, rs2.getInt(1));
                            pst2.setInt(2,(j+1));
                            pst2.setInt(3, entidad.getList().get(i).getList().get(j).getNum_1());
                            pst2.setInt(4, entidad.getList().get(i).getList().get(j).getNum_2());
                            pst2.setInt(5, entidad.getList().get(i).getList().get(j).getNum_3());
                            pst2.setInt(6, entidad.getList().get(i).getList().get(j).getNum_4());
                            pst2.setInt(7, entidad.getList().get(i).getList().get(j).getNum_5());
                            pst2.setInt(8, entidad.getList().get(i).getList().get(j).getNum_6());
                            pst2.setInt(9, entidad.getList().get(i).getList().get(j).getNum_7());
                            pst2.setInt(10, entidad.getList().get(i).getList().get(j).getNum_8());
                            pst2.setInt(11, entidad.getList().get(i).getList().get(j).getNum_9());
                            pst2.setInt(12, entidad.getList().get(i).getList().get(j).getNum_10());
                            pst2.setInt(13, entidad.getList().get(i).getList().get(j).getNum_11());
                            pst2.setInt(14, entidad.getList().get(i).getList().get(j).getNum_12());                            
                            pst2.execute();
                            pst2.close();
                        }
                    }
                    pst1.close();
                    rs2.close();
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
    
    public static boolean actualizar(entBrotacion entidad) throws Exception
    {
        boolean rpta1 = false;
        Connection conn =null;
        CallableStatement stmt1 = null;
        try {
             String sql="UPDATE brotacion SET id_campania_lote = ?,id_evaluador= ?,estado=?,usuario_responsable = ?,fecha_modificacion = GETDATE() "
                     + " WHERE id_brotacion = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt1 = conn.prepareCall(sql); 
            stmt1.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt1.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt1.setBoolean(3, entidad.isEstado());
            stmt1.setString(4, entidad.getUsuario_responsable());
            stmt1.setInt(5,entidad.getId_brotacion());                
            rpta1 = stmt1.executeUpdate() == 1;
            if(rpta1)
            {   
                for(int i=0; i<entidad.getList().size();i++)
                {
                    boolean rpta2 = false;          
                    sql="UPDATE CABECERA_BROTACION SET NUM_HILERA=?,NUM_PLANTA = ?,NUM_SALIDA_PLANTA = ?,NUM_CARGADOR_PLANTA = ? "
                         + " WHERE ID_CABECERA_BROTACION = ?;";
                    CallableStatement stmt2 = conn.prepareCall(sql);    
                    stmt2.setInt(1, entidad.getList().get(i).getNum_hilera());
                    stmt2.setInt(2, entidad.getList().get(i).getNum_planta());
                    stmt2.setInt(3, entidad.getList().get(i).getNum_salida_planta());
                    stmt2.setInt(4, entidad.getList().get(i).getNum_cargador_planta());
                    stmt2.setInt(5, entidad.getList().get(i).getId_cabecera_brotacion());

                    rpta2 = stmt2.executeUpdate() == 1;
                    if(rpta2)
                    { 
                        if(entidad.getList().get(i).isSeleccion())
                        for(int j=0; j<entidad.getList().get(i).getList().size();j++)                        
                        {
                            sql="update DET_BROTACION set NUM_1=? ,NUM_2=? ,NUM_3=? ,NUM_4=? ,NUM_5=? ,NUM_6=? ,NUM_7=? ,"
                                    + "NUM_8=? ,NUM_9=? ,NUM_10=? ,NUM_11=? ,NUM_12=? where ID_CABECERA_BROTACION=? and POSICION=?";
                            CallableStatement stmt3 = conn.prepareCall(sql);    
                            stmt3.setInt(1, entidad.getList().get(i).getList().get(j).getNum_1());
                            stmt3.setInt(2, entidad.getList().get(i).getList().get(j).getNum_2());
                            stmt3.setInt(3, entidad.getList().get(i).getList().get(j).getNum_3());
                            stmt3.setInt(4, entidad.getList().get(i).getList().get(j).getNum_4());
                            stmt3.setInt(5, entidad.getList().get(i).getList().get(j).getNum_5());
                            stmt3.setInt(6, entidad.getList().get(i).getList().get(j).getNum_6());
                            stmt3.setInt(7, entidad.getList().get(i).getList().get(j).getNum_7());
                            stmt3.setInt(8, entidad.getList().get(i).getList().get(j).getNum_8());
                            stmt3.setInt(9, entidad.getList().get(i).getList().get(j).getNum_9());
                            stmt3.setInt(10, entidad.getList().get(i).getList().get(j).getNum_10());
                            stmt3.setInt(11, entidad.getList().get(i).getList().get(j).getNum_11());
                            stmt3.setInt(12, entidad.getList().get(i).getList().get(j).getNum_12());    
                            stmt3.setInt(13, entidad.getList().get(i).getId_cabecera_brotacion());    
                            stmt3.setInt(14, (j+1));    
                            stmt3.executeUpdate();
                            stmt3.close();
                        }
                    }
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
