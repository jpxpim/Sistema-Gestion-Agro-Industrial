/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entBrotacion;
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
public class BrotacionDAO {

    public static entBrotacion BuscarPorId(int id) throws Exception
    {
        entBrotacion brotacion = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select B.ID_BROTACION, B.NUM_HILERA,B.NUM_PLANTA,B.NUM_SALIDA_PLANTA,B.NUM_CARGADOR_PLANTA,B.ESTADO,B.USUARIO_RESPONSABLE,B.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE, CL.ID_LOTE, CL.ID_CAMPANIA, CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +
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
                        " JOIN CULTIVO CV ON V.ID_CULTIVO=CV.ID_CULTIVO where id_brotacion="+id;


            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            if(dr.next())
            {
                    //Evaluador
                    entEvaluador objEvaluador = new entEvaluador();
                    objEvaluador.setId_evaluador(dr.getInt(9));
                    objEvaluador.setNombre(dr.getString(10)); 
                    objEvaluador.setApellido(dr.getString(11)); 
                    objEvaluador.setCodigo_erp(dr.getString(12));        
                    //Cultivo
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr.getInt(29));
                    objCultivo.setNombre(dr.getString(30)); 
                    //Variedad
                    entVariedad objVariedad = new entVariedad();
                    objVariedad.setId_variedad(dr.getInt(26));
                    objVariedad.setNombre(dr.getString(27)); 
                    objVariedad.setCodigo_control(dr.getString(28));
                    objVariedad.setObjCultivo(objCultivo);
                    //Lote
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr.getInt(22));
                    objLote.setNombre(dr.getString(23)); 
                    objLote.setHectareas(dr.getDouble(24));
                    objLote.setAnio_siembra(dr.getInt(25));
                    objLote.setObjVariedad(objVariedad);
                    //Campania
                    entCampania objCampania = new entCampania();
                    objCampania.setId_campania(dr.getInt(18));
                    objCampania.setNombre(dr.getInt(19)); 
                    objCampania.setFecha_inicio(dr.getTimestamp(20)); 
                    objCampania.setFecha_fin(dr.getTimestamp(21));
                    //Campania_Lote
                    entCampaniaLote objCampaniaLote = new entCampaniaLote();
                    objCampaniaLote.setId_campania_lote(dr.getInt(13));
                    objCampaniaLote.setFechaPodaFormacion(dr.getTimestamp(16)); 
                    objCampaniaLote.setNumero_plantas(dr.getInt(17)); 
                    objCampaniaLote.setObjCampania(objCampania);
                    objCampaniaLote.setObjLote(objLote);
                    
