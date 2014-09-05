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
public class entCargaTunel {

    private int id_carga_tunel;
    private entTunel objTunel;
    private int id_dia_recepcion;
    private Date inicio_carga;
    private Date fin_carga;
    private Double temperatura_carga;
    private Double temperatura_descarga;
    private Date inicio_descarga;
    private Date fin_descarga;
    private Boolean estado;
    private List<entDetalleCargaTunel> listaDetalleCargaTunel;
    private String usuario_responsable;
    private Date fecha_modificacion; 
    public entCargaTunel (){
        this.listaDetalleCargaTunel=new ArrayList<entDetalleCargaTunel>();
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

    
    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    
    public int getId_carga_tunel() {
        return id_carga_tunel;
    }

    public void setId_carga_tunel(int id_carga_tunel) {
        this.id_carga_tunel = id_carga_tunel;
    }

    public entTunel getObjTunel() {
        return objTunel;
    }

    public void setObjTunel(entTunel objTunel) {
        this.objTunel = objTunel;
    }

    public Date getInicio_carga() {
        return inicio_carga;
    }

    public void setInicio_carga(Date inicio_carga) {
        this.inicio_carga = inicio_carga;
    }

    public Date getFin_carga() {
        return fin_carga;
    }

    public void setFin_carga(Date fin_carga) {
        this.fin_carga = fin_carga;
    }

    public Double getTemperatura_carga() {
        return temperatura_carga;
    }

    public void setTemperatura_carga(Double temperatura_carga) {
        this.temperatura_carga = temperatura_carga;
    }

    public Double getTemperatura_descarga() {
        return temperatura_descarga;
    }

    public void setTemperatura_descarga(Double temperatura_descarga) {
        this.temperatura_descarga = temperatura_descarga;
    }

    public Date getInicio_descarga() {
        return inicio_descarga;
    }

    public void setInicio_descarga(Date inicio_descarga) {
        this.inicio_descarga = inicio_descarga;
    }

    public Date getFin_descarga() {
        return fin_descarga;
    }

    public void setFin_descarga(Date fin_descarga) {
        this.fin_descarga = fin_descarga;
    }

    public List<entDetalleCargaTunel> getListaDetalleCargaTunel() {
        return listaDetalleCargaTunel;
    }

    public void setListaDetalleCargaTunel(List<entDetalleCargaTunel> listaDetalleCargaTunel) {
        this.listaDetalleCargaTunel = listaDetalleCargaTunel;
    }

    public int getId_dia_recepcion() {
        return id_dia_recepcion;
    }

    public void setId_dia_recepcion(int id_dia_recepcion) {
        this.id_dia_recepcion = id_dia_recepcion;
    }
    
    
    
}
