
package Entidades;


public class entProvincia {
    private int id_provincia;
    private String nombre;
    private entDepartamento objDepartamento;

    public entProvincia() {
    }

    public int getId_provincia() {
        return id_provincia;
    }

    public void setId_provincia(int id_provincia) {
        this.id_provincia = id_provincia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

  
    public entDepartamento getObjDepartamento() {
        return objDepartamento;
    }

    public void setObjDepartamento(entDepartamento objDepartamento) {
        this.objDepartamento = objDepartamento;
    }

    
}
