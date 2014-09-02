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
public class entEnvase {
    private int id_envase;
    private entReceta objReceta;
    private String codigo_control;
    private String nombre;
    private double peso;
    private double peso_carga;
    private int cant_cajas_paleta;
    private boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public entEnvase() {
    }

    public int getCant_cajas_paleta() {
        return cant_cajas_paleta;
    }

    public void setCant_cajas_paleta(int cant_cajas_paleta) {
        this.cant_cajas_paleta = cant_cajas_paleta;
    }

    public entEnvase(int id_envase) {
        this.id_envase = id_envase;
    }

    public int getId_envase() {
        return id_envase;
    }

    public void setId_envase(int id_envase) {
        this.id_envase = id_envase;
    }

    public entReceta getObjReceta() {
        return objReceta;
    }

    public void setObjReceta(entReceta objReceta) {
        this.objReceta = objReceta;
    }

    public String getCodigo_control() {
        return codigo_control;
    }

    public void setCodigo_control(String codigo_control) {
        this.codigo_control = codigo_control;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getPeso_carga() {
        return peso_carga;
    }

    public void setPeso_carga(double peso_carga) {
        this.peso_carga = peso_carga;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
