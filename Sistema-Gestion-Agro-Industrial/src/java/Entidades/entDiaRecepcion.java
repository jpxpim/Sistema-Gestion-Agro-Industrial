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
public class entDiaRecepcion {
    private int id_dia_recepcion;
    private Date hora_inicio;
    private Date hora_fin;
    private boolean es_cerrado;
    private String usuario_responsable_inicio;
    private String usuario_responsable_fin;
    private Date fecha_modificacion;

    public entDiaRecepcion() {
    }

    public int getId_dia_recepcion() {
        return id_dia_recepcion;
    }

    public void setId_dia_recepcion(int id_dia_recepcion) {
        this.id_dia_recepcion = id_dia_recepcion;
    }

    public Date getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(Date hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public Date getHora_fin() {
        return hora_fin;
    }

    public void setHora_fin(Date hora_fin) {
        this.hora_fin = hora_fin;
    }

    public boolean isEs_cerrado() {
        return es_cerrado;
    }

    public void setEs_cerrado(boolean es_cerrado) {
        this.es_cerrado = es_cerrado;
    }

    public String getUsuario_responsable_inicio() {
        return usuario_responsable_inicio;
    }

    public void setUsuario_responsable_inicio(String usuario_responsable_inicio) {
        this.usuario_responsable_inicio = usuario_responsable_inicio;
    }

    public String getUsuario_responsable_fin() {
        return usuario_responsable_fin;
    }

    public void setUsuario_responsable_fin(String usuario_responsable_fin) {
        this.usuario_responsable_fin = usuario_responsable_fin;
    }


    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }

    
}
