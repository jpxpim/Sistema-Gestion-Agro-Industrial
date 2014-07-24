/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCultivo;
import Entidades.entEdadCultivo;
import Entidades.entFormulario;
import Entidades.entFormularioUsuario;
import Entidades.entPatron;
import Entidades.entSector;
import Entidades.entSubSector;
import Entidades.entTipoCultivo;
import Entidades.entUsuario;
import Entidades.entVariedad;
import Entidades.entVivero;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 *
 * @author Toditos
 */
public class Probadorxxx {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        
        
        entFormularioUsuario obj = new entFormularioUsuario();
        
        entFormulario objFormulario = new entFormulario();
        objFormulario.setId_formulario(1);            
        objFormulario.setUrl("asasas");           
        objFormulario.setEtiqueta("aseeeasas");
        objFormulario.setPadre(0);
        objFormulario.setUsuario_responsable("asasas");
        objFormulario.setEstado(true);
        //Usuario
        DateFormat formato_fecha = new SimpleDateFormat("dd/MM/yyyy");
        entUsuario objUsuario = new entUsuario();
        objUsuario.setId_usuario(1);
        objUsuario.setLogin("dwwdwd");
        objUsuario.setContrasena("dwwdwd");
        objUsuario.setCodigo_erp("dwwdwd");
        objUsuario.setNombre("dwwdwd");
        objUsuario.setApellido("dwwdwd");
        objUsuario.setEmail("dwwdwd");
        objUsuario.setTelefono("dwwdwd");
        objUsuario.setCelular("dwwdwd");
        objUsuario.setFecha_nacimiento(formato_fecha.parse("01/01/1989"));
        objUsuario.setFoto("dwwdwd");
        objUsuario.setEstado(true);
        objUsuario.setUsuario_responsable("dwwdwd");
        
        
        obj.setId_formulario_usuario(1);
        obj.setObjFormulario(objFormulario);
        obj.setObjUSuario(objUsuario);
        obj.setUsuario_responsable("dwdwd");
        System.out.print(""+FormularioUsuarioDAO.insertar(obj));
        //List<entFormularioUsuario> list=FormularioUsuarioDAO.Listar();
        
        /*
        entFormulario objCultiv = new entFormulario();
        objCultiv.setId_formulario(1);            
        objCultiv.setUrl("asasas");           
        objCultiv.setEtiqueta("aseeeasas");
        objCultiv.setPadre(0);
        objCultiv.setUsuario_responsable("asasas");
        objCultiv.setEstado(true);
        List<entFormulario> list=FormularioDAO.Listar(true,true);
        List<entFormulario> lista=FormularioDAO.BuscarPorId(1);*/
        //System.out.print(""+FormularioDAO.insertar(objCultiv));        
        //System.out.print(""+FormularioDAO.actualizar(objCultiv));     
        /*Usuario
        DateFormat formato_fecha = new SimpleDateFormat("dd/MM/yyyy");
        entUsuario objUsuario = new entUsuario();
        objUsuario.setLogin("dwwdwd");
        objUsuario.setContrasena("dwwdwd");
        objUsuario.setCodigo_erp("dwwdwd");
        objUsuario.setNombre("dwwdwd");
        objUsuario.setApellido("dwwdwd");
        objUsuario.setEmail("dwwdwd");
        objUsuario.setTelefono("dwwdwd");
        objUsuario.setCelular("dwwdwd");
        objUsuario.setFecha_nacimiento(formato_fecha.parse("01/01/1989"));
        objUsuario.setFoto("dwwdwd");
        objUsuario.setEstado(true);
        objUsuario.setUsuario_responsable("dwwdwd");

        */

        /*
        entCultivo objCultiv = new entCultivo();
        objCultiv.setId_cultivo(6);            
        objCultiv.setNombre("asasas");           
        objCultiv.setDescripcion("aseeeasas");
        objCultiv.setUsuario_responsable("asasas");
        objCultiv.setEstado(true);
        List<entCultivo> list=CultivoDAO.Listar(true);
        System.out.print(""+CultivoDAO.insertar(objCultiv));        
        System.out.print(""+CultivoDAO.actualizar(objCultiv));        
        */      
        
        
        /*
        entVivero objVivero = new entVivero();
        entCultivo objCultiv = new entCultivo();
            objCultiv.setId_cultivo(2);
            objCultiv.setNombre("asasas");
            objCultiv.setDescripcion("asasas");
            objCultiv.setUsuario_responsable("asasas");
            objCultiv.setEstado(true);
        objVariedad.setObjCultivo(objCultiv);
            objVivero.setNombre("asasas");
            objVivero.setDescripcion("asasas");
        objCultivo.setGrower_senasa("asasas");
            objVivero.setUsuario_responsable("asasas");
            objVivero.setEstado(true);
            

            */
      
        //if(list!=null)
        
    }
    
}
