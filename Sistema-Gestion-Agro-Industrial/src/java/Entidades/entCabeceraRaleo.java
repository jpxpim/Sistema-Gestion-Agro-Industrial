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
public class entCabeceraRaleo 
{    
    private int id_cabecera_raleo;
    private int id_raleo;
    private int posicion;
    private int num_hilera;
    private int num_planta;
    private int num_racimo_planta;
    
    private int num_baya_1;
    private int num_baya_2;
    private int num_baya_3;
    
    private int tipo_racimo_1;
    private int tipo_racimo_2;
    private int tipo_racimo_3;
    
    private int calidad_racimo_1;
    private int calidad_racimo_2;
    private int calidad_racimo_3;
    
    private int largo_racimo_1;
    private int largo_racimo_2;
    private int largo_racimo_3;
    
    private String observaciones_1;
    private String observaciones_2;
    private String observaciones_3;
    
    private Boolean seleccion; 
    public entCabeceraRaleo() {
        this.seleccion=false;
        this.observaciones_1="";
        this.observaciones_2="";
        this.observaciones_3="";
    }

    public int getId_cabecera_raleo() {
        return id_cabecera_raleo;
    }

    public void setId_cabecera_raleo(int id_cabecera_raleo) {
        this.id_cabecera_raleo = id_cabecera_raleo;
    }

    public int getId_raleo() {
        return id_raleo;
    }

    public void setId_raleo(int id_raleo) {
        this.id_raleo = id_raleo;
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

    public int getNum_racimo_planta() {
        return num_racimo_planta;
    }

    public void setNum_racimo_planta(int num_racimo_planta) {
        this.num_racimo_planta = num_racimo_planta;
    }

    public int getNum_baya_1() {
        return num_baya_1;
    }

    public void setNum_baya_1(int num_baya_1) {
        this.num_baya_1 = num_baya_1;
    }

    public int getNum_baya_2() {
        return num_baya_2;
    }

    public void setNum_baya_2(int num_baya_2) {
        this.num_baya_2 = num_baya_2;
    }

    public int getNum_baya_3() {
        return num_baya_3;
    }

    public void setNum_baya_3(int num_baya_3) {
        this.num_baya_3 = num_baya_3;
    }

    public int getTipo_racimo_1() {
        return tipo_racimo_1;
    }

    public void setTipo_racimo_1(int tipo_racimo_1) {
        this.tipo_racimo_1 = tipo_racimo_1;
    }

    public int getTipo_racimo_2() {
        return tipo_racimo_2;
    }

    public void setTipo_racimo_2(int tipo_racimo_2) {
        this.tipo_racimo_2 = tipo_racimo_2;
    }

    public int getTipo_racimo_3() {
        return tipo_racimo_3;
    }

    public void setTipo_racimo_3(int tipo_racimo_3) {
        this.tipo_racimo_3 = tipo_racimo_3;
    }

    public int getCalidad_racimo_1() {
        return calidad_racimo_1;
    }

    public void setCalidad_racimo_1(int calidad_racimo_1) {
        this.calidad_racimo_1 = calidad_racimo_1;
    }

    public int getCalidad_racimo_2() {
        return calidad_racimo_2;
    }

    public void setCalidad_racimo_2(int calidad_racimo_2) {
        this.calidad_racimo_2 = calidad_racimo_2;
    }

    public int getCalidad_racimo_3() {
        return calidad_racimo_3;
    }

    public void setCalidad_racimo_3(int calidad_racimo_3) {
        this.calidad_racimo_3 = calidad_racimo_3;
    }

    public int getLargo_racimo_1() {
        return largo_racimo_1;
    }

    public void setLargo_racimo_1(int largo_racimo_1) {
        this.largo_racimo_1 = largo_racimo_1;
    }

    public int getLargo_racimo_2() {
        return largo_racimo_2;
    }

    public void setLargo_racimo_2(int largo_racimo_2) {
        this.largo_racimo_2 = largo_racimo_2;
    }

    public int getLargo_racimo_3() {
        return largo_racimo_3;
    }

    public void setLargo_racimo_3(int largo_racimo_3) {
        this.largo_racimo_3 = largo_racimo_3;
    }

    public String getObservaciones_1() {
        return observaciones_1;
    }

    public void setObservaciones_1(String observaciones_1) {
        this.observaciones_1 = observaciones_1;
    }

    public String getObservaciones_2() {
        return observaciones_2;
    }

    public void setObservaciones_2(String observaciones_2) {
        this.observaciones_2 = observaciones_2;
    }

    public String getObservaciones_3() {
        return observaciones_3;
    }

    public void setObservaciones_3(String observaciones_3) {
        this.observaciones_3 = observaciones_3;
    }

  

}
