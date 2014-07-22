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
public class entTipoCultivo 
{
    private int id_tipo_cultivo;
    private String nombre;
    private String descripcion;
    private boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public entTipoCultivo(){}
    
    public int getId_tipo_cultivo() {
        return id_tipo_cultivo;
    }

    public void setId_tipo_cultivo(int id_tipo_cultivo) {
        this.id_tipo_cultivo = id_tipo_cultivo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
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
