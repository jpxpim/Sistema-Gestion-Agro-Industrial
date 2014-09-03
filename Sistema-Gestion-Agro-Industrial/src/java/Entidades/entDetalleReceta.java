/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

/**
 *
 * @author EdHam
 */
public class entDetalleReceta {
    private int id_det_receta;
    private int id_receta;
    private entInsumo objInsumo;
    private double cantidad;
     private boolean seleccionado_session;
     private boolean agregado_session;
     private boolean eliminado_session;

    public entDetalleReceta() {
        this.id_det_receta=0;
        this.seleccionado_session=false;
        this.agregado_session=false;
        this.eliminado_session=false;
    }

    public int getId_det_receta() {
        return id_det_receta;
    }

    public void setId_det_receta(int id_det_receta) {
        this.id_det_receta = id_det_receta;
    }

    public int getId_receta() {
        return id_receta;
    }

    public void setId_receta(int id_receta) {
        this.id_receta = id_receta;
    }

    public entInsumo getObjInsumo() {
        return objInsumo;
    }

    public void setObjInsumo(entInsumo objInsumo) {
        this.objInsumo = objInsumo;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
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
