/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCategoria;
import Entidades.entChofer;
import Entidades.entDetalleRecepcion;
import Entidades.entDireccionLlegada;
import Entidades.entJaba;
import Entidades.entLote;
import Entidades.entParihuela;
import Entidades.entRecepcion;
import Entidades.entTransportista;
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
public class RecepcionDAO {

    public static entRecepcion BuscarPorId(int id) throws Exception
     {
        entRecepcion entidad = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr1 = null;
        try {
            String sql="select R.ID_RECEPCION,R.NUM_GUIA,R.PLACA,R.MODELO,R.FECHA_RECEPCION,R.PRECINTO,R.ESTADO,R.USUARIO_RESPONSABLE,R.FECHA_MODIFICACION,\n" +
                "D.ID_DIR_LLEGADA,D.NOMBRE,D.ESTADO,D.USUARIO_RESPONSABLE,D.FECHA_MODIFICACION,\n" +
                "T.ID_TRANSPORTISTA,T.RAZON_SOCIAL,T.RUC,T.ESTADO,T.USUARIO_RESPONSABLE,T.FECHA_MODIFICACION,\n" +
                "CH.ID_CHOFER,CH.NOMBRE,CH.BREVETE,CH.ESTADO,CH.USUARIO_RESPONSABLE,CH.FECHA_MODIFICACION\n" +
                "from recepcion R\n" +
                "join DIR_LLEGADA D ON R.ID_DIR_LLEGADA=D.ID_DIR_LLEGADA\n" +
                "JOIN CHOFER CH ON R.ID_CHOFER = CH.ID_CHOFER\n" +
                "JOIN TRANSPORTISTA T ON CH.ID_TRANSPORTISTA=T.ID_TRANSPORTISTA\n" +
                "WHERE R.ID_RECEPCION="+id; 

            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareCall(sql);
            dr1 = stmt.executeQuery();

            if(dr1.next())
            {
                    //Dir Llegada
                    entDireccionLlegada objDireccionLlegada = new entDireccionLlegada();
                    objDireccionLlegada.setId_dir_llegada(dr1.getInt(10));
                    objDireccionLlegada.setNombre(dr1.getString(11)); 
                    objDireccionLlegada.setEstado(dr1.getBoolean(12));
                    objDireccionLlegada.setUsuario_responsable(dr1.getString(13));
                    objDireccionLlegada.setFecha_modificacion(dr1.getTimestamp(14));
                    //Transportista
                    entTransportista objTransportista = new entTransportista();
                    objTransportista.setId_transportista(dr1.getInt(15));
                    objTransportista.setRazon_social(dr1.getString(16)); 
                    objTransportista.setRuc(dr1.getString(17)); 
                    objTransportista.setEstado(dr1.getBoolean(18));
                    objTransportista.setUsuario_responsable(dr1.getString(19));
                    objTransportista.setFecha_modificacion(dr1.getTimestamp(20));
                    //Chofer
                    entChofer objChofer = new entChofer();
                    objChofer.setId_chofer(dr1.getInt(21));
                    objChofer.setNombre(dr1.getString(22)); 
                    objChofer.setBrevete(dr1.getString(23)); 
                    objChofer.setEstado(dr1.getBoolean(24));
                    objChofer.setUsuario_responsable(dr1.getString(25));
                    objChofer.setFecha_modificacion(dr1.getTimestamp(26));
                    objChofer.setObjTransportista(objTransportista);
                    //Recepcion
                    entidad = new entRecepcion();
                    entidad.setId_recepcion(dr1.getInt(1));
                    entidad.setNum_guia(dr1.getString(2));                     
                    entidad.setPlaca(dr1.getString(3));
                    entidad.setModelo(dr1.getString(4));
                    entidad.setFecha_recepcion(dr1.getTimestamp(5));                     
                    entidad.setPrecinto(dr1.getString(6));
                    entidad.setEstado(dr1.getInt(7)); 
                    entidad.setUsuario_responsable(dr1.getString(8)); 
                    entidad.setFecha_modificacion(dr1.getTimestamp(9)); 
                    entidad.setObjChofer(objChofer);
                    entidad.setObjDireccionLlegada(objDireccionLlegada);
                    
                    List<entDetalleRecepcion> listaDetalle = null;
                    sql="SELECT DR.ID_DET_RECEPCION,DR.NUM_JABAS,DR.PESO_BRUTO,\n" +
                    "J.ID_JABA,J.NOMBRE,J.PESO,J.ESTADO,J.USUARIO_RESPONSABLE,J.FECHA_MODIFICACION,\n" +
                    "P.ID_PARIHUELA,P.NOMBRE,P.PESO,P.ESTADO,P.USUARIO_RESPONSABLE,P.FECHA_MODIFICACION,\n" +
                    "C.ID_CATEGORIA,C.NOMBRE,C.CODIGO_CONTROL,C.ESTADO,C.USUARIO_RESPONSABLE,C.FECHA_MODIFICACION,\n" +
                    "L.ID_LOTE,L.CODIGO_CONTROL,L.NOMBRE,\n" +
                    "R.ID_RECEPCION,R.NUM_GUIA,R.ESTADO\n" +
                    "FROM DET_RECEPCION DR\n" +
                    "JOIN JABA J ON DR.ID_JABA= J.ID_JABA\n" +
                    "JOIN PARIHUELA P ON DR.ID_PARIHUELA=P.ID_PARIHUELA\n" +
                    "JOIN CATEGORIA C ON DR.ID_CATEGORIA=C.ID_CATEGORIA\n" +
                    "JOIN LOTE L ON DR.ID_LOTE = L.ID_LOTE\n" +
                    "JOIN RECEPCION R ON DR.ID_RECEPCION=R.ID_RECEPCION\n" +
                    "WHERE DR.ID_RECEPCION="+entidad.getId_recepcion()+" order by  DR.ID_DET_RECEPCION asc";
                    CallableStatement ct1 = conn.prepareCall(sql);
                    ResultSet dr2 = ct1.executeQuery();
                        while(dr2.next())
                        {           
                            if(listaDetalle==null)
                            listaDetalle= new ArrayList<entDetalleRecepcion>();
                            
                            entDetalleRecepcion objDetalleRecepcion = new entDetalleRecepcion();
                            
                            //jaba
                            entJaba objJaba = new entJaba();
                            objJaba.setId_jaba(dr2.getInt(4));
                            objJaba.setNombre(dr2.getString(5));
                            objJaba.setPeso(dr2.getDouble(6));
                            objJaba.setEstado(dr2.getBoolean(7));
                            objJaba.setUsuario_responsable(dr2.getString(8));
                            objJaba.setFecha_modificacion(dr2.getTimestamp(9));
                            //Parihuela
                            entParihuela objParihuela=new entParihuela();
                            objParihuela.setId_parihuela(dr2.getInt(10));
                            objParihuela.setNombre(dr2.getString(11));
                            objParihuela.setPeso(dr2.getDouble(12));
                            objParihuela.setEstado(dr2.getBoolean(13));
                            objParihuela.setUsuario_responsable(dr2.getString(14));
                            objParihuela.setFecha_modificacion(dr2.getTimestamp(15));
                            //Categoria
                            entCategoria objCategoria = new entCategoria();
                            objCategoria.setId_categoria(dr2.getInt(16));
                            objCategoria.setNombre(dr2.getString(17));
                            objCategoria.setCodigo_control(dr2.getString(18));
                            objCategoria.setEstado(dr2.getBoolean(19));
                            objCategoria.setUsuario_responsable(dr2.getString(20));
                            objCategoria.setFecha_modificacion(dr2.getTimestamp(21));
                            //Lote
                            entLote objLote = new entLote();
                            objLote.setId_lote(dr2.getInt(22));
                            objLote.setNombre(dr2.getString(23));
                            objLote.setCodigo_control(dr2.getString(24));
                            
                            //Recepcion
                            entRecepcion objRecepcion = new entRecepcion();
                            objRecepcion.setId_recepcion(dr2.getInt(25));
                            objRecepcion.setNum_guia(dr2.getString(26));
                            objRecepcion.setEstado(dr2.getInt(27));
                            
                            //Det Recepcion
                            objDetalleRecepcion.setId_det_recepcion(dr2.getInt(1));
                            objDetalleRecepcion.setNum_jabas(dr2.getDouble(2));
                            objDetalleRecepcion.setPeso_bruto(dr2.getDouble(3));
                            objDetalleRecepcion.setObjCategoria(objCategoria);
                            objDetalleRecepcion.setObjJaba(objJaba);
                            objDetalleRecepcion.setObjLote(objLote);
                            objDetalleRecepcion.setObjParihuela(objParihuela);
                            
                            listaDetalle.add(objDetalleRecepcion);
                        }
                    entidad.setLista(listaDetalle);
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
    public static List<entRecepcion> Listar(boolean activo) throws Exception
    {
        List<entRecepcion> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr1 = null;
        try {
            String sql="select R.ID_RECEPCION,R.NUM_GUIA,R.PLACA,R.MODELO,R.FECHA_RECEPCION,R.PRECINTO,R.ESTADO,R.USUARIO_RESPONSABLE,R.FECHA_MODIFICACION,\n" +
                "D.ID_DIR_LLEGADA,D.NOMBRE,D.ESTADO,D.USUARIO_RESPONSABLE,D.FECHA_MODIFICACION,\n" +
                "T.ID_TRANSPORTISTA,T.RAZON_SOCIAL,T.RUC,T.ESTADO,T.USUARIO_RESPONSABLE,T.FECHA_MODIFICACION,\n" +
                "CH.ID_CHOFER,CH.NOMBRE,CH.BREVETE,CH.ESTADO,CH.USUARIO_RESPONSABLE,CH.FECHA_MODIFICACION\n" +
                "from recepcion R\n" +
                "join DIR_LLEGADA D ON R.ID_DIR_LLEGADA=D.ID_DIR_LLEGADA\n" +
                "JOIN CHOFER CH ON R.ID_CHOFER = CH.ID_CHOFER\n" +
                "JOIN TRANSPORTISTA T ON CH.ID_TRANSPORTISTA=T.ID_TRANSPORTISTA\n" ; 
            if(activo)
                        sql+=" where R.estado=1";             

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr1 = stmt.executeQuery();

            if(dr1.next())
            {
                if(lista==null)
                {lista= new ArrayList<entRecepcion>();}
                    //Dir Llegada
                    entDireccionLlegada objDireccionLlegada = new entDireccionLlegada();
                    objDireccionLlegada.setId_dir_llegada(dr1.getInt(10));
                    objDireccionLlegada.setNombre(dr1.getString(11)); 
                    objDireccionLlegada.setEstado(dr1.getBoolean(12));
                    objDireccionLlegada.setUsuario_responsable(dr1.getString(13));
                    objDireccionLlegada.setFecha_modificacion(dr1.getTimestamp(14));
                    //Transportista
                    entTransportista objTransportista = new entTransportista();
                    objTransportista.setId_transportista(dr1.getInt(15));
                    objTransportista.setRazon_social(dr1.getString(16)); 
                    objTransportista.setRuc(dr1.getString(17)); 
                    objTransportista.setEstado(dr1.getBoolean(18));
                    objTransportista.setUsuario_responsable(dr1.getString(19));
                    objTransportista.setFecha_modificacion(dr1.getTimestamp(20));
                    //Chofer
                    entChofer objChofer = new entChofer();
                    objChofer.setId_chofer(dr1.getInt(21));
                    objChofer.setNombre(dr1.getString(22)); 
                    objChofer.setBrevete(dr1.getString(23)); 
                    objChofer.setEstado(dr1.getBoolean(24));
                    objChofer.setUsuario_responsable(dr1.getString(25));
                    objChofer.setFecha_modificacion(dr1.getTimestamp(26));
                    objChofer.setObjTransportista(objTransportista);
                    //Recepcion
                    entRecepcion entidad = new entRecepcion();
                    entidad.setId_recepcion(dr1.getInt(1));
                    entidad.setNum_guia(dr1.getString(2));                     
                    entidad.setPlaca(dr1.getString(3));
                    entidad.setModelo(dr1.getString(4));
                    entidad.setFecha_recepcion(dr1.getTimestamp(5));                     
                    entidad.setPrecinto(dr1.getString(6));
                    entidad.setEstado(dr1.getInt(7)); 
                    entidad.setUsuario_responsable(dr1.getString(8)); 
                    entidad.setFecha_modificacion(dr1.getTimestamp(9)); 
                    entidad.setObjChofer(objChofer);
                    entidad.setObjDireccionLlegada(objDireccionLlegada);
                    
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
    
    public  static int insertar(entRecepcion entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO recepcion(id_dir_llegada,id_chofer,num_guia,placa,modelo,fecha_recepcion,precinto,"
                   + " estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, entidad.getObjDireccionLlegada().getId_dir_llegada());
            stmt.setInt(2, entidad.getObjChofer().getId_chofer());
            stmt.setString(3, entidad.getNum_guia());
            stmt.setString(4, entidad.getPlaca());
            stmt.setString(5, entidad.getModelo());
            stmt.setTimestamp(6, new Timestamp(entidad.getFecha_recepcion().getTime()));
            stmt.setString(7, entidad.getPrecinto());
            stmt.setInt(8, entidad.getEstado());
            stmt.setString(9, entidad.getUsuario_responsable());
            stmt.executeUpdate();
            ResultSet rs1 = stmt.getGeneratedKeys();            
            if (rs1.next()){
                rpta=rs1.getInt(1);
                for(int i=0; i<entidad.getLista().size();i++)
                {
                sql="INSERT INTO DET_RECEPCION(ID_RECEPCION,ID_LOTE,ID_JABA,ID_PARIHUELA,ID_CATEGORIA,NUM_JABAS,PESO_BRUTO)"
                            + " VALUES(?,?,?,?,?,?,?);";
                    PreparedStatement pst1 = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                    pst1.setInt(1, entidad.getLista().get(i).getId_recepcion());
                    pst1.setInt(2,entidad.getLista().get(i).getObjLote().getId_lote());
                    pst1.setInt(3, entidad.getLista().get(i).getObjJaba().getId_jaba());
                    pst1.setInt(4, entidad.getLista().get(i).getObjParihuela().getId_parihuela());
                    pst1.setInt(5, entidad.getLista().get(i).getObjCategoria().getId_categoria());
                    pst1.setDouble(6, entidad.getLista().get(i).getNum_jabas());
                    pst1.setDouble(7, entidad.getLista().get(i).getPeso_bruto());
                    pst1.executeUpdate();
                    
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
    
    public static boolean actualizar(entRecepcion entidad) throws Exception
    {
        boolean rpta1 = false;
        Connection conn =null;
        CallableStatement stmt1 = null;
        try {
             String sql="UPDATE recepcion SET id_dir_llegada = ?,id_chofer= ?,num_guia=?,"
                     + " placa=?,modelo=?,fecha_recepcion=?,precinto=?,estado=?,usuario_responsable = ?,fecha_modificacion = GETDATE() "
                     + " WHERE id_recepcion = ?;";
             
            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt1 = conn.prepareCall(sql); 
            stmt1.setInt(1, entidad.getObjDireccionLlegada().getId_dir_llegada());
            stmt1.setInt(2, entidad.getObjChofer().getId_chofer());
            stmt1.setString(3, entidad.getNum_guia());
            stmt1.setString(4, entidad.getPlaca());
            stmt1.setString(5, entidad.getModelo());
            stmt1.setTimestamp(6, new Timestamp(entidad.getFecha_recepcion().getTime()));
            stmt1.setString(7, entidad.getPrecinto());
            stmt1.setInt(8,entidad.getEstado());
            stmt1.setString(9, entidad.getUsuario_responsable());
            stmt1.setInt(10,entidad.getId_recepcion());                
            rpta1 = stmt1.executeUpdate() == 1;
            if(rpta1)
            {   
                for(int i=0; i<entidad.getLista().size();i++)
                {
                    boolean rpta2 = false;          
                    sql="UPDATE DET_RECEPCION SET ID_RECEPCION=?,ID_LOTE= ?,ID_JABA= ?,ID_PARIHUELA= ? ,"
                            + "ID_CATEGORIA=?,NUM_JABAS=?,PESO_BRUTO=? "
                         + " WHERE ID_DET_RECEPCION = ?;";
                    CallableStatement stmt2 = conn.prepareCall(sql);    
                    stmt2.setInt(1, entidad.getLista().get(i).getId_recepcion());
                    stmt2.setInt(2, entidad.getLista().get(i).getObjLote().getId_lote());
                    stmt2.setInt(3, entidad.getLista().get(i).getObjJaba().getId_jaba());
                    stmt2.setInt(4, entidad.getLista().get(i).getObjParihuela().getId_parihuela());
                    stmt2.setInt(5, entidad.getLista().get(i).getObjCategoria().getId_categoria());
                    stmt2.setDouble(6, entidad.getLista().get(i).getNum_jabas());
                    stmt2.setDouble(7, entidad.getLista().get(i).getPeso_bruto());
                    stmt2.setInt(8, entidad.getLista().get(i).getId_det_recepcion());
                    rpta2 = stmt2.executeUpdate() == 1;
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
