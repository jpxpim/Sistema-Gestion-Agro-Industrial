/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCargaTunel;
import Entidades.entCliente;
import Entidades.entDetalleCargaTunel;
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
public class CargaTunelDAO 
{
    
public static entCargaTunel  buscarxTunel(int idTunel) throws Exception
{
       entCargaTunel entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet drCargaTunel = null;
        try {
            String sql="select ID_CARGA_TUNEL,INICIO_CARGA,FIN_CARGA,TEMPERATURA_CARGA from CARGA_TUNEL \n" +
                        "WHERE (TEMPERATURA_DESCARGA IS NULL OR INICIO_DESCARGA IS NULL OR FIN_DESCARGA \n" +
                        "IS NULL) AND ID_TUNEL="+idTunel;                      
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareCall(sql);
            drCargaTunel = stmt.executeQuery();
            while(drCargaTunel.next())
            {
                entidad = new entCargaTunel();
                entidad.setId_carga_tunel(drCargaTunel.getInt(1));
                entidad.setInicio_carga(drCargaTunel.getTimestamp(2));   
                entidad.setFin_carga(drCargaTunel.getTimestamp(3));
                entidad.setTemperatura_carga(drCargaTunel.getDouble(4));
              
                sql="SELECT DCT.ID_DET_CARGA_TUNEL,P.ID_PALETA,P.CODIGO_CONTROL,P.FECHA_PRODUCCION,\n" +
                    "p.ESTADO_PALETA,P.POSICION_PALETA,C.NOMBRE from DET_CARGA_TUNEL DCT JOIN PALETA P \n" +
                    "ON DCT.ID_PALETA=P.ID_PALETA JOIN CLIENTE C ON P.ID_CLIENTE=C.ID_CLIENTE \n" +
                    "where DCT.ID_CARGA_TUNEL="+entidad.getId_carga_tunel();
                CallableStatement csDetalle = conn.prepareCall(sql);
                ResultSet rsDetalle = csDetalle.executeQuery();

                while (rsDetalle.next()){
                    
                    entPaleta objPaleta = new entPaleta();
                    objPaleta.setId_paleta(rsDetalle.getInt(2));
                    objPaleta.setCodigo_control(rsDetalle.getString(3)); 
                    objPaleta.setFecha_produccion(rsDetalle.getTimestamp(4));
                    objPaleta.setEstado_paleta(rsDetalle.getInt(5));
                    objPaleta.setPosicion_paleta(rsDetalle.getInt(6));
                    objPaleta.setObjCliente(new entCliente(rsDetalle.getString(7)));
                    
                    entDetalleCargaTunel objDetalleCargaTunel= new entDetalleCargaTunel();
                    objDetalleCargaTunel.setId_det_carga_tunel(rsDetalle.getInt(1));
                    objDetalleCargaTunel.setObjPaleta(objPaleta);
                    entidad.getListaDetalleCargaTunel().add(objDetalleCargaTunel);

                }
                csDetalle.close();
                rsDetalle.close();
                
                
                
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
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return entidad;
}
public static List<entCargaTunel>  Listar(int opcion) throws Exception
{
        List<entCargaTunel> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr1 = null;
        try {
            String sql="SELECT CT.ID_CARGA_TUNEL,CT.INICIO_CARGA,CT.TEMPERATURA_CARGA,CT.FIN_CARGA,\n" +
                        "isnull(CT.INICIO_DESCARGA,0),isnull(CT.TEMPERATURA_DESCARGA,0),isnull(CT.FIN_DESCARGA,0),\n" +
                        "CT.ESTADO,CT.USUARIO_RESPONSABLE,CT.FECHA_MODIFICACION, \n" +
                        "T.ID_TUNEL,T.NOMBRE,T.POS_X,T.POS_Y,T.POS_H,T.ESTADO\n" +
                        "FROM CARGA_TUNEL CT\n" +
                        "JOIN TUNEL T ON CT.ID_TUNEL=T.ID_TUNEL\n";                      
            if (opcion==1) sql=sql+" WHERE CT.INICIO_DESCARGA IS NULL  OR CT.FIN_DESCARGA IS NULL OR CT.TEMPERATURA_DESCARGA IS NULL";
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr1 = stmt.executeQuery();
            while(dr1.next())
            {
                if(lista==null)
                {lista= new ArrayList<entCargaTunel>();}
                    
                    //Tunel
                    entTunel objTunel = new entTunel();
                    objTunel.setId_tunel(dr1.getInt(11));
                    objTunel.setNombre(dr1.getString(12)); 
                    objTunel.setPos_x(dr1.getInt(13));
                    objTunel.setPos_y(dr1.getInt(14));
                    objTunel.setPos_h(dr1.getInt(15));
                    objTunel.setEstado(dr1.getBoolean(16));
                    //Recepcion
                    entCargaTunel entidad = new entCargaTunel();
                    entidad.setId_carga_tunel(dr1.getInt(1));
                    entidad.setInicio_carga(dr1.getTimestamp(2));                     
                    entidad.setTemperatura_carga(dr1.getDouble(3));
                    entidad.setFin_carga(dr1.getTimestamp(4));
                    entidad.setInicio_descarga(dr1.getTimestamp(5));                     
                    entidad.setTemperatura_descarga(dr1.getDouble(6));
                    entidad.setFin_descarga(dr1.getTimestamp(7));
                    entidad.setEstado(dr1.getBoolean(8)); 
                    entidad.setUsuario_responsable(dr1.getString(9)); 
                    entidad.setFecha_modificacion(dr1.getTimestamp(10)); 
                    entidad.setObjTunel(objTunel);
                    
                    
                    lista.add(entidad);

            }
        } catch (Exception e) {
            throw new Exception("Listar "+e.getMessage(), e);
        }
        finally{
            try {
                dr1.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return lista;
    }
    
public static entCargaTunel  BuscarPorID(int id) throws Exception
{
        entCargaTunel entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr1 = null;
        try {
            String sql="SELECT CT.ID_CARGA_TUNEL,CT.INICIO_CARGA,CT.TEMPERATURA_CARGA,CT.FIN_CARGA,\n" +
                        "isnull(CT.INICIO_DESCARGA,0),isnull(CT.TEMPERATURA_DESCARGA,0),isnull(CT.FIN_DESCARGA,0),\n" +
                        "CT.ESTADO,CT.USUARIO_RESPONSABLE,CT.FECHA_MODIFICACION, \n" +
                        "T.ID_TUNEL,T.NOMBRE,T.POS_X,T.POS_Y,T.POS_H,T.ESTADO\n" +
                        "FROM CARGA_TUNEL CT\n" +
                        "JOIN TUNEL T ON CT.ID_TUNEL=T.ID_TUNEL where id_carga_tunel="+id;                      
            
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr1 = stmt.executeQuery();
            if(dr1.next())
            {
                    
                    //Tunel
                    entTunel objTunel = new entTunel();
                    objTunel.setId_tunel(dr1.getInt(11));
                    objTunel.setNombre(dr1.getString(12)); 
                    objTunel.setPos_x(dr1.getInt(13));
                    objTunel.setPos_y(dr1.getInt(14));
                    objTunel.setPos_h(dr1.getInt(15));
                    objTunel.setEstado(dr1.getBoolean(16));
                    //Recepcion
                    entidad = new entCargaTunel();
                    entidad.setId_carga_tunel(dr1.getInt(1));
                    entidad.setInicio_carga(dr1.getTimestamp(2));                     
                    entidad.setTemperatura_carga(dr1.getDouble(3));
                    entidad.setFin_carga(dr1.getTimestamp(4));
                    entidad.setInicio_descarga(dr1.getTimestamp(5));                     
                    entidad.setTemperatura_descarga(dr1.getDouble(6));
                    entidad.setFin_descarga(dr1.getTimestamp(7));
                    entidad.setEstado(dr1.getBoolean(8)); 
                    entidad.setUsuario_responsable(dr1.getString(9)); 
                    entidad.setFecha_modificacion(dr1.getTimestamp(10)); 
                    entidad.setObjTunel(objTunel);
                    
                    List<entDetalleCargaTunel> listaDetalle = null;
                    sql="select DT.id_det_carga_tunel,DT.id_carga_tuneL,\n" +
                    "P.ID_PALETA,P.CODIGO_CONTROL,P.ESTADO_PALETA,P.FECHA_PRODUCCION,P.ID_DIA_RECEPCION,P.POSICION_PALETA,\n" +
                    "C.ID_CLIENTE,C.NOMBRE,C.RUC,C.ESTADO\n" +
                    "FROM DET_CARGA_TUNEL DT\n" +
                    "JOIN PALETA P ON DT.ID_PALETA=P.ID_PALETA\n" +
                    "JOIN CLIENTE C ON P.ID_CLIENTE=C.ID_CLIENTE\n" +
                    "WHERE ID_DET_CARGA_TUNEL="+entidad.getId_carga_tunel()+" order by  DT.ID_DET_CARGA_TUNEL asc";
                    CallableStatement ct1 = conn.prepareCall(sql);
                    ResultSet dr2 = ct1.executeQuery();
                        while(dr2.next())
                        {           
                            if(listaDetalle==null)
                            listaDetalle= new ArrayList<entDetalleCargaTunel>();
                            
                            entDetalleCargaTunel objDetalleCargaTunel = new entDetalleCargaTunel();
                                                      
                            //Cliente
                            entCliente objCliente= new entCliente();
                            objCliente.setId_cliente(dr2.getInt(9));
                            objCliente.setNombre(dr2.getString(10));
                            objCliente.setRuc(dr2.getString(11));
                            objCliente.setEstado(dr2.getBoolean(12));
                            //Paleta
                            entPaleta objPaleta = new entPaleta();
                            objPaleta.setId_paleta(dr2.getInt(3));
                            objPaleta.setCodigo_control(dr2.getString(4));
                            objPaleta.setEstado_paleta(dr2.getInt(5));
                            objPaleta.setFecha_produccion(dr2.getTimestamp(6));
                            objPaleta.setId_dia_recepcion(dr2.getInt(7));
                            objPaleta.setPosicion_paleta(dr2.getInt(8));
                            
                            //Det Recepcion
                            objDetalleCargaTunel.setId_det_carga_tunel(dr2.getInt(1));
                            objDetalleCargaTunel.setId_carga_tunel(dr2.getInt(2));
                            objDetalleCargaTunel.setObjCliente(objCliente);
                            objDetalleCargaTunel.setObjPaleta(objPaleta);
                            
                            listaDetalle.add(objDetalleCargaTunel);
                        }
                    entidad.setListaDetalleCargaTunel(listaDetalle);
                    ct1.close();
                    dr2.close();}

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

public  static int insertar(entCargaTunel entidad) throws Exception
{
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="insert into carga_tunel (ID_TUNEL,INICIO_CARGA,TEMPERATURA_CARGA,FIN_CARGA,ESTADO,USUARIO_RESPONSABLE,FECHA_MODIFICACION)\n" +
                      "values (?,?,?,?,?,?,GETDATE())";
           
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjTunel().getId_tunel());
            stmt.setTimestamp(2, new Timestamp(entidad.getInicio_carga().getTime()));
            stmt.setDouble(3, entidad.getTemperatura_carga());
            stmt.setTimestamp(4, new Timestamp(entidad.getFin_carga().getTime()));
            stmt.setBoolean(5, entidad.getEstado());
            stmt.setString(6, entidad.getUsuario_responsable());
            
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next())
            {
                rpta=rs.getInt(1);
                for(int i=0; i<entidad.getListaDetalleCargaTunel().size();i++)
                {
                sql="INSERT INTO DET_CARGA_TUNEL(ID_CARGA_TUNEL,ID_PALETA)"
                            + " VALUES(?,?);";
                    PreparedStatement pst1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    pst1.setInt(1,rpta);
                    pst1.setInt(2,entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                    pst1.executeUpdate();
                    
                sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,2,GETDATE());";                
                PreparedStatement psEstado = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                psEstado.setInt(1, entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                psEstado.execute();
                psEstado.close(); 
                
                sql="update PALETA set POSICION_PALETA=2 where ID_PALETA=?;";
                            PreparedStatement psEstadoPaleta = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                            psEstadoPaleta.setInt(1,entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                            psEstadoPaleta.execute();
                            psEstadoPaleta.close();  
    
                     
                   sql="update TUNEL set CARGADO=1 where ID_TUNEL=?;";
                        PreparedStatement EstadoTunel = conn.prepareCall(sql);
                        EstadoTunel.setInt(1, entidad.getObjTunel().getId_tunel());
                        EstadoTunel.execute();
                        EstadoTunel.close();
//                
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

public static boolean actualizarCarga(entCargaTunel entidad) throws Exception
{
        boolean rpta = false;
        Connection conn =null;
        try {
             String sql="";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
      
                for(int i=0; i<entidad.getListaDetalleCargaTunel().size();i++)
                {
                    if(entidad.getListaDetalleCargaTunel().get(i).isEliminado())
                    {
                        sql="DELETE FROM DET_CARGA_TUNEL WHERE ID_DET_CARGA_TUNEL = ?;";
                        CallableStatement stmt2 = conn.prepareCall(sql);    
                        stmt2.setInt(1, entidad.getListaDetalleCargaTunel().get(i).getId_det_carga_tunel());
                        stmt2.execute();
                        stmt2.close();
                        
                         sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                            + " VALUES(?,1,GETDATE());";                
                        PreparedStatement psEstado = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                        psEstado.setInt(1, entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                        psEstado.execute();
                        psEstado.close(); 

                        sql="update PALETA set POSICION_PALETA=1 where ID_PALETA=?;";
                                    PreparedStatement psEstadoPaleta = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                                    psEstadoPaleta.setInt(1,entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                                    psEstadoPaleta.execute();
                                    psEstadoPaleta.close();  
                    }
                    if(entidad.getListaDetalleCargaTunel().get(i).getId_det_carga_tunel()==0)
                    {
                        sql="INSERT INTO DET_CARGA_TUNEL(ID_CARGA_TUNEL,ID_PALETA)"
                            + " VALUES(?,?);";
                            PreparedStatement pst1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                            pst1.setInt(1,entidad.getId_carga_tunel());
                            pst1.setInt(2,entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                            pst1.executeUpdate();

                        sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                            + " VALUES(?,2,GETDATE());";                
                        PreparedStatement psEstado = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                        psEstado.setInt(1, entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                        psEstado.execute();
                        psEstado.close(); 

                        sql="update PALETA set POSICION_PALETA=2 where ID_PALETA=?;";
                                    PreparedStatement psEstadoPaleta = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                                    psEstadoPaleta.setInt(1,entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                                    psEstadoPaleta.execute();
                                    psEstadoPaleta.close();  
                        
                    }
                }
            rpta=true;
           conn.commit();
        } catch (Exception e) {
             if (conn != null) {
                    conn.rollback();
                }
            throw new Exception("Insertar"+e.getMessage(), e);
        }
        finally{
            try {
                conn.close();
            } catch (SQLException e) {
            }
        }
        return rpta;
    } 

public static boolean actualizarDescarga(entCargaTunel entidad) throws Exception
{
        boolean rpta1 = false;
        Connection conn =null;
        CallableStatement stmt1 = null;
        try {
             String sql="update CARGA_TUNEL set INICIO_DESCARGA=?,FIN_DESCARGA=?,TEMPERATURA_DESCARGA=?,USUARIO_RESPONSABLE=?,fecha_modificacion = GETDATE() "
                     + " WHERE id_carga_tunel = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt1 = conn.prepareCall(sql); 
            stmt1.setTimestamp(1, new Timestamp(entidad.getInicio_descarga().getTime()));
            stmt1.setTimestamp(2, new Timestamp(entidad.getFin_descarga().getTime()));
            stmt1.setDouble(3, entidad.getTemperatura_descarga());
            stmt1.setString(4, entidad.getUsuario_responsable());
            stmt1.setInt(5,entidad.getId_carga_tunel());                
            rpta1 = stmt1.executeUpdate() == 1;
            if(rpta1)
            {   
                for(int i=0; i<entidad.getListaDetalleCargaTunel().size();i++)
                {
                    sql="UPDATE PALETA SET POSICION_PALETA=3,FECHA_MODIFICACION=GETDATE() "
                         + " WHERE ID_PALETA = ?;";
                    CallableStatement stmt2 = conn.prepareCall(sql);    
                    stmt2.setInt(1, entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                    stmt2.execute();
                    stmt2.close();
                
                
                sql="INSERT INTO DET_POSICION_PALETA(ID_PALETA,ESTADO_NUEVO,FECHA_REGISTRO)"
                    + " VALUES(?,3,GETDATE());";                
                PreparedStatement psEstado = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                psEstado.setInt(1, entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                psEstado.execute();
                psEstado.close(); 
                
                sql="update PALETA set POSICION_PALETA=3 where ID_PALETA=?;";
                            PreparedStatement psEstadoPaleta = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                            psEstadoPaleta.setInt(1,entidad.getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta());
                            psEstadoPaleta.execute();
                            psEstadoPaleta.close();  
                     
               sql="update TUNEL set CARGADO=0 where ID_TUNEL=?;";
                    PreparedStatement EstadoTunel = conn.prepareCall(sql);
                    EstadoTunel.setInt(1, entidad.getObjTunel().getId_tunel());
                    EstadoTunel.execute();
                    EstadoTunel.close();
                
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
