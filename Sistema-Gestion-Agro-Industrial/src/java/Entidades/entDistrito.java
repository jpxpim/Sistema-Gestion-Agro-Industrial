
package Entidades;

public class entDistrito {
    private int id_istrito;
    private String nombre;
    private entProvincia objProvincia;

    public entDistrito() {
    }

    public entDistrito(int id_istrito) {
        this.id_istrito = id_istrito;
    }

    public int getId_istrito() {
        return id_istrito;
    }

    public void setId_istrito(int id_istrito) {
        this.id_istrito = id_istrito;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    

    public entProvincia getObjProvincia() {
        return objProvincia;
    }

    public void setObjProvincia(entProvincia objProvincia) {
        this.objProvincia = objProvincia;
    }

  
}
