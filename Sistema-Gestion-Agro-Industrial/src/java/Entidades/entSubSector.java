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
public class entSubSector {
    private int id_sub_sector;
    private entSector objSector;
    private String nombre;
    private String descripcion;
    private boolean estado;
    private String usuario_responsable;
    private Date fecha_modificacion;
    private String grower_senasa;
    
    public entSubSector()
    {
        
    }

    public String getGrower_senasa() {
        return grower_senasa;
    }

    public void setGrower_senasa(String grower_senasa) {
        this.grower_senasa = grower_senasa;
    }
    public int getId_sub_sector() {
        return id_sub_sector;
    }

    public void setId_sub_sector(int id_sub_sector) {
        this.id_sub_sector = id_sub_sector;
    }

    public entSector getObjSector() {
        return objSector;
    }

    public void setObjSector(entSector objSector) {
        this.objSector = objSector;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean getEstado() {
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

  
}
