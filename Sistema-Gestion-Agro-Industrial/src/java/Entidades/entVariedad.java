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
public class entVariedad 
{
    private int id_variedad;
    private String nombre;
    private String descripcion;
    private String codigo_control;
    private boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private entCultivo objCultivo;
    
    public entVariedad()
    {
    }

    public int getId_variedad() {
        return id_variedad;
    }

    public void setId_variedad(int id_variedad) {
        this.id_variedad = id_variedad;
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

    public String getCodigo_control() {
        return codigo_control;
    }

    public void setCodigo_control(String codigo_control) {
        this.codigo_control = codigo_control;
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

    public entCultivo getObjCultivo() {
        return objCultivo;
    }

    public void setObjCultivo(entCultivo objCultivo) {
        this.objCultivo = objCultivo;
    }
    
    
}
