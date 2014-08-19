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
public class entCabeceraDesbrote 
{    
    private int id_cabecera_desbrote;
    private int id_desbrote;
    private int posicion;
    private int num_hilera;
    private int num_planta;
    private int num_salida_planta;
    private int num_cargador_planta;
    private List<entDetalleDesbrote> list;
    private Boolean seleccion; 
    public entCabeceraDesbrote() {
        this.list = null;
        this.seleccion=false;
    }

    public int getId_cabecera_desbrote() {
        return id_cabecera_desbrote;
    }

    public void setId_cabecera_desbrote(int id_cabecera_desbrote) {
        this.id_cabecera_desbrote = id_cabecera_desbrote;
    }

    public int getId_desbrote() {
        return id_desbrote;
    }

    public void setId_desbrote(int id_desbrote) {
        this.id_desbrote = id_desbrote;
    }

    public List<entDetalleDesbrote> getList() {
        return list;
    }

    public void setList(List<entDetalleDesbrote> list) {
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

    public int getNum_cargador_planta() {
        return num_cargador_planta;
    }

    public void setNum_cargador_planta(int num_cargador_planta) {
        this.num_cargador_planta = num_cargador_planta;
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
