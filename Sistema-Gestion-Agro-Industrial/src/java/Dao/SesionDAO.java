/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entConfiguracion;
import Entidades.entFormulario;
import Entidades.entModulo;
import Entidades.entSesion;
import Entidades.entUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class SesionDAO {
    
    public static entSesion login(String login,String contrasena) throws Exception
    {
        entSesion entidad = new entSesion();        
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_usuario,login,contrasena,codigo_erp,nombre,apellido,email,telefono,celular,fecha_nacimiento,"
                    + " foto,estado,usuario_responsable,fecha_modificacion,es_administrador from usuario where login like '"+login+"' and contrasena like '"+contrasena+"'"; 

            conn = ConexionDAO.getConnection();
            conn.setAutoCommit(false);
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();
            if(dr.next())
            {
                    entUsuario objUsuario = new entUsuario();
                    objUsuario.setId_usuario(dr.getInt(1));
                    objUsuario.setLogin(dr.getString(2));
                    objUsuario.setContrasena(dr.getString(3));
                    objUsuario.setCodigo_erp(dr.getString(4));
                    objUsuario.setNombre(dr.getString(5));
                    objUsuario.setApellido(dr.getString(6));
                    objUsuario.setEmail(dr.getString(7));
                    objUsuario.setTelefono(dr.getString(8));
                    objUsuario.setCelular(dr.getString(9));
                    objUsuario.setFecha_nacimiento(dr.getDate(10));
                    objUsuario.setFoto(dr.getBytes(11));
                    objUsuario.setEstado(dr.getBoolean(12));
                    objUsuario.setUsuario_responsable(dr.getString(13));
                    objUsuario.setFecha_modificacion(dr.getTimestamp(14));
                    objUsuario.setEs_administrador(dr.getBoolean(15));
                    entidad.setObjUsuario(objUsuario);
                    List<entModulo> listaModulos = null;
                    if(objUsuario.getEstado())
                    {
                        sql="select distinct M.id_modulo,M.etiqueta,M.estado from modulo M inner join FORMULARIO F on M.ID_MODULO=F.ID_MODULO inner join FORMULARIO_USUARIO "
                            + "FU on FU.ID_FORMULARIO=F.ID_FORMULARIO where FU.ID_USUARIO="+objUsuario.getId_usuario();
                        
                        CallableStatement csModulo = conn.prepareCall(sql);
                        ResultSet rsModulo = csModulo.executeQuery();
                        
                        while (rsModulo.next()){
                            if(listaModulos==null)
                            listaModulos = new ArrayList<entModulo>();

                            entModulo objModulo = new entModulo();
                            objModulo.setId_modulo(rsModulo.getInt(1));
                            objModulo.setEtiqueta(rsModulo.getString(2)); 
                            objModulo.setEstado(rsModulo.getInt(3)); 
                             List<entFormulario> listaFormulario = null;
                            sql="select F.id_formulario,F.url,F.etiqueta,F.padre,F.estado,F.usuario_responsable,F.fecha_modificacion,F.control_form "
                                + "from formulario F join modulo M on F.id_modulo=M.id_modulo inner join FORMULARIO_USUARIO FU on "
                                + "FU.ID_FORMULARIO=F.ID_FORMULARIO where FU.ID_USUARIO="+objUsuario.getId_usuario()+" and F.ID_MODULO="+objModulo.getId_modulo()
                                +" order by F.padre asc,F.etiqueta asc";
                                CallableStatement csFormulario = conn.prepareCall(sql);
                                ResultSet rsFormulario = csFormulario.executeQuery();

                                while (rsFormulario.next()){
                                    if(listaFormulario==null)
                                    listaFormulario = new ArrayList<entFormulario>();

                                        entFormulario objFormulario = new entFormulario();
                                        objFormulario.setId_formulario(rsFormulario.getInt(1));
                                        objFormulario.setUrl(rsFormulario.getString(2)); 
                                        objFormulario.setEtiqueta(rsFormulario.getString(3)); 
                                        objFormulario.setPadre(rsFormulario.getInt(4)); 
                                        objFormulario.setEstado(rsFormulario.getBoolean(5)); 
                                        objFormulario.setUsuario_responsable(rsFormulario.getString(6)); 
                                        objFormulario.setFecha_modificacion(rsFormulario.getTimestamp(7)); 
                                        objFormulario.setControl_form(rsFormulario.getInt(8));
                                        listaFormulario.add(objFormulario);
                                }
                                csFormulario.close();
                                 rsFormulario.close();
                            objModulo.setList(listaFormulario);
                            
                            listaModulos.add(objModulo);
                        }
                        csModulo.close();
                        rsModulo.close();
                        
                         sql="select ID_CONFIGURACION,NOM_BD_ERP_EXT,IP_BD_ERP_EXT,PUERTO_ERP_EXT,USUARIO_BD_ERP_EXT,"
                    + " CONTRA_BD_ERP_EXT,TIEMPO_ALERTA,USUARIO_CLAVE,SINCRO_DASH,PRODUCTOR_EMPRESA,USUARIO_CIERRE_RECEPCION_1,"
                    + " USUARIO_CIERRE_RECEPCION_2,USUARIO_CIERRE_RECEPCION_3,INTERVALO_AGRUPACION_PRODUCCION from CONFIGURACION ";
                    
                        CallableStatement csConfiguraciom = conn.prepareCall(sql);
                        ResultSet rsConfiguracion = csConfiguraciom.executeQuery();                        
                       if(rsConfiguracion.next())
                        {
                            entConfiguracion objConfiguracion = new entConfiguracion();
                            objConfiguracion.setId_configuracion(rsConfiguracion.getInt(1));
                            objConfiguracion.setNom_bd_erp_ext(rsConfiguracion.getString(2)); 
                            objConfiguracion.setIp_bd_erp_ext(rsConfiguracion.getString(3)); 
                            objConfiguracion.setPuerto_erp_ext(rsConfiguracion.getString(4));
                            objConfiguracion.setUsuario_bd_erp_ext(rsConfiguracion.getString(5)); 
                            objConfiguracion.setContra_bd_erp_ext(rsConfiguracion.getString(6)); 
                            objConfiguracion.setTiempo_alerta(rsConfiguracion.getInt(7)); 
                            objConfiguracion.setUsuario_clave(rsConfiguracion.getString(8));
                            objConfiguracion.setSincro_dash(rsConfiguracion.getInt(9));
                            objConfiguracion.setProductor_empresa(rsConfiguracion.getInt(10));
                            objConfiguracion.setUsuario_cierre_recepcion_1(rsConfiguracion.getInt(11));
                            objConfiguracion.setUsuario_cierre_recepcion_2(rsConfiguracion.getInt(12));
                            objConfiguracion.setUsuario_cierre_recepcion_3(rsConfiguracion.getInt(13));
                            objConfiguracion.setIntervalo_agrupacion_produccion(rsConfiguracion.getInt(14));
                            entidad.setObjConfiguracion(objConfiguracion);
                        }
                       csConfiguraciom.close();
                       rsConfiguracion.close();
                        
                    }  
                    entidad.setListModulos(listaModulos);       
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
                dr.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
            }
        }
        return entidad;
    }    

}
