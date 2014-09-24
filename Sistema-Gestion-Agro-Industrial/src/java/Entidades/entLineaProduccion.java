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
public class entLineaProduccion {
    private int id_linea_produccion;
    private String nombre;
    private boolean estado;
    private boolean reempaque;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public entLineaProduccion() {
    }

    public entLineaProduccion(int id_linea_produccion) {
        this.id_linea_produccion = id_linea_produccion;
    }

    public int getId_linea_produccion() {
        return id_linea_produccion;
    }

    public void setId_linea_produccion(int id_linea_produccion) {
        this.id_linea_produccion = id_linea_produccion;
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

    public boolean isReempaque() {
        return reempaque;
    }

    public void setReempaque(boolean reempaque) {
        this.reempaque = reempaque;
    }
    
}
