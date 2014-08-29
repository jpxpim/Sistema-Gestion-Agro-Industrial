/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.List;

/**
 *
 * @author Toditos
 */
public class entSesion {

    private int posicion;
    private entDiaRecepcion objDiaRecepcion;  
    private boolean dia_recepcion;
    private entUsuario objUsuario;
    private entBrotacion objBrotacion;
    private entDesbrote objDesbrote;
    private entPrePoda objPrePoda;
    private entPoda objPoda;
    private entRaleo objRaleo;
    private entRecepcion objRecepcion;
    List<entModulo> listModulos;
    
    public entSesion() {
        this.posicion=0;
        this.dia_recepcion=false;
        this.objDiaRecepcion=null;
        listModulos=null;
        objRecepcion=null;
    }

    public boolean isDia_recepcion() {
        return dia_recepcion;
    }

    public void setDia_recepcion(boolean dia_recepcion) {
        this.dia_recepcion = dia_recepcion;
    }

    
    public entUsuario getObjUsuario() {
        return objUsuario;
    }

    public void setObjUsuario(entUsuario objUsuario) {
        this.objUsuario = objUsuario;
    }

    public List<entModulo> getListModulos() {
        return listModulos;
    }

    public void setListModulos(List<entModulo> listModulos) {
        this.listModulos = listModulos;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public entBrotacion getObjBrotacion() {
        return objBrotacion;
    }

    public void setObjBrotacion(entBrotacion objBrotacion) {
        this.objBrotacion = objBrotacion;
    }



    public entDesbrote getObjDesbrote() {
        return objDesbrote;
    }

    public void setObjDesbrote(entDesbrote objDesbrote) {
        this.objDesbrote = objDesbrote;
    }

    public entPrePoda getObjPrePoda() {
        return objPrePoda;
    }

    public void setObjPrePoda(entPrePoda objPrePoda) {
        this.objPrePoda = objPrePoda;
    }

    public entPoda getObjPoda() {
        return objPoda;
    }

    public void setObjPoda(entPoda objPoda) {
        this.objPoda = objPoda;
    }

    public entRaleo getObjRaleo() {
        return objRaleo;
    }

    public void setObjRaleo(entRaleo objRaleo) {
        this.objRaleo = objRaleo;
    }

    public entRecepcion getObjRecepcion() {
        return objRecepcion;
    }

    public void setObjRecepcion(entRecepcion objRecepcion) {
        this.objRecepcion = objRecepcion;
    }

    public entDiaRecepcion getObjDiaRecepcion() {
        return objDiaRecepcion;
    }

    public void setObjDiaRecepcion(entDiaRecepcion objDiaRecepcion) {
        this.objDiaRecepcion = objDiaRecepcion;
    }

}
