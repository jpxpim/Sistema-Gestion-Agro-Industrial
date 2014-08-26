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
public class entDetalleRecepcion 
{
    private int id_det_recepcion;
    private int id_recepcion;
    private entLote objLote;
    private entJaba objJaba;
    private entParihuela objParihuela;
    private entCategoria objCategoria;
    private Double num_jabas;
    private Double peso_bruto;
    boolean seleccion;

    public entDetalleRecepcion() {
        this.seleccion = false;
    }
    
    public int getId_det_recepcion() {
        return id_det_recepcion;
    }

    public void setId_det_recepcion(int id_det_recepcion) {
        this.id_det_recepcion = id_det_recepcion;
    }

    public int getId_recepcion() {
        return id_recepcion;
    }

    public void setId_recepcion(int id_recepcion) {
        this.id_recepcion = id_recepcion;
    }

    

    public entLote getObjLote() {
        return objLote;
    }

    public void setObjLote(entLote objLote) {
        this.objLote = objLote;
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

    public entCategoria getObjCategoria() {
        return objCategoria;
    }

    public void setObjCategoria(entCategoria objCategoria) {
        this.objCategoria = objCategoria;
    }

    public Double getNum_jabas() {
        return num_jabas;
    }

    public void setNum_jabas(Double num_jabas) {
        this.num_jabas = num_jabas;
    }

    public Double getPeso_bruto() {
        return peso_bruto;
    }

    public void setPeso_bruto(Double peso_bruto) {
        this.peso_bruto = peso_bruto;
    }

    public boolean isSeleccion() {
        return seleccion;
    }

    public void setSeleccion(boolean seleccion) {
        this.seleccion = seleccion;
    }

}
