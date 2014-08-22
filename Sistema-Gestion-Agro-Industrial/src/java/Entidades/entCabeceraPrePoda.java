/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.List;

/**
 *
 * @author rosemary
 */
public class entCabeceraPrePoda 
{    
    private int id_cabecera_pre_poda;
    private int id_pre_poda;
    private int posicion;
    private int num_hilera;
    private int num_planta;
    private int num_salida_planta;
    private List<entDetallePrePoda> list;
    private Boolean seleccion; 
    public entCabeceraPrePoda() {
        this.list = null;
        this.seleccion=false;
    }

    public int getId_cabecera_pre_poda() {
        return id_cabecera_pre_poda;
    }

    public void setId_cabecera_pre_poda(int id_cabecera_pre_poda) {
        this.id_cabecera_pre_poda = id_cabecera_pre_poda;
    }

    public int getId_pre_poda() {
        return id_pre_poda;
    }

    public void setId_pre_poda(int id_pre_poda) {
        this.id_pre_poda = id_pre_poda;
    }

    public List<entDetallePrePoda> getList() {
        return list;
    }

    public void setList(List<entDetallePrePoda> list) {
        this.list = list;
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

    public Boolean isSeleccion() {
        return seleccion;
    }

    public void setSeleccion(Boolean seleccion) {
        this.seleccion = seleccion;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

}
