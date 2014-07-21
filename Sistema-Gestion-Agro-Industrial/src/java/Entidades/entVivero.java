/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.sql.Timestamp;

/**
 *
 * @author rosemary
 */
public class entVivero {
    
    private int id_vivero;
    private String nombre;
    private String descripcion;
    private boolean estado;
    private String usuario_responsable;
    private Timestamp fecha_modificacion;

    public entVivero(){}
    
    public int getId_vivero() {
        return id_vivero;
    }

    public void setId_vivero(int id_vivero) {
        this.id_vivero = id_vivero;
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

    public Timestamp getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Timestamp fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }
}
