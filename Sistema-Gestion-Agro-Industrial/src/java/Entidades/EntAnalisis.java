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
public class entAnalisis 
{
    private int id_analisis;
    private String nombre;
    private String tabla_nombre;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public int getId_analisis() {
        return id_analisis;
    }

    public void setId_analisis(int id_analisis) {
        this.id_analisis = id_analisis;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTabla_nombre() {
        return tabla_nombre;
    }

    public void setTabla_nombre(String tabla_nombre) {
        this.tabla_nombre = tabla_nombre;
    }

    public Boolean isEstado() {
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
