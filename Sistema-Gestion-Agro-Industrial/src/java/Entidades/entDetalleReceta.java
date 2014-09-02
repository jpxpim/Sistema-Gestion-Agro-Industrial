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

    public entDetalleReceta() {
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
    
}
