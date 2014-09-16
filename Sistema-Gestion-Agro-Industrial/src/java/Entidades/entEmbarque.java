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
 * @author EdHam
 */
public class entEmbarque {
private int id_embarque;
private entCliente objClienteFacturable;
private entCliente objClienteExportador;
private entCliente objClienteConsignatario;
private entOperadorLogistico objOperadorLogistico;
private entViaEmbarque objViaEmbarque;
private entLineaNaviera objLineaNaviera;
private entContenedor objContenedor;
private entPuerto objPuertoEmabarque;
private entPuerto objPuertoDestino;
private entChofer objChofer;
private entDistrito objDistrito;
private String prec_op_logistico;
private String prec_senasa;
private String prec_aduanas;
private String prec_linea_nav;
private String vapor;
private String container;
private String placa_container;
private String placa_carreta;
private Date fecha_traslado;
private Date fecha_partida;
private Date fecha_arribo;
private boolean cold_treat;
private String packing_list;
private double t_set_point;
private double t_despacho;
private double ventilacion;
private double humedad;
private double cant_filtros;
private String booking;
private Date hora_inicio;
private Date hora_fin;
private String usuario_responsable;
private Date fecha_modificacion;
private List<entDetalleEmbarque> list;

    public entEmbarque() {
    }

    public int getId_embarque() {
        return id_embarque;
    }

    public void setId_embarque(int id_embarque) {
        this.id_embarque = id_embarque;
    }

    public entCliente getObjClienteFacturable() {
        return objClienteFacturable;
    }

    public void setObjClienteFacturable(entCliente objClienteFacturable) {
        this.objClienteFacturable = objClienteFacturable;
    }

    public entCliente getObjClienteExportador() {
        return objClienteExportador;
    }

    public void setObjClienteExportador(entCliente objClienteExportador) {
        this.objClienteExportador = objClienteExportador;
    }

    public entCliente getObjClienteConsignatario() {
        return objClienteConsignatario;
    }

    public void setObjClienteConsignatario(entCliente objClienteConsignatario) {
        this.objClienteConsignatario = objClienteConsignatario;
    }

    public entOperadorLogistico getObjOperadorLogistico() {
        return objOperadorLogistico;
    }

    public void setObjOperadorLogistico(entOperadorLogistico objOperadorLogistico) {
        this.objOperadorLogistico = objOperadorLogistico;
    }

    public entViaEmbarque getObjViaEmbarque() {
        return objViaEmbarque;
    }

    public void setObjViaEmbarque(entViaEmbarque objViaEmbarque) {
        this.objViaEmbarque = objViaEmbarque;
    }

    public entLineaNaviera getObjLineaNaviera() {
        return objLineaNaviera;
    }

    public void setObjLineaNaviera(entLineaNaviera objLineaNaviera) {
        this.objLineaNaviera = objLineaNaviera;
    }

    public entContenedor getObjContenedor() {
        return objContenedor;
    }

    public void setObjContenedor(entContenedor objContenedor) {
        this.objContenedor = objContenedor;
    }

    public entPuerto getObjPuertoEmabarque() {
        return objPuertoEmabarque;
    }

    public void setObjPuertoEmabarque(entPuerto objPuertoEmabarque) {
        this.objPuertoEmabarque = objPuertoEmabarque;
    }

    public entPuerto getObjPuertoDestino() {
        return objPuertoDestino;
    }

    public void setObjPuertoDestino(entPuerto objPuertoDestino) {
        this.objPuertoDestino = objPuertoDestino;
    }

    public entChofer getObjChofer() {
        return objChofer;
    }

    public void setObjChofer(entChofer objChofer) {
        this.objChofer = objChofer;
    }

    public String getPrec_op_logistico() {
        return prec_op_logistico;
    }

    public void setPrec_op_logistico(String prec_op_logistico) {
        this.prec_op_logistico = prec_op_logistico;
    }

    public String getPrec_senasa() {
        return prec_senasa;
    }

    public void setPrec_senasa(String prec_senasa) {
        this.prec_senasa = prec_senasa;
    }

    public String getPrec_aduanas() {
        return prec_aduanas;
    }

    public void setPrec_aduanas(String prec_aduanas) {
        this.prec_aduanas = prec_aduanas;
    }

    public String getPrec_linea_nav() {
        return prec_linea_nav;
    }

    public void setPrec_linea_nav(String prec_linea_nav) {
        this.prec_linea_nav = prec_linea_nav;
    }

    public String getVapor() {
        return vapor;
    }

    public void setVapor(String vapor) {
        this.vapor = vapor;
    }

    public String getContainer() {
        return container;
    }

    public void setContainer(String container) {
        this.container = container;
    }

    public String getPlaca_container() {
        return placa_container;
    }

    public void setPlaca_container(String placa_container) {
        this.placa_container = placa_container;
    }

    public String getPlaca_carreta() {
        return placa_carreta;
    }

    public void setPlaca_carreta(String placa_carreta) {
        this.placa_carreta = placa_carreta;
    }

    public Date getFecha_traslado() {
        return fecha_traslado;
    }

    public void setFecha_traslado(Date fecha_traslado) {
        this.fecha_traslado = fecha_traslado;
    }

    public Date getFecha_partida() {
        return fecha_partida;
    }

    public void setFecha_partida(Date fecha_partida) {
        this.fecha_partida = fecha_partida;
    }

    public Date getFecha_arribo() {
        return fecha_arribo;
    }

    public void setFecha_arribo(Date fecha_arribo) {
        this.fecha_arribo = fecha_arribo;
    }

    public boolean isCold_treat() {
        return cold_treat;
    }

    public void setCold_treat(boolean cold_treat) {
        this.cold_treat = cold_treat;
    }

    public String getPacking_list() {
        return packing_list;
    }

    public void setPacking_list(String packing_list) {
        this.packing_list = packing_list;
    }

    public double getT_set_point() {
        return t_set_point;
    }

    public void setT_set_point(double t_set_point) {
        this.t_set_point = t_set_point;
    }

    public double getT_despacho() {
        return t_despacho;
    }

    public void setT_despacho(double t_despacho) {
        this.t_despacho = t_despacho;
    }

    public double getVentilacion() {
        return ventilacion;
    }

    public void setVentilacion(double ventilacion) {
        this.ventilacion = ventilacion;
    }

    public double getHumedad() {
        return humedad;
    }

    public void setHumedad(double humedad) {
        this.humedad = humedad;
    }

    public double getCant_filtros() {
        return cant_filtros;
    }

    public void setCant_filtros(double cant_filtros) {
        this.cant_filtros = cant_filtros;
    }

    public String getBooking() {
        return booking;
    }

    public void setBooking(String booking) {
        this.booking = booking;
    }

    public Date getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(Date hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public Date getHora_fin() {
        return hora_fin;
    }

    public void setHora_fin(Date hora_fin) {
        this.hora_fin = hora_fin;
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

    public List<entDetalleEmbarque> getList() {
        return list;
    }

    public void setList(List<entDetalleEmbarque> list) {
        this.list = list;
    }

    public entDistrito getObjDistrito() {
        return objDistrito;
    }

    public void setObjDistrito(entDistrito objDistrito) {
        this.objDistrito = objDistrito;
    }


}
