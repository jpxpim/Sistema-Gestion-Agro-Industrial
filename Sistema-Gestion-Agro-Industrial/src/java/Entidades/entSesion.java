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
    private entUsuario objUsuario;
    
    List<entModulo> listModulos;
    
    public entSesion() {
        this.posicion=0;
        listModulos=null;
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

   
    
}
