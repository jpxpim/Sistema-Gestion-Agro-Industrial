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
public class entProductor {
    
    private int id_productor;
    private String nombre;
    private String codigo_erp;
    private String codigo_control;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    
    public entProductor(){}

    public entProductor(int id_productor) {
        this.id_productor = id_productor;
    }

    public int getId_productor() {
        return id_productor;
    }

    public void setId_productor(int id_productor) {
        this.id_productor = id_productor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo_erp() {
        return codigo_erp;
    }

    public void setCodigo_erp(String codigo_erp) {
        this.codigo_erp = codigo_erp;
    }

    public String getCodigo_control() {
        return codigo_control;
    }

    public void setCodigo_control(String codigo_control) {
        this.codigo_control = codigo_control;
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
