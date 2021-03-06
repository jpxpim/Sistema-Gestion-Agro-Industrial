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
public class entPoda 
{
    private int id_poda;
    private entCampaniaLote objCampaniaLote;
    private entEvaluador objEvaluador;
    private Date fecha_registro;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private List<entCabeceraPoda> list;
    
    public entPoda() {
        this.list = null;
    }

    public int getId_poda() {
        return id_poda;
    }

    public void setId_poda(int id_poda) {
        this.id_poda = id_poda;
    }

    public List<entCabeceraPoda> getList() {
        return list;
    }

    public void setList(List<entCabeceraPoda> list) {
        this.list = list;
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

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }


}
