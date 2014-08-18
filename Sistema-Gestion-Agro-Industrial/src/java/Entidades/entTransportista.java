/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.Date;

/**
 *
 * @author rosemary
 */
public class entTransportista 
{
    private int id_transportista;
    private String razon_social;
    private String ruc;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private Boolean estado;
    
    public entTransportista(){}

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    
    public int getId_transportista() {
        return id_transportista;
    }

    public void setId_transportista(int id_transportista) {
        this.id_transportista = id_transportista;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getUsuario_responsable() {
        return usuario_responsable;
    }

    public void setUsuario_responsable(String usuario_responsable) {
        this.usuario_responsable = usuario_responsable;
    }

    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }
    
    
}
