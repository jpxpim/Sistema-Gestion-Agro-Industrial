/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.Date;

/**
 *
 * @author EdHam
 */
public class entInsumo {
    private int id_insumo;
    private String cod_erp;
    private String nombre;
     private Date fecha_modificacion;
    public boolean seleccionado_session;
     public boolean agregado_session;
     public boolean eliminado_session;
     
    public entInsumo() {
        this.seleccionado_session=false;
        this.agregado_session=false;
        this.eliminado_session=false;
    }

    public int getId_insumo() {
        return id_insumo;
    }

    public void setId_insumo(int id_insumo) {
        this.id_insumo = id_insumo;
    }

    public String getCod_erp() {
        return cod_erp;
    }

    public void setCod_erp(String cod_erp) {
        this.cod_erp = cod_erp;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }

    public boolean isSeleccionado_session() {
        return seleccionado_session;
    }

    public void setSeleccionado_session(boolean seleccionado_session) {
        this.seleccionado_session = seleccionado_session;
    }

    public boolean isAgregado_session() {
        return agregado_session;
    }

    public void setAgregado_session(boolean agregado_session) {
        this.agregado_session = agregado_session;
    }

    public boolean isEliminado_session() {
        return eliminado_session;
    }

    public void setEliminado_session(boolean eliminado_session) {
        this.eliminado_session = eliminado_session;
    }

   
}
