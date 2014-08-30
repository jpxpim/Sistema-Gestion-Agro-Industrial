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
public class entParihuela 
{
    private int id_parihuela;
    private String nombre;
    private Double peso;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    
    public entParihuela(){}

    public entParihuela(int id_parihuela) {
        this.id_parihuela = id_parihuela;
    }

    public int getId_parihuela() {
        return id_parihuela;
    }

    public void setId_parihuela(int id_parihuela) {
        this.id_parihuela = id_parihuela;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
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
