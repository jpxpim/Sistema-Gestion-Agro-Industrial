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
public class entLote 
{
    private int id_lote;
    private String codigo_control;
    private String nombre;
    private String descripcion;
    private double hectareas;
    private entProductor objProductor;
    private String centro_costo;
    private entPatron objPatron;
    private entVivero objVivero;
    private entSubSector objSubSector;
    private entTipoCultivo objTipoCultivo;
    private entEdadCultivo objEdadCultivo;
    private entVariedad objVariedad;
    private int anio_siembra;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    
    public entLote(){}

    public int getId_lote() {
        return id_lote;
    }

    public void setId_lote(int id_lote) {
        this.id_lote = id_lote;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getHectareas() {
        return hectareas;
    }

    public void setHectareas(double hectareas) {
        this.hectareas = hectareas;
    }

    public entProductor getObjProductor() {
        return objProductor;
    }

    public void setObjProductor(entProductor objProductor) {
        this.objProductor = objProductor;
    }

    public String getCentro_costo() {
        return centro_costo;
    }

    public void setCentro_costo(String centro_costo) {
        this.centro_costo = centro_costo;
    }

    public entPatron getObjPatron() {
        return objPatron;
    }

    public void setObjPatron(entPatron objPatron) {
        this.objPatron = objPatron;
    }

    public entVivero getObjVivero() {
        return objVivero;
    }

    public void setObjVivero(entVivero objVivero) {
        this.objVivero = objVivero;
    }

    public entSubSector getObjSubSector() {
        return objSubSector;
    }

    public void setObjSubSector(entSubSector objSubSector) {
        this.objSubSector = objSubSector;
    }

    public entTipoCultivo getObjTipoCultivo() {
        return objTipoCultivo;
    }

    public void setObjTipoCultivo(entTipoCultivo objTipoCultivo) {
        this.objTipoCultivo = objTipoCultivo;
    }

    public entEdadCultivo getObjEdadCultivo() {
        return objEdadCultivo;
    }

    public void setObjEdadCultivo(entEdadCultivo objEdadCultivo) {
        this.objEdadCultivo = objEdadCultivo;
    }

    public entVariedad getObjVariedad() {
        return objVariedad;
    }

    public void setObjVariedad(entVariedad objVariedad) {
        this.objVariedad = objVariedad;
    }

    public int getAnio_siembra() {
        return anio_siembra;
    }

    public void setAnio_siembra(int anio_siembra) {
        this.anio_siembra = anio_siembra;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
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
