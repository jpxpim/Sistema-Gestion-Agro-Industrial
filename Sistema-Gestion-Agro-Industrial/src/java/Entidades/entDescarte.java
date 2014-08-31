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
public class entDescarte {
    private int id_descarte;
    private int id_dia_recepcion;
    private entJaba objJaba; 
    private entParihuela objParihuela;
    private entLote objLote;
    private double num_jabas;
    private double peso_bruto;
    private boolean is_campo;
    private boolean is_racimo;
    private Date fecha_registro;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public entDescarte() {
    }

    public int getId_descarte() {
        return id_descarte;
    }

    public void setId_descarte(int id_descarte) {
        this.id_descarte = id_descarte;
    }

    public entJaba getObjJaba() {
        return objJaba;
    }

    public void setObjJaba(entJaba objJaba) {
        this.objJaba = objJaba;
    }

    public entParihuela getObjParihuela() {
        return objParihuela;
    }

    public void setObjParihuela(entParihuela objParihuela) {
        this.objParihuela = objParihuela;
    }

    public double getNum_jabas() {
        return num_jabas;
    }

    public void setNum_jabas(double num_jabas) {
        this.num_jabas = num_jabas;
    }

    public double getPeso_bruto() {
        return peso_bruto;
    }

    public void setPeso_bruto(double peso_bruto) {
        this.peso_bruto = peso_bruto;
    }

    public entLote getObjLote() {
        return objLote;
    }

    public void setObjLote(entLote objLote) {
        this.objLote = objLote;
    }

    public boolean getIs_campo() {
        return is_campo;
    }

    public void setIs_campo(boolean is_campo) {
        this.is_campo = is_campo;
    }
    
    
   

    public boolean getIs_racimo() {
        return is_racimo;
    }

    public int getId_dia_recepcion() {
        return id_dia_recepcion;
    }

    public void setId_dia_recepcion(int id_dia_recepcion) {
        this.id_dia_recepcion = id_dia_recepcion;
    }

    public void setIs_racimo(boolean is_racimo) {
        this.is_racimo = is_racimo;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
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
