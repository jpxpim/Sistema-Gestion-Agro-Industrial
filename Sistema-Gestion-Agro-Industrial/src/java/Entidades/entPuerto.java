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
public class entPuerto {
    
    private int id_puerto;
    private String nombre;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private Boolean estado;
    public entPuerto (){}

    public int getId_puerto() {
        return id_puerto;
    }

    public entPuerto(int id_puerto) {
        this.id_puerto = id_puerto;
    }

    public void setId_puerto(int id_puerto) {
        this.id_puerto = id_puerto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
    
    
}
