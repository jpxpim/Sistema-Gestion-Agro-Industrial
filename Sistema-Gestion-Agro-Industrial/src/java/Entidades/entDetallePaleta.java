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
public class entDetallePaleta {
    
    private int id_det_paleta;
    private int id_paleta;
    private entProductoTerminado objProductoTerminado;
    private int estado;
    private int id_paleta_origen;
    private Date fecha_modificacion;
    
    public entDetallePaleta(){}

    public int getId_det_paleta() {
        return id_det_paleta;
    }

    public void setId_det_paleta(int id_det_paleta) {
        this.id_det_paleta = id_det_paleta;
    }

    public int getId_paleta() {
        return id_paleta;
    }

    public void setId_paleta(int id_paleta) {
        this.id_paleta = id_paleta;
    }

    public entProductoTerminado getObjProductoTerminado() {
        return objProductoTerminado;
    }

    public void setObjProductoTerminado(entProductoTerminado objProductoTerminado) {
        this.objProductoTerminado = objProductoTerminado;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getId_paleta_origen() {
        return id_paleta_origen;
    }

    public void setId_paleta_origen(int id_paleta_origen) {
        this.id_paleta_origen = id_paleta_origen;
    }

    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }
    
    
}
