/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

/**
 *
 * @author EdHam
 */
public class entDetalleEmbarque {
    private int id_det_embarque;
    private int id_embarque;
    private entPaleta objPaleta;
    private int pos_x;
    private int pos_y;
    private int sensor;
    private String thermoregistro;
    

    public entDetalleEmbarque() {
        this.thermoregistro="";
        this.sensor=0;
    }

    public int getId_det_embarque() {
        return id_det_embarque;
    }

    public void setId_det_embarque(int id_det_embarque) {
        this.id_det_embarque = id_det_embarque;
    }

    public int getId_embarque() {
        return id_embarque;
    }

    public void setId_embarque(int id_embarque) {
        this.id_embarque = id_embarque;
    }

    public entPaleta getObjPaleta() {
        return objPaleta;
    }

    public void setObjPaleta(entPaleta objPaleta) {
        this.objPaleta = objPaleta;
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

    public int getSensor() {
        return sensor;
    }

    public void setSensor(int sensor) {
        this.sensor = sensor;
    }

    public String getThermoregistro() {
        return thermoregistro;
    }

    public void setThermoregistro(String thermoregistro) {
        this.thermoregistro = thermoregistro;
    }
    
}
