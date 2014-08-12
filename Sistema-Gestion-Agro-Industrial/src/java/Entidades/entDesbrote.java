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
public class entDesbrote 
{
    private int id_desbrote;
    private entCampaniaLote objCampaniaLote;
    private entEvaluador objEvaluador;
    private int num_hilera;
    private int num_planta;
    private int num_salida_planta;
    private int num_cargador_planta;
    private Boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private List<entDetalleDesbrote> list;

    public int getId_desbrote() {
        return id_desbrote;
    }

    public void setId_desbrote(int id_desbrote) {
        this.id_desbrote = id_desbrote;
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

    public int getNum_hilera() {
        return num_hilera;
    }

    public void setNum_hilera(int num_hilera) {
        this.num_hilera = num_hilera;
    }

    public int getNum_planta() {
        return num_planta;
    }

    public void setNum_planta(int num_planta) {
        this.num_planta = num_planta;
    }

    public int getNum_salida_planta() {
        return num_salida_planta;
    }

    public void setNum_salida_planta(int num_salida_planta) {
        this.num_salida_planta = num_salida_planta;
    }

    public int getNum_cargador_planta() {
        return num_cargador_planta;
    }

    public void setNum_cargador_planta(int num_cargador_planta) {
        this.num_cargador_planta = num_cargador_planta;
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

    public List<entDetalleDesbrote> getList() {
        return list;
    }

    public void setList(List<entDetalleDesbrote> list) {
        this.list = list;
    }
    
    
}
