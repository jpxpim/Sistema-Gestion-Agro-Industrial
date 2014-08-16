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
public class entBrotacion 
{
    private int id_brotacion;
    private entCampaniaLote objCampaniaLote;
    private entEvaluador objEvaluador;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private List<entCabeceraBrotacion> list;

    public entBrotacion() {
        this.list = null;
    }
    
  

    public int getId_brotacion() {
        return id_brotacion;
    }

    public void setId_brotacion(int id_brotacion) {
        this.id_brotacion = id_brotacion;
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

    public Boolean isEstado() {
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

    public List<entCabeceraBrotacion> getList() {
        return list;
    }

    public void setList(List<entCabeceraBrotacion> list) {
        this.list = list;
    }

}