                    //Analisis_Yemas
                    entBrotacion entidad = new entBrotacion();
                    entidad.setId_brotacion(dr.getInt(1));
                    entidad.setNum_hilera(dr.getInt(2)); 
                    entidad.setNum_planta(dr.getInt(3)); 
                    entidad.setNum_salida_planta(dr.getInt(4)); 
                    entidad.setNum_cargador_planta(dr.getInt(5));                     
                    entidad.setEstado(dr.getBoolean(6)); 
                    entidad.setUsuario_responsable(dr.getString(7)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(8)); 
                    entidad.setList(DetalleBrotacionDAO.ListarPorBrotacion(dr.getInt(1)));
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
        return brotacion;
    }
    
    public static List<entBrotacion> Listar(boolean activo) throws Exception
    {
        List<entBrotacion> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select B.ID_BROTACION, B.NUM_HILERA,B.NUM_PLANTA,B.NUM_SALIDA_PLANTA,B.NUM_CARGADOR_PLANTA,B.ESTADO,B.USUARIO_RESPONSABLE,B.FECHA_MODIFICACION,\n" +
                        "E.ID_EVALUADOR, E.NOMBRE, E.APELLIDO, E.CODIGO_ERP,\n" +
                        "CL.ID_CAMPANIA_LOTE, CL.ID_LOTE, CL.ID_CAMPANIA, CL.FECHA_PODA_FORMACION, CL.NUMERO_PLANTAS,\n" +
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
                        sql+=" where estado=1"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entBrotacion>();
                    //Evaluador
                    entEvaluador objEvaluador = new entEvaluador();
                    objEvaluador.setId_evaluador(dr.getInt(9));
                    objEvaluador.setNombre(dr.getString(10)); 
                    objEvaluador.setApellido(dr.getString(11)); 
                    objEvaluador.setCodigo_erp(dr.getString(12));        
                    //Cultivo
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr.getInt(29));
                    objCultivo.setNombre(dr.getString(30)); 
                    //Variedad
                    entVariedad objVariedad = new entVariedad();
                    objVariedad.setId_variedad(dr.getInt(26));
                    objVariedad.setNombre(dr.getString(27)); 
                    objVariedad.setCodigo_control(dr.getString(28));
                    objVariedad.setObjCultivo(objCultivo);
                    //Lote
                    entLote objLote = new entLote();
                    objLote.setId_lote(dr.getInt(22));
                    objLote.setNombre(dr.getString(23)); 
                    objLote.setHectareas(dr.getDouble(24));
                    objLote.setAnio_siembra(dr.getInt(25));
                    objLote.setObjVariedad(objVariedad);
                    //Campania
                    entCampania objCampania = new entCampania();
                    objCampania.setId_campania(dr.getInt(18));
                    objCampania.setNombre(dr.getInt(19)); 
                    objCampania.setFecha_inicio(dr.getTimestamp(20)); 
                    objCampania.setFecha_fin(dr.getTimestamp(21));
                    //Campania_Lote
                    entCampaniaLote objCampaniaLote = new entCampaniaLote();
                    objCampaniaLote.setId_campania_lote(dr.getInt(13));
                    objCampaniaLote.setFechaPodaFormacion(dr.getTimestamp(16)); 
                    objCampaniaLote.setNumero_plantas(dr.getInt(17)); 
                    objCampaniaLote.setObjCampania(objCampania);
                    objCampaniaLote.setObjLote(objLote);
                    
                    //Analisis_Yemas
                    entBrotacion entidad = new entBrotacion();
                    entidad.setId_brotacion(dr.getInt(1));
                    entidad.setNum_hilera(dr.getInt(2)); 
                    entidad.setNum_planta(dr.getInt(3)); 
                    entidad.setNum_salida_planta(dr.getInt(4)); 
                    entidad.setNum_cargador_planta(dr.getInt(5));                     
                    entidad.setEstado(dr.getBoolean(6)); 
                    entidad.setUsuario_responsable(dr.getString(7)); 
                    entidad.setFecha_modificacion(dr.getTimestamp(8)); 
                    entidad.setList(DetalleBrotacionDAO.ListarPorBrotacion(dr.getInt(1)));
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
            
           String sql="INSERT INTO brotacion(id_campania_lote,id_evaluador,num_hilera,num_planta,"
                   + "num_salida_planta,num_cargador_planta,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt.setInt(3, entidad.getNum_hilera());
            stmt.setInt(4, entidad.getNum_planta());
            stmt.setInt(5, entidad.getNum_salida_planta());
            stmt.setInt(6, entidad.getNum_cargador_planta());
            stmt.setBoolean(7, entidad.getEstado());
            stmt.setString(8, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entBrotacion entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE brotacion SET id_campania_lote = ?,id_evaluador= ?,num_hilera=?,num_planta= ?,"
                     + " num_salida_planta=?,num_cargador_planta,estado=?,usuario_responsable = ?,fecha_modificacion = GETDATE() "
                     + " WHERE id_brotacion = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql); 
            stmt.setInt(1, entidad.getObjCampaniaLote().getId_campania_lote());
            stmt.setInt(2, entidad.getObjEvaluador().getId_evaluador());
            stmt.setInt(3, entidad.getNum_hilera());
            stmt.setInt(4, entidad.getNum_planta());
            stmt.setInt(5, entidad.getNum_salida_planta());
            stmt.setInt(6, entidad.getNum_cargador_planta());
            stmt.setBoolean(7, entidad.getEstado());
            stmt.setString(8, entidad.getUsuario_responsable());
            stmt.setInt(9,entidad.getId_brotacion());
                
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
