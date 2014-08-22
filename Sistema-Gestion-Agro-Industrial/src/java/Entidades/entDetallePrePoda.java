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
public class entDetallePrePoda {
    private int id_det_pre_poda;
    private int id_cabecera_pre_poda;
    private int posicion;
    private int diametro;
    private int feminela;
    
    public entDetallePrePoda(){}

    public int getId_det_pre_poda() {
        return id_det_pre_poda;
    }

    public void setId_det_pre_poda(int id_det_pre_poda) {
        this.id_det_pre_poda = id_det_pre_poda;
    }

    public int getId_cabecera_pre_poda() {
        return id_cabecera_pre_poda;
    }

    public void setId_cabecera_pre_poda(int id_cabecera_pre_poda) {
        this.id_cabecera_pre_poda = id_cabecera_pre_poda;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public int getDiametro() {
        return diametro;
    }

    public void setDiametro(int diametro) {
        this.diametro = diametro;
    }

    public int getFeminela() {
        return feminela;
    }

    public void setFeminela(int feminela) {
        this.feminela = feminela;
    }

 
}
