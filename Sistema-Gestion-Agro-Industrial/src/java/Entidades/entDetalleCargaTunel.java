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
public class entDetalleCargaTunel 
{
    private int id_det_carga_tunel;
    private int id_carga_tunel;
    private entPaleta objPaleta;
    private Double t_entrada;
    private Double t_salida;
    private int pos_x;
    private int pos_y;
    private int pos_h;
    private entCliente objCliente;
    private boolean eliminado;

    public entCliente getObjCliente() {
        return objCliente;
    }

    public void setObjCliente(entCliente objCliente) {
        this.objCliente = objCliente;
    }
    
    
    public entDetalleCargaTunel(){
        this.eliminado=false;
    }

    public int getId_det_carga_tunel() {
        return id_det_carga_tunel;
    }

    public void setId_det_carga_tunel(int id_det_carga_tunel) {
        this.id_det_carga_tunel = id_det_carga_tunel;
    }

    public int getId_carga_tunel() {
        return id_carga_tunel;
    }

    public void setId_carga_tunel(int id_carga_tunel) {
        this.id_carga_tunel = id_carga_tunel;
    }

    public entPaleta getObjPaleta() {
        return objPaleta;
    }

    public void setObjPaleta(entPaleta objPaleta) {
        this.objPaleta = objPaleta;
    }

    public Double getT_entrada() {
        return t_entrada;
    }

    public void setT_entrada(Double t_entrada) {
        this.t_entrada = t_entrada;
    }

    public Double getT_salida() {
        return t_salida;
    }

    public void setT_salida(Double t_salida) {
        this.t_salida = t_salida;
    }

    public int getPos_x() {
        return pos_x;
    }

    public void setPos_x(int pos_x) {
        this.pos_x = pos_x;
    }

    public int getPos_y() {
        return pos_y;
    }

    public void setPos_y(int pos_y) {
        this.pos_y = pos_y;
    }

    public int getPos_h() {
        return pos_h;
    }

    public void setPos_h(int pos_h) {
        this.pos_h = pos_h;
    }

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }
    
    
}
