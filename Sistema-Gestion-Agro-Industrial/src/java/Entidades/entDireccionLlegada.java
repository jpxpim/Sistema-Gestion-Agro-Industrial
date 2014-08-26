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
public class entDireccionLlegada 
{
    private int id_dir_llegada;
    private String nombre;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    
    public entDireccionLlegada(){}

    public entDireccionLlegada(int id_dir_llegada) {
        this.id_dir_llegada = id_dir_llegada;
    }

    public int getId_dir_llegada() {
        return id_dir_llegada;
    }

    public void setId_dir_llegada(int id_dir_llegada) {
        this.id_dir_llegada = id_dir_llegada;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
