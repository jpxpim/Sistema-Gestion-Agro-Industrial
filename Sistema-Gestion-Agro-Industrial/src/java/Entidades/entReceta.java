/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.Date;
import java.util.List;

/**
 *
 * @author EdHam
 */
public class entReceta {
    private int id_receta;
    private String nombre;
    private boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    List<entDetalleReceta> list;
    public entReceta() {
    }

    public entReceta(int id_receta) {
        this.id_receta = id_receta;
    }

 
    public int getId_receta() {
        return id_receta;
    }

    public void setId_receta(int id_receta) {
        this.id_receta = id_receta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isEstado() {
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

    public List<entDetalleReceta> getList() {
        return list;
    }

    public void setList(List<entDetalleReceta> list) {
        this.list = list;
    }
    
}
