/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCabeceraPrePoda;
import Entidades.entCampania;
import Entidades.entCampaniaLote;
import Entidades.entCultivo;
import Entidades.entDetallePrePoda;
import Entidades.entEvaluador;
import Entidades.entLote;
import Entidades.entPrePoda;
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
public class PrePodaDAO {

    public static entPrePoda BuscarPorId(int id) throws Exception
     {
        entPrePoda entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr1 = null;
        try {
            String sql="select D.ID_PRE_PODA, D.FECHA_REGISTRO,D.ESTADO,D.USUARIO_RESPONSABLE,D.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE,CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +                        
                        "C.ID_CAMPANIA,C.NOMBRE, C.FECHA_INICIO,C.FECHA_FIN,\n" +
                        "L.ID_LOTE,L.NOMBRE,L.HECTAREAS,L.ANIO_SIEMBRA,\n" +                    
                        "V.ID_VARIEDAD,V.NOMBRE,V.CODIGO_CONTROL,\n" +
                        "CV.ID_CULTIVO,CV.NOMBRE\n" +
                        " from PRE_PODA D\n" +
                        " JOIN EVALUADOR E ON D.ID_EVALUADOR=E.ID_EVALUADOR\n" +
                        " JOIN CAMPANIA_LOTE CL ON  D.ID_CAMPANIA_LOTE=CL.ID_CAMPANIA_LOTE\n" +
                        " JOIN CAMPANIA C ON CL.ID_CAMPANIA=C.ID_CAMPANIA\n" +
                        " JOIN LOTE L ON CL.ID_LOTE=L.ID_LOTE\n" +
                        " JOIN VARIEDAD V ON L.ID_VARIEDAD=V.ID_VARIEDAD\n" +
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO where D.ID_PRE_PODA="+id; 

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
                    entidad = new entPrePoda();
                    entidad.setId_pre_poda(dr1.getInt(1));
                    entidad.setFecha_registro(dr1.getTimestamp(2));                     
                    entidad.setEstado(dr1.getBoolean(3)); 
                    entidad.setUsuario_responsable(dr1.getString(4)); 
                    entidad.setFecha_modificacion(dr1.getTimestamp(5)); 
                    entidad.setObjCampaniaLote(objCampaniaLote);
                    entidad.setObjEvaluador(objEvaluador);
                    
                    List<entCabeceraPrePoda> listaCabecera = null;
                    sql="select ID_CABECERA_PRE_PODA,ID_PRE_PODA,POSICION,NUM_HILERA,NUM_PLANTA,NUM_SALIDA_PLANTA from "
                            + "CABECERA_PRE_PODA where ID_PRE_PODA="+entidad.getId_pre_poda()+" order by POSICION asc";
                    CallableStatement ct1 = conn.prepareCall(sql);
                    ResultSet dr2 = ct1.executeQuery();
                        while(dr2.next())
                        {           
                            if(listaCabecera==null)
                            listaCabecera= new ArrayList<entCabeceraPrePoda>();
                            
                            entCabeceraPrePoda objCabeceraPrePoda = new entCabeceraPrePoda();
                            objCabeceraPrePoda.setId_cabecera_pre_poda(dr2.getInt(1));
                            objCabeceraPrePoda.setId_pre_poda(dr2.getInt(2));
                            objCabeceraPrePoda.setPosicion(dr2.getInt(3));
                            objCabeceraPrePoda.setNum_hilera(dr2.getInt(4));
                            objCabeceraPrePoda.setNum_planta(dr2.getInt(5));
                            objCabeceraPrePoda.setNum_salida_planta(dr2.getInt(6));                          
                            
                            List<entDetallePrePoda> listaDetalle=null;
                            
                            sql=" select id_det_pre_poda, id_cabecera_pre_poda, posicion, diametro,feminela\n" +
                            " from DET_PRE_PODA where id_cabecera_pre_poda ="+objCabeceraPrePoda.getId_cabecera_pre_poda()+" order by POSICION asc";
                            CallableStatement ct2 = conn.prepareCall(sql);
                            ResultSet dr3 = ct2.executeQuery();
                               while(dr3.next())
                               {  
                                    if(listaDetalle==null)
                                    listaDetalle= new ArrayList<entDetallePrePoda>();

                                    entDetallePrePoda objDetallePrePoda = new entDetallePrePoda();
                                    objDetallePrePoda.setId_det_pre_poda(dr3.getInt(1));
                                    objDetallePrePoda.setId_cabecera_pre_poda(dr3.getInt(2));
                                    objDetallePrePoda.setPosicion(dr3.getInt(3));
                                    objDetallePrePoda.setDiametro(dr3.getInt(4));
                                    objDetallePrePoda.setFeminela(dr3.getInt(5));
                                    listaDetalle.add(objDetallePrePoda);

                               }
                            ct2.close();
                            dr3.close();
                            objCabeceraPrePoda.setList(listaDetalle);
                            listaCabecera.add(objCabeceraPrePoda);
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
    public static List<entPrePoda> Listar(boolean activo) throws Exception
    {
        List<entPrePoda> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
           String sql="select D.ID_PRE_PODA, D.FECHA_REGISTRO,D.ESTADO,D.USUARIO_RESPONSABLE,D.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE,CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +                        
                        "C.ID_CAMPANIA,C.NOMBRE, C.FECHA_INICIO,C.FECHA_FIN,\n" +
                        "L.ID_LOTE,L.NOMBRE,L.HECTAREAS,L.ANIO_SIEMBRA,\n" +                    
                        "V.ID_VARIEDAD,V.NOMBRE,V.CODIGO_CONTROL,\n" +
                        "CV.ID_CULTIVO,CV.NOMBRE\n" +
                        " from PRE_PODA D\n" +
                        " JOIN EVALUADOR E ON D.ID_EVALUADOR=E.ID_EVALUADOR\n" +
                        " JOIN CAMPANIA_LOTE CL ON  D.ID_CAMPANIA_LOTE=CL.ID_CAMPANIA_LOTE\n" +
                        " JOIN CAMPANIA C ON CL.ID_CAMPANIA=C.ID_CAMPANIA\n" +
                        " JOIN LOTE L ON CL.ID_LOTE=L.ID_LOTE\n" +
                        " JOIN VARIEDAD V ON L.ID_VARIEDAD=V.ID_VARIEDAD\n" +
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO"; 
            if(activo)
                        sql+=" where D.ESTADO=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entPrePoda>();
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
                    entPrePoda entidad = new entPrePoda();
                    entidad.setId_pre_poda(dr.getInt(1));
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
    
    public  static int insertar(entPrePoda entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO PRE_PODA (id_campania_lote,id_evaluador,estado,usuario_responsable,fecha_modificacion,fecha_registro)"
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
                sql="INSERT INTO CABECERA_PRE_PODA(ID_PRE_PODA,POSICION,NUM_HILERA,NUM_PLANTA,NUM_SALIDA_PLANTA)"
                            + " VALUES(?,?,?,?,?);";
                    PreparedStatement pst1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    pst1.setInt(1, rpta);
                    pst1.setInt(2,(i+1));
                    pst1.setInt(3, entidad.getList().get(i).getNum_hilera());
                    pst1.setInt(4, entidad.getList().get(i).getNum_planta());
                    pst1.setInt(5, entidad.getList().get(i).getNum_salida_planta());
                    pst1.executeUpdate();
                    ResultSet rs2 = pst1.getGeneratedKeys();
                    if (rs2.next()){
                        for(int j=0; j<entidad.getList().get(i).getList().size();j++)
                        {
                        sql="INSERT INTO DET_PRE_PODA(ID_CABECERA_PRE_PODA,POSICION,DIAMETRO,FEMINELA)"
                            + " VALUES(?,?,?,?);";
                            PreparedStatement pst2 = conn.prepareStatement(sql);
                            pst2.setInt(1, rs2.getInt(1));
                            pst2.setInt(2,(j+1));
                            pst2.setInt(3, entidad.getList().get(i).getList().get(j).getDiametro());
                            pst2.setInt(4, entidad.getList().get(i).getList().get(j).getFeminela());
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
    
    public static boolean actualizar(entPrePoda entidad) throws Exception
    {
        boolean rpta1 = false;
        Connection conn =null;
        CallableStatement stmt1 = null;
        try {
             String sql="UPDATE PRE_PODA SET id_campania_lote = ?,id_evaluador= ?,estado=?,usuario_responsable = ?,fecha_modificacion = GETDATE() "
                     + " WHERE id_pre_poda = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt1 = conn.prepareCall(sql); 
            stmt1.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt1.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt1.setBoolean(3, entidad.isEstado());
            stmt1.setString(4, entidad.getUsuario_responsable());
            stmt1.setInt(5,entidad.getId_pre_poda());                
            rpta1 = stmt1.executeUpdate() == 1;
            if(rpta1)
            {   
                for(int i=0; i<entidad.getList().size();i++)
                {
                    boolean rpta2 = false;          
                    sql="UPDATE CABECERA_PRE_PODA SET NUM_HILERA=?,NUM_PLANTA = ?,NUM_SALIDA_PLANTA = ?"
                         + " WHERE ID_CABECERA_PRE_PODA = ?;";
                    CallableStatement stmt2 = conn.prepareCall(sql);    
                    stmt2.setInt(1, entidad.getList().get(i).getNum_hilera());
                    stmt2.setInt(2, entidad.getList().get(i).getNum_planta());
                    stmt2.setInt(3, entidad.getList().get(i).getNum_salida_planta());
                    stmt2.setInt(4, entidad.getList().get(i).getId_cabecera_pre_poda());

                    rpta2 = stmt2.executeUpdate() == 1;
                    if(rpta2)
                    { 
                        if(entidad.getList().get(i).isSeleccion())
                        for(int j=0; j<entidad.getList().get(i).getList().size();j++)                        
                        {
                            sql="update DET_PRE_PODA set DIAMETRO=? ,FEMINELA=? where ID_CABECERA_PRE_PODA=? and POSICION=?";
                            CallableStatement stmt3 = conn.prepareCall(sql);    
                            stmt3.setInt(1, entidad.getList().get(i).getList().get(j).getDiametro());
                            stmt3.setInt(2, entidad.getList().get(i).getList().get(j).getFeminela());
                            stmt3.setInt(3, entidad.getList().get(i).getId_cabecera_pre_poda());    
                            stmt3.setInt(4, (j+1));    
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
