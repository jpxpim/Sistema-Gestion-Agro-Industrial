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
public class entCampaniaLote 
{
    private int id_campania_lote;
    private entLote objLote;
    private entCampania objCampania;
    private Date fechaPodaFormacion;
    private int numero_plantas;
    private String usuario_responsable;
    private Date fecha_modificacion;
    
    public entCampaniaLote(){}

    public entCampaniaLote(int id_campania_lote) {
        this.id_campania_lote = id_campania_lote;
    }

    public int getId_campania_lote() {
        return id_campania_lote;
    }

    public void setId_campania_lote(int id_campania_lote) {
        this.id_campania_lote = id_campania_lote;
    }

    public entLote getObjLote() {
        return objLote;
    }

    public void setObjLote(entLote objLote) {
        this.objLote = objLote;
    }

    public entCampania getObjCampania() {
        return objCampania;
    }

    public void setObjCampania(entCampania objCampania) {
        this.objCampania = objCampania;
    }

    public Date getFechaPodaFormacion() {
        return fechaPodaFormacion;
    }

    public void setFechaPodaFormacion(Date fechaPodaFormacion) {
        this.fechaPodaFormacion = fechaPodaFormacion;
    }

    public int getNumero_plantas() {
        return numero_plantas;
    }

    public void setNumero_plantas(int numero_plantas) {
        this.numero_plantas = numero_plantas;
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
