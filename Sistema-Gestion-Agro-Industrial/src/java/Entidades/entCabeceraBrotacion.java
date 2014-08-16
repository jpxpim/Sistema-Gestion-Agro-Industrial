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
public class entCabeceraBrotacion 
{    
    private int id_cabecera_brotacion;
    private int id_brotacion;
    private int num_hilera;
    private int num_planta;
    private int num_salida_planta;
    private int num_cargador_planta;
    private List<entDetalleBrotacion> list;

    public entCabeceraBrotacion() {
        this.list = null;
    }
    
    

    public int getId_brotacion() {
        return id_brotacion;
    }

    public void setId_brotacion(int id_brotacion) {
        this.id_brotacion = id_brotacion;
    }

    public int getId_cabecera_brotacion() {
        return id_cabecera_brotacion;
    }

    public void setId_cabecera_brotacion(int id_cabecera_brotacion) {
        this.id_cabecera_brotacion = id_cabecera_brotacion;
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

    public List<entDetalleBrotacion> getList() {
        return list;
    }

    public void setList(List<entDetalleBrotacion> list) {
        this.list = list;
    }


    
}
