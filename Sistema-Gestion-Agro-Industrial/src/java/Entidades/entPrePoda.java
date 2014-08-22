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
public class entPrePoda 
{
    private int id_pre_poda;
    private entCampaniaLote objCampaniaLote;
    private entEvaluador objEvaluador;
    private Date fecha_registro;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private Boolean seleccion; 
    private List<entCabeceraPrePoda> list;
    
    public entPrePoda() {
        this.list = null;
        this.seleccion = false;
    }

    public int getId_pre_poda() {
        return id_pre_poda;
    }

    public void setId_pre_poda(int id_pre_poda) {
        this.id_pre_poda = id_pre_poda;
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


    public List<entCabeceraPrePoda> getList() {
        return list;
    }

    public void setList(List<entCabeceraPrePoda> list) {
        this.list = list;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public Boolean isSeleccion() {
        return seleccion;
    }

    public void setSeleccion(Boolean seleccion) {
        this.seleccion = seleccion;
    }


}
