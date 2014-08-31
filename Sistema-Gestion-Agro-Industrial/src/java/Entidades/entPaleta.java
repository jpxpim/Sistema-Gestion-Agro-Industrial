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
 * @author rosemary
 */
public class entPaleta {
    
    private int id_paleta;
    private Date fecha_produccion;
    private entCliente objCliente;
    private int id_estado_paleta;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private List<entDetallePaleta> listaDetallePaleta;
    private List <entDetalleEstadoPaleta> listaDetalleEstadoPaleta;
    
    public entPaleta(){}

    public List<entDetalleEstadoPaleta> getListaDetalleEstadoPaleta() {
        return listaDetalleEstadoPaleta;
    }

    public void setListaDetalleEstadoPaleta(List<entDetalleEstadoPaleta> listaDetalleEstadoPaleta) {
        this.listaDetalleEstadoPaleta = listaDetalleEstadoPaleta;
    }

    
    
    public List<entDetallePaleta> getListaDetallePaleta() {
        return listaDetallePaleta;
    }

    public void setListaDetallePaleta(List<entDetallePaleta> listaDetallePaleta) {
        this.listaDetallePaleta = listaDetallePaleta;
    }
    
    public int getId_paleta() {
        return id_paleta;
    }

    public void setId_paleta(int id_paleta) {
        this.id_paleta = id_paleta;
    }

    public Date getFecha_produccion() {
        return fecha_produccion;
    }

    public void setFecha_produccion(Date fecha_produccion) {
        this.fecha_produccion = fecha_produccion;
    }

    public entCliente getObjCliente() {
        return objCliente;
    }

    public void setObjCliente(entCliente objCliente) {
        this.objCliente = objCliente;
    }

    public int getId_estado_paleta() {
        return id_estado_paleta;
    }

    public void setId_estado_paleta(int id_estado_paleta) {
        this.id_estado_paleta = id_estado_paleta;
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
