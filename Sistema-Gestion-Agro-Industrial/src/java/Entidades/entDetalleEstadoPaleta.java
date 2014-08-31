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
public class entDetalleEstadoPaleta 
{
    private int id_det_estado_paleta;
    private int id_paleta;
    private int estado_nuevo;
    private Date fecha_modificacion;
    
    public entDetalleEstadoPaleta(){}

    public int getId_det_estado_paleta() {
        return id_det_estado_paleta;
    }

    public void setId_det_estado_paleta(int id_det_estado_paleta) {
        this.id_det_estado_paleta = id_det_estado_paleta;
    }

    public int getId_paleta() {
        return id_paleta;
    }

    public void setId_paleta(int id_paleta) {
        this.id_paleta = id_paleta;
    }

    public int getEstado_nuevo() {
        return estado_nuevo;
    }

    public void setEstado_nuevo(int estado_nuevo) {
        this.estado_nuevo = estado_nuevo;
    }

    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }
    
    
}
