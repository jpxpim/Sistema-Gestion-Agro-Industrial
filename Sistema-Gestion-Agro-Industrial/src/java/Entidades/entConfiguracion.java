/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

/**
 *
 * @author rosemary
 */
public class entConfiguracion {
    private int id_configuracion;
    private String nom_bd_erp_ext;
    private String ip_bd_erp_ext;
    private String puerto_erp_ext;
    private String usuario_bd_erp_ext;
    private String contra_bd_erp_ext;
    private int tiempo_alerta;
    private String usuario_clave;    
    private int sincro_dash;    
    private int productor_empresa;
    private int usuario_cierre_recepcion_1;
    private int usuario_cierre_recepcion_2;
    private int usuario_cierre_recepcion_3;
    private int minutos_bloqueo;
    private int max_intentos_login;
    private int intervalo_agrupacion_produccion;
    
    public entConfiguracion ()
    {
        this.usuario_cierre_recepcion_2=0;
        this.usuario_cierre_recepcion_3=0;
    }

    public int getId_configuracion() {
        return id_configuracion;
    }

    public void setId_configuracion(int id_configuracion) {
        this.id_configuracion = id_configuracion;
    }

    public String getNom_bd_erp_ext() {
        return nom_bd_erp_ext;
    }

    public void setNom_bd_erp_ext(String nom_bd_erp_ext) {
        this.nom_bd_erp_ext = nom_bd_erp_ext;
    }

    public String getIp_bd_erp_ext() {
        return ip_bd_erp_ext;
    }

    public void setIp_bd_erp_ext(String ip_bd_erp_ext) {
        this.ip_bd_erp_ext = ip_bd_erp_ext;
    }

    public String getPuerto_erp_ext() {
        return puerto_erp_ext;
    }

    public void setPuerto_erp_ext(String puerto_erp_ext) {
        this.puerto_erp_ext = puerto_erp_ext;
    }

    public String getUsuario_bd_erp_ext() {
        return usuario_bd_erp_ext;
    }

    public void setUsuario_bd_erp_ext(String usuario_bd_erp_ext) {
        this.usuario_bd_erp_ext = usuario_bd_erp_ext;
    }

    public String getContra_bd_erp_ext() {
        return contra_bd_erp_ext;
    }

    public void setContra_bd_erp_ext(String contra_bd_erp_ext) {
        this.contra_bd_erp_ext = contra_bd_erp_ext;
    }

    public int getTiempo_alerta() {
        return tiempo_alerta;
    }

    public void setTiempo_alerta(int tiempo_alerta) {
        this.tiempo_alerta = tiempo_alerta;
    }

    public String getUsuario_clave() {
        return usuario_clave;
    }

    public void setUsuario_clave(String usuario_clave) {
        this.usuario_clave = usuario_clave;
    }

    public int getMax_intentos_login() {
        return max_intentos_login;
    }

    public void setMax_intentos_login(int max_intentos_login) {
        this.max_intentos_login = max_intentos_login;
    }

    public int getSincro_dash() {
        return sincro_dash;
    }

    public void setSincro_dash(int sincro_dash) {
        this.sincro_dash = sincro_dash;
    }

    public int getMinutos_bloqueo() {
        return minutos_bloqueo;
    }

    public void setMinutos_bloqueo(int minutos_bloqueo) {
        this.minutos_bloqueo = minutos_bloqueo;
    }

    public int getProductor_empresa() {
        return productor_empresa;
    }

    public void setProductor_empresa(int productor_empresa) {
        this.productor_empresa = productor_empresa;
    }

    public int getUsuario_cierre_recepcion_1() {
        return usuario_cierre_recepcion_1;
    }

    public void setUsuario_cierre_recepcion_1(int usuario_cierre_recepcion_1) {
        this.usuario_cierre_recepcion_1 = usuario_cierre_recepcion_1;
    }

    public int getUsuario_cierre_recepcion_2() {
        return usuario_cierre_recepcion_2;
    }

    public void setUsuario_cierre_recepcion_2(int usuario_cierre_recepcion_2) {
        this.usuario_cierre_recepcion_2 = usuario_cierre_recepcion_2;
    }

    public int getUsuario_cierre_recepcion_3() {
        return usuario_cierre_recepcion_3;
    }

    public void setUsuario_cierre_recepcion_3(int usuario_cierre_recepcion_3) {
        this.usuario_cierre_recepcion_3 = usuario_cierre_recepcion_3;
    }

    public int getIntervalo_agrupacion_produccion() {
        return intervalo_agrupacion_produccion;
    }

    public void setIntervalo_agrupacion_produccion(int intervalo_agrupacion_produccion) {
        this.intervalo_agrupacion_produccion = intervalo_agrupacion_produccion;
    }

  
    
    
}
