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
public class entChofer 
{
    private int id_chofer;
    private entTransportista objTransportista;
    private String nombre;
    private String brevete;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    
    public entChofer(){}

    public entChofer(int id_chofer) {
        this.id_chofer = id_chofer;
    }

    public int getId_chofer() {
        return id_chofer;
    }

    public void setId_chofer(int id_chofer) {
        this.id_chofer = id_chofer;
    }

    public entTransportista getObjTransportista() {
        return objTransportista;
    }

    public void setObjTransportista(entTransportista objTransportista) {
        this.objTransportista = objTransportista;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBrevete() {
        return brevete;
    }

    public void setBrevete(String brevete) {
        this.brevete = brevete;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
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
