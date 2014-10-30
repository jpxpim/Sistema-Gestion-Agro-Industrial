/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.*;
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
public class LoteDAO 
{
   public static List<entLote> GraficoHectreasAnio() throws Exception
    {
        List<entLote> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select sum(L.HECTAREAS),L.ANIO_SIEMBRA from LOTE L where L.Estado=1 group by  L.ANIO_SIEMBRA ";

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entLote>();
                //Lote
                entLote entidad = new entLote(); 
                entidad.setHectareas(dr.getDouble(1));
                entidad.setAnio_siembra(dr.getInt(2));
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
   
    public static List<entLote> GraficoHectareasVariedad() throws Exception
    {
        List<entLote> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select sum(L.HECTAREAS),V.NOMBRE from LOTE L inner join VARIEDAD V on L.ID_VARIEDAD=V.ID_VARIEDAD where L.Estado=1 group by V.NOMBRE";

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entLote>();
                //Lote
                entLote entidad = new entLote(); 
                entidad.setHectareas(dr.getDouble(1));
                entidad.setNombre(dr.getString(2));
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
    
    public static List<entLote> Listar(boolean activo) throws Exception
    {
        List<entLote> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="SELECT L.ID_LOTE, L.CODIGO_CONTROL, L.NOMBRE, L.DESCRIPCION, L.HECTAREAS,L.CENTRO_COSTO, L.ANIO_SIEMBRA, L.ESTADO, L.USUARIO_RESPONSABLE, L.FECHA_MODIFICACION, \n" +
                        " PR.ID_PRODUCTOR, PR.NOMBRE, PR.CODIGO_ERP, PR.CODIGO_CONTROL, PR.ESTADO, PR.USUARIO_RESPONSABLE, PR.FECHA_MODIFICACION, \n" +
                        " PA.ID_PATRON, PA.NOMBRE, PA.DESCRIPCION, PA.CODIGO_CONTROL, PA.ESTADO, PA.USUARIO_RESPONSABLE, PA.FECHA_MODIFICACION, \n" +
                        " VI.ID_VIVERO, VI.NOMBRE, VI.DESCRIPCION, VI.CODIGO_CONTROL, VI.ESTADO, VI.USUARIO_RESPONSABLE, VI.FECHA_MODIFICACION, \n" +
                        " SS.ID_SUB_SECTOR, SS.ID_SECTOR, SS.NOMBRE, SS.DESCRIPCION, SS.CODIGO_CONTROL, SS.GROWER_SENASA, SS.ESTADO, SS.USUARIO_RESPONSABLE, SS.FECHA_MODIFICACION, \n" +
                        " S.ID_SECTOR, S.NOMBRE, S.DESCRIPCION, S.CODIGO_CONTROL, S.ESTADO, S.USUARIO_RESPONSABLE, S.FECHA_MODIFICACION, \n" +
                        " TC.ID_TIPO_CULTIVO, TC.NOMBRE, TC.DESCRIPCION, TC.CODIGO_CONTROL, TC.ESTADO, TC.USUARIO_RESPONSABLE, TC.FECHA_MODIFICACION, \n" +
                        " EC.ID_EDAD_CULTIVO, EC.NOMBRE, EC.DESCRIPCION, EC.CODIGO_CONTROL, EC.ESTADO, EC.USUARIO_RESPONSABLE, EC.FECHA_MODIFICACION, \n" +
                        " VA.ID_VARIEDAD, VA.ID_CULTIVO, VA.NOMBRE, VA.DESCRIPCION, VA.CODIGO_CONTROL, VA.ESTADO, VA.USUARIO_RESPONSABLE, VA.FECHA_MODIFICACION, \n" +
                        " C.ID_CULTIVO, C.NOMBRE, C.DESCRIPCION, C.CODIGO_CONTROL, C.ESTADO, C.USUARIO_RESPONSABLE, C.FECHA_MODIFICACION  \n" +
                        " FROM LOTE L \n" +
                        " JOIN PRODUCTOR PR ON L.ID_PRODUCTOR=PR.ID_PRODUCTOR \n" +
                        " JOIN PATRON PA ON L.ID_PATRON=PA.ID_PATRON \n" +
                        " JOIN VIVERO VI ON L.ID_VIVERO=VI.ID_VIVERO \n" +
                        " JOIN SUB_SECTOR SS ON L.ID_SUB_SECTOR=SS.ID_SUB_SECTOR \n" +
                        " JOIN SECTOR S ON SS.ID_SECTOR=S.ID_SECTOR \n" +
                        " JOIN TIPO_CULTIVO TC ON L.ID_TIPO_CULTIVO=TC.ID_TIPO_CULTIVO \n" +
                        " JOIN EDAD_CULTIVO EC ON L.ID_EDAD_CULTIVO=EC.ID_EDAD_CULTIVO \n" +
                        " JOIN VARIEDAD VA ON L.ID_VARIEDAD=VA.ID_VARIEDAD \n" +
                        " JOIN CULTIVO C ON VA.ID_CULTIVO=C.ID_CULTIVO ";
            if(activo)
                        sql+=" where L.ESTADO=1"; 
            
                        sql+=" order by  L.nombre"; 

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entLote>();
                //Productor
                entProductor objProductor = new entProductor();
                objProductor.setId_productor(dr.getInt(11));
                objProductor.setNombre(dr.getString(12)); 
                objProductor.setCodigo_erp(dr.getString(13)); 
                objProductor.setCodigo_control(dr.getString(14));
                objProductor.setEstado(dr.getBoolean(15)); 
                objProductor.setUsuario_responsable(dr.getString(16)); 
                objProductor.setFecha_modificacion(dr.getTimestamp(17));
                //Patron
                entPatron objPatron = new entPatron();
                objPatron.setId_patron(dr.getInt(18));
                objPatron.setNombre(dr.getString(19)); 
                objPatron.setDescripcion(dr.getString(20)); 
                objPatron.setCodigo_control(dr.getString(21)); 
                objPatron.setEstado(dr.getBoolean(22)); 
                objPatron.setUsuario_responsable(dr.getString(23)); 
                objPatron.setFecha_modificacion(dr.getTimestamp(24)); 
                //Vivero
                entVivero objVivero = new entVivero();
                objVivero.setId_vivero(dr.getInt(25));
                objVivero.setNombre(dr.getString(26)); 
                objVivero.setDescripcion(dr.getString(27)); 
                objVivero.setCodigo_control(dr.getString(28)); 
                objVivero.setEstado(dr.getBoolean(29)); 
                objVivero.setUsuario_responsable(dr.getString(30)); 
                objVivero.setFecha_modificacion(dr.getTimestamp(31)); 
                //Sub Sector
                    //Sector                    
                    entSector sector = new entSector();
                    sector.setId_sector(dr.getInt(41));
                    sector.setNombre(dr.getString(42)); 
                    sector.setDescripcion(dr.getString(43)); 
                    sector.setCodigo_control(dr.getString(44)); 
                    sector.setEstado(dr.getBoolean(45)); 
                    sector.setUsuario_responsable(dr.getString(46)); 
                    sector.setFecha_modificacion(dr.getTimestamp(47));
                entSubSector objSubSector = new entSubSector();
                objSubSector.setId_sub_sector(dr.getInt(32));
                objSubSector.setNombre(dr.getString(34)); 
                objSubSector.setDescripcion(dr.getString(35)); 
                objSubSector.setCodigo_control(dr.getString(36)); 
                objSubSector.setGrower_senasa(dr.getString(37));
                objSubSector.setEstado(dr.getBoolean(38)); 
                objSubSector.setUsuario_responsable(dr.getString(39)); 
                objSubSector.setFecha_modificacion(dr.getTimestamp(40)); 
                objSubSector.setObjSector(sector);
                //Tipo Cultivo
                entTipoCultivo objTipoCultivo = new entTipoCultivo();
                objTipoCultivo.setId_tipo_cultivo(dr.getInt(48));
                objTipoCultivo.setNombre(dr.getString(49)); 
                objTipoCultivo.setDescripcion(dr.getString(50)); 
                objTipoCultivo.setCodigo_control(dr.getString(51)); 
                objTipoCultivo.setEstado(dr.getBoolean(52)); 
                objTipoCultivo.setUsuario_responsable(dr.getString(53)); 
                objTipoCultivo.setFecha_modificacion(dr.getTimestamp(54)); 
                //Edad Cultivo
                entEdadCultivo objEdadCultivo = new entEdadCultivo();
                objEdadCultivo.setId_edad_cultivo(dr.getInt(55));
                objEdadCultivo.setNombre(dr.getString(56)); 
                objEdadCultivo.setDescripcion(dr.getString(57)); 
                objEdadCultivo.setCodigo_control(dr.getString(58)); 
                objEdadCultivo.setEstado(dr.getBoolean(59)); 
                objEdadCultivo.setUsuario_responsable(dr.getString(60)); 
                objEdadCultivo.setFecha_modificacion(dr.getTimestamp(61));
                //Variedad
                    //Cultivo
                    entCultivo objCultivo = new entCultivo();
                    objCultivo.setId_cultivo(dr.getInt(70));
                    objCultivo.setNombre(dr.getString(71)); 
                    objCultivo.setDescripcion(dr.getString(72)); 
                    objCultivo.setCodigo_control(dr.getString(73));
                    objCultivo.setEstado(dr.getBoolean(74)); 
                    objCultivo.setUsuario_responsable(dr.getString(75)); 
                    objCultivo.setFecha_modificacion(dr.getTimestamp(76)); 
                entVariedad objVariedad = new entVariedad();
                objVariedad.setId_variedad(dr.getInt(62));
                objVariedad.setNombre(dr.getString(64)); 
                objVariedad.setDescripcion(dr.getString(65)); 
                objVariedad.setCodigo_control(dr.getString(66)); 
                objVariedad.setEstado(dr.getBoolean(67)); 
                objVariedad.setUsuario_responsable(dr.getString(68)); 
                objVariedad.setFecha_modificacion(dr.getTimestamp(69));
                objVariedad.setObjCultivo(objCultivo);
                
                //Lote
                entLote entidad = new entLote();
                entidad.setId_lote(dr.getInt(1));
                entidad.setCodigo_control(dr.getString(2));
                entidad.setNombre(dr.getString(3)); 
                entidad.setDescripcion(dr.getString(4)); 
                entidad.setHectareas(dr.getDouble(5));
                entidad.setCentro_costo(dr.getString(6));
                entidad.setAnio_siembra(dr.getInt(7));
                entidad.setEstado(dr.getBoolean(8)); 
                entidad.setUsuario_responsable(dr.getString(9)); 
                entidad.setFecha_modificacion(dr.getTimestamp(10)); 
                entidad.setObjProductor(objProductor);                    
                entidad.setObjPatron(objPatron);
                entidad.setObjVivero(objVivero);
                entidad.setObjSubSector(objSubSector);
                entidad.setObjTipoCultivo(objTipoCultivo);
                entidad.setObjEdadCultivo(objEdadCultivo);
                entidad.setObjVariedad(objVariedad);
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
     public static List<entLote> ListarDiaRecepccion(int idDiaRecepcion) throws Exception
    {
        List<entLote> lista = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select DISTINCT L.ID_LOTE,L.NOMBRE,L.CODIGO_CONTROL from RECEPCION R JOIN \n" +
                            "DET_RECEPCION DR ON R.ID_RECEPCION=DR.ID_RECEPCION JOIN LOTE L ON \n" +
                            "DR.ID_LOTE=L.ID_LOTE where R.ID_DIA_RECEPCION="+idDiaRecepcion;


            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                if(lista==null)
                    lista= new ArrayList<entLote>();
               
                //Lote
                entLote entidad = new entLote();
                entidad.setId_lote(dr.getInt(1));                
                entidad.setNombre(dr.getString(2)); 
                entidad.setCodigo_control(dr.getString(3));
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
    
    
    public  static int insertar(entLote entidad) throws Exception
    {
        int rpta = 0;
        Connection conn =null;
        PreparedStatement  stmt = null;
        try {
            
           String sql="INSERT INTO lote(codigo_control,nombre,descripcion,hectareas,id_productor,"
                   + " centro_costo,id_patron,id_vivero,id_sub_sector,id_tipo_cultivo,"
                   + " id_edad_cultivo,id_variedad,anio_siembra,estado,usuario_responsable,fecha_modificacion)"
                   + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,GETDATE());";
           
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, entidad.getCodigo_control());
            stmt.setString(2, entidad.getNombre());
            stmt.setString(3, entidad.getDescripcion());
            stmt.setDouble(4, entidad.getHectareas());
            stmt.setInt(5, entidad.getObjProductor().getId_productor());
            stmt.setString(6, entidad.getCentro_costo());
            stmt.setInt(7, entidad.getObjPatron().getId_patron());
            stmt.setInt(8, entidad.getObjVivero().getId_vivero());
            stmt.setInt(9, entidad.getObjSubSector().getId_sub_sector());
            stmt.setInt(10, entidad.getObjTipoCultivo().getId_tipo_cultivo());
            stmt.setInt(11, entidad.getObjEdadCultivo().getId_edad_cultivo());
            stmt.setInt(12, entidad.getObjVariedad().getId_variedad());
            stmt.setInt(13, entidad.getAnio_siembra());
            stmt.setBoolean(14, entidad.getEstado());
            stmt.setString(15, entidad.getUsuario_responsable());
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
    
    public static boolean actualizar(entLote entidad) throws Exception
    {
        boolean rpta = false;
        Connection conn =null;
        CallableStatement stmt = null;
        try {
             String sql="UPDATE lote SET codigo_control = ?,nombre= ?,descripcion=?,hectareas= ?, "
                     + " id_productor=?, centro_costo=?, id_patron=?, id_vivero=?, id_sub_sector=?, "
                     + " id_tipo_cultivo=?,id_edad_cultivo=?,id_variedad=?,anio_siembra=?,estado=?, "
                     + " usuario_responsable = ?,fecha_modificacion = GETDATE() WHERE id_lote = ?;";
             
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);             
            stmt.setString(1, entidad.getCodigo_control());
            stmt.setString(2, entidad.getNombre());
            stmt.setString(3, entidad.getDescripcion());
            stmt.setDouble(4,entidad.getHectareas());
            stmt.setInt(5,entidad.getObjProductor().getId_productor());
            stmt.setString(6, entidad.getCentro_costo());
            stmt.setInt(7,entidad.getObjPatron().getId_patron());
            stmt.setInt(8,entidad.getObjVivero().getId_vivero());
            stmt.setInt(9,entidad.getObjSubSector().getId_sub_sector());
            stmt.setInt(10,entidad.getObjTipoCultivo().getId_tipo_cultivo());
            stmt.setInt(11,entidad.getObjEdadCultivo().getId_edad_cultivo());
            stmt.setInt(12,entidad.getObjVariedad().getId_variedad());
            stmt.setInt(13,entidad.getAnio_siembra());
            stmt.setBoolean(14, entidad.getEstado());
            stmt.setString(15, entidad.getUsuario_responsable());
            stmt.setInt(16,entidad.getId_lote());
                
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
