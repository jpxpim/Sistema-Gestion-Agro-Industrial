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
public class entModulo {
    
    private int id_modulo;
    private String etiqueta;
    private int estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private List<entFormulario> list;
    
    public entModulo()
    {
        
    }

    public int getId_modulo() {
        return id_modulo;
    }

    public void setId_modulo(int id_modulo) {
        this.id_modulo = id_modulo;
    }

  
    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
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

    public List<entFormulario> getList() {
        return list;
    }

    public void setList(List<entFormulario> list) {
        this.list = list;
    }
    
}
