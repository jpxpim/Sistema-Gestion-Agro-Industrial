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
public class entTunel {
    
    private int id_tunel;
    private String nombre;
    private String descripcion;
    private int pos_x;
    private int pos_y;
    private int pos_h;
    private boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public entTunel (){}

    public entTunel(int id_tunel) {
        this.id_tunel = id_tunel;
    }
    
    public int getId_tunel() {
        return id_tunel;
    }

    public void setId_tunel(int id_tunel) {
        this.id_tunel = id_tunel;
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

    public int getPos_x() {
        return pos_x;
    }

    public void setPos_x(int pos_x) {
        this.pos_x = pos_x;
    }

    public int getPos_y() {
        return pos_y;
    }

    public void setPos_y(int pos_y) {
        this.pos_y = pos_y;
    }

    public int getPos_h() {
        return pos_h;
    }

    public void setPos_h(int pos_h) {
        this.pos_h = pos_h;
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
