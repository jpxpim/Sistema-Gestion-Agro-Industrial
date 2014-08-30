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
public class entProductoTerminado 
{
    private int id_producto_terminado;
    private int id_dia_recepcion;
    private entEnvase objEnvase;
    private entCalibre objCalibre;
    private entCategoria    objCategoria;
    private entColor    objColor;
    private entLote    objLote;
    private entReceta objReceta;
    private entLineaProduccion objLineaProduccion;
    private String seleccionador;
    private String embalador;
    private String codigo_control;
    private Date fecha_produccion;
    private int estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    

    public entProductoTerminado (){}

    public entReceta getObjReceta() {
        return objReceta;
    }

    public void setObjReceta(entReceta objReceta) {
        this.objReceta = objReceta;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getId_producto_terminado() {
        return id_producto_terminado;
    }

    public void setId_producto_terminado(int id_producto_terminado) {
        this.id_producto_terminado = id_producto_terminado;
    }
    public int getId_dia_recepcion() {
        return id_dia_recepcion;
    }

    public void setId_dia_recepcion(int id_dia_recepcion) {
        this.id_dia_recepcion = id_dia_recepcion;
    }

    public entEnvase getObjEnvase() {
        return objEnvase;
    }

    public void setObjEnvase(entEnvase objEnvase) {
        this.objEnvase = objEnvase;
    }

    public entCalibre getObjCalibre() {
        return objCalibre;
    }

    public void setObjCalibre(entCalibre objCalibre) {
        this.objCalibre = objCalibre;
    }

    public entCategoria getObjCategoria() {
        return objCategoria;
    }

    public void setObjCategoria(entCategoria objCategoria) {
        this.objCategoria = objCategoria;
    }

    public entColor getObjColor() {
        return objColor;
    }

    public void setObjColor(entColor objColor) {
        this.objColor = objColor;
    }

    public entLote getObjLote() {
        return objLote;
    }

    public void setObjLote(entLote objLote) {
        this.objLote = objLote;
    }

    public entLineaProduccion getObjLineaProduccion() {
        return objLineaProduccion;
    }

    public void setObjLineaProduccion(entLineaProduccion objLineaProduccion) {
        this.objLineaProduccion = objLineaProduccion;
    }

    public String getSeleccionador() {
        return seleccionador;
    }

    public void setSeleccionador(String seleccionador) {
        this.seleccionador = seleccionador;
    }

    public String getEmbalador() {
        return embalador;
    }

    public void setEmbalador(String embalador) {
        this.embalador = embalador;
    }

    public String getCodigo_control() {
        return codigo_control;
    }

    public void setCodigo_control(String codigo_control) {
        this.codigo_control = codigo_control;
    }

    public Date getFecha_produccion() {
        return fecha_produccion;
    }

    public void setFecha_produccion(Date fecha_produccion) {
        this.fecha_produccion = fecha_produccion;
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
