/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.Date;
import java.util.List;

/**
 *
 * @author rosemary
 */
public class entRecepcion {
    
    private int id_recepcion;
    private entDireccionLlegada objDireccionLlegada;
    private entChofer objChofer;
    private String num_guia;
    private String placa;
    private String modelo;
    private Date fecha_recepcion;
    private String precinto;
    private int estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private List<entDetalleRecepcion> lista;
    
    public entRecepcion (){}

    public Date getFecha_recepcion() {
        return fecha_recepcion;
    }

    public void setFecha_recepcion(Date fecha_recepcion) {
        this.fecha_recepcion = fecha_recepcion;
    }
    
    public String getPrecinto() {
        return precinto;
    }

    public void setPrecinto(String precinto) {
        this.precinto = precinto;
    }

    
    
    public int getId_recepcion() {
        return id_recepcion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
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

    
    
    public void setId_recepcion(int id_recepcion) {
        this.id_recepcion = id_recepcion;
    }

    public entDireccionLlegada getObjDireccionLlegada() {
        return objDireccionLlegada;
    }

    public void setObjDireccionLlegada(entDireccionLlegada objDireccionLlegada) {
        this.objDireccionLlegada = objDireccionLlegada;
    }

    public entChofer getObjChofer() {
        return objChofer;
    }

    public void setObjChofer(entChofer objChofer) {
        this.objChofer = objChofer;
    }

    public String getNum_guia() {
        return num_guia;
    }

    public void setNum_guia(String num_guia) {
        this.num_guia = num_guia;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public List<entDetalleRecepcion> getLista() {
        return lista;
    }

    public void setLista(List<entDetalleRecepcion> lista) {
        this.lista = lista;
    }
    
    
}
