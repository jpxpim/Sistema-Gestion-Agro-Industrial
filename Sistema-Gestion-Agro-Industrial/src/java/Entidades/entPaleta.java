/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class entPaleta {
    
    private int id_paleta;
    private int id_dia_recepcion;
    private Date fecha_produccion;
    private entCliente objCliente;
    private int id_estado_paleta;
    private int posicion_paleta;
    private String codigo_control;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private boolean completo;
    private List<entDetallePaleta> listaDetallePaleta;
    private List <entDetalleEstadoPaleta> listaDetalleEstadoPaleta;
    
    public entPaleta(){
        this.id_paleta=0;
        this.completo=false;
        this.listaDetallePaleta = new  ArrayList<entDetallePaleta>();
    }

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

    public int getPosicion_paleta() {
        return posicion_paleta;
    }

    public void setPosicion_paleta(int posicion_paleta) {
        this.posicion_paleta = posicion_paleta;
    }

    public String getCodigo_control() {
        return codigo_control;
    }

    public void setCodigo_control(String codigo_control) {
        this.codigo_control = codigo_control;
    }

    public boolean isCompleto() {
        return completo;
    }

    public void setCompleto(boolean completo) {
        this.completo = completo;
    }

    public int getId_dia_recepcion() {
        return id_dia_recepcion;
    }

    public void setId_dia_recepcion(int id_dia_recepcion) {
        this.id_dia_recepcion = id_dia_recepcion;
    }
    
    
}
