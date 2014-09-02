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
public class entProductoTerminadoTemp {
    private int id_producto_terminado;
    private String codigo_control;
    private String embalador;
    private String seleccionador;
    private Date fecha_produccion;
    private String codigo_control_lote;
    private String nombre_linea_produccion;
    private String nombre_envase;
    private String nombre_calibre;
    private String codigo_control_paleta;
    private Date fecha_produccion_paleta;
    private boolean control;

    public entProductoTerminadoTemp() {
        this.control=true;
    }

    public int getId_producto_terminado() {
        return id_producto_terminado;
    }

    public void setId_producto_terminado(int id_producto_terminado) {
        this.id_producto_terminado = id_producto_terminado;
    }

    public String getCodigo_control() {
        return codigo_control;
    }

    public void setCodigo_control(String codigo_control) {
        this.codigo_control = codigo_control;
    }

    public String getEmbalador() {
        return embalador;
    }

    public void setEmbalador(String embalador) {
        this.embalador = embalador;
    }

    public String getSeleccionador() {
        return seleccionador;
    }

    public void setSeleccionador(String seleccionador) {
        this.seleccionador = seleccionador;
    }

    public Date getFecha_produccion() {
        return fecha_produccion;
    }

    public void setFecha_produccion(Date fecha_produccion) {
        this.fecha_produccion = fecha_produccion;
    }

    public String getCodigo_control_lote() {
        return codigo_control_lote;
    }

    public void setCodigo_control_lote(String codigo_control_lote) {
        this.codigo_control_lote = codigo_control_lote;
    }

    public String getNombre_linea_produccion() {
        return nombre_linea_produccion;
    }

    public void setNombre_linea_produccion(String nombre_linea_produccion) {
        this.nombre_linea_produccion = nombre_linea_produccion;
    }

    public String getNombre_envase() {
        return nombre_envase;
    }

    public void setNombre_envase(String nombre_envase) {
        this.nombre_envase = nombre_envase;
    }

    public String getNombre_calibre() {
        return nombre_calibre;
    }

    public void setNombre_calibre(String nombre_calibre) {
        this.nombre_calibre = nombre_calibre;
    }

    public String getCodigo_control_paleta() {
        return codigo_control_paleta;
    }

    public void setCodigo_control_paleta(String codigo_control_paleta) {
        this.codigo_control_paleta = codigo_control_paleta;
    }

    public Date getFecha_produccion_paleta() {
        return fecha_produccion_paleta;
    }

    public void setFecha_produccion_paleta(Date fecha_produccion_paleta) {
        this.fecha_produccion_paleta = fecha_produccion_paleta;
    }

    public boolean isControl() {
        return control;
    }

    public void setControl(boolean control) {
        this.control = control;
    }

}
