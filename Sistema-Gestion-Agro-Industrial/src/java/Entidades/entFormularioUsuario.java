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
public class entFormularioUsuario 
{
    private int id_formulario_usuario;
    private entUsuario objUSuario;
    private entFormulario objFormulario;
    private String usuario_responsable;
    private Date fecha_modificacion;

    public entFormularioUsuario()
    {
        
    }

    public int getId_formulario_usuario() {
        return id_formulario_usuario;
    }

    public void setId_formulario_usuario(int id_formulario_usuario) {
        this.id_formulario_usuario = id_formulario_usuario;
    }

    public entUsuario getObjUSuario() {
        return objUSuario;
    }

    public void setObjUSuario(entUsuario objUSuario) {
        this.objUSuario = objUSuario;
    }

    public entFormulario getObjFormulario() {
        return objFormulario;
    }

    public void setObjFormulario(entFormulario objFormulario) {
        this.objFormulario = objFormulario;
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
    
    
}
