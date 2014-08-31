/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.Date;

/**
 *
 * @author EdHam
 */
public class entCalibre {
    private int id_calibre;
    private entCultivo objCultivo;
    private String codigo_control;
    private String nombre;
    private boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public entCalibre() {
    }

    public entCalibre(int id_calibre) {
        this.id_calibre = id_calibre;
    }

    public int getId_calibre() {
        return id_calibre;
    }

    public void setId_calibre(int id_calibre) {
        this.id_calibre = id_calibre;
    }

    public entCultivo getObjCultivo() {
        return objCultivo;
    }

    public void setObjCultivo(entCultivo objCultivo) {
        this.objCultivo = objCultivo;
    }

    public String getCodigo_control() {
        return codigo_control;
    }

    public void setCodigo_control(String codigo_control) {
        this.codigo_control = codigo_control;
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
    
}
