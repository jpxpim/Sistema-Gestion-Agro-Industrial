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
public class entJaba 
{
    private int id_jaba;
    private String nombre;
    private Double peso;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
            
    public entJaba (){}

    public entJaba(int id_jaba) {
        this.id_jaba = id_jaba;
    }

    public int getId_jaba() {
        return id_jaba;
    }

    public void setId_jaba(int id_jaba) {
        this.id_jaba = id_jaba;
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
