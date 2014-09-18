/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidades;

import java.util.Date;

/**
 *
 * @author rosemary
 */
public class entOperadorLogistico {
    
    private int id_operador_logistico;
    private String nombre;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private Boolean estado;

    public entOperadorLogistico(){}

    public entOperadorLogistico(int id_operador_logistico) {
        this.id_operador_logistico = id_operador_logistico;
    }
    
    public int getId_operador_logistico() {
        return id_operador_logistico;
    }

    public void setId_operador_logistico(int id_operador_logistico) {
        this.id_operador_logistico = id_operador_logistico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public void setFecha_modificacion(Date Fecha_Modificacion) {
        this.fecha_modificacion = Fecha_Modificacion;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
    
    
}
