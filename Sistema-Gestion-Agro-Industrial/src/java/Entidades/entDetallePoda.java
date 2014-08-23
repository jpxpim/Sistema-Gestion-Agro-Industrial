/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

/**
 *
 * @author rosemary
 */
public class entDetallePoda {
    private int id_det_poda;
    private int id_cabecera_poda;
    private int posicion;
    private int cantidad;
    
    public entDetallePoda(){}

    public int getId_det_pre_poda() {
        return id_det_poda;
    }

    public int getId_det_poda() {
        return id_det_poda;
    }

    public void setId_det_poda(int id_det_poda) {
        this.id_det_poda = id_det_poda;
    }

    public int getId_cabecera_poda() {
        return id_cabecera_poda;
    }

    public void setId_cabecera_poda(int id_cabecera_poda) {
        this.id_cabecera_poda = id_cabecera_poda;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

   
}
