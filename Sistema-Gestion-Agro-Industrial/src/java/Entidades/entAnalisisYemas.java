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
public class entAnalisisYemas {
    
    private int id_analisis_yemas;
    private entCampaniaLote objCampaniaLote;
    private entEvaluador objEvaluador;
    private Double feminelas;
    private Double fertilidad;
    private Date fecha_muestra;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    public entAnalisisYemas(){}

    public int getId_analisis_yemas() {
        return id_analisis_yemas;
    }

    public void setId_analisis_yemas(int id_analisis_yemas) {
        this.id_analisis_yemas = id_analisis_yemas;
    }

    public entCampaniaLote getObjCampaniaLote() {
        return objCampaniaLote;
    }

    public void setObjCampaniaLote(entCampaniaLote objCampaniaLote) {
        this.objCampaniaLote = objCampaniaLote;
    }

    public entEvaluador getObjEvaluador() {
        return objEvaluador;
    }

    public void setObjEvaluador(entEvaluador objEvaluador) {
        this.objEvaluador = objEvaluador;
    }

    public Double getFeminelas() {
        return feminelas;
    }

    public void setFeminelas(Double feminelas) {
        this.feminelas = feminelas;
    }

    public Double getFertilidad() {
        return fertilidad;
    }

    public void setFertilidad(Double fertilidad) {
        this.fertilidad = fertilidad;
    }

    public Date getFecha_muestra() {
        return fecha_muestra;
    }

    public void setFecha_muestra(Date fecha_muestra) {
        this.fecha_muestra = fecha_muestra;
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
