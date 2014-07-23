/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCultivo;
import Entidades.entEdadCultivo;
import Entidades.entPatron;
import Entidades.entSector;
import Entidades.entSubSector;
import Entidades.entTipoCultivo;
import Entidades.entVariedad;
import Entidades.entVivero;
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
        
        entVivero objVivero = new entVivero();
        /*entCultivo objCultiv = new entCultivo();
            objCultiv.setId_cultivo(2);
            objCultiv.setNombre("asasas");
            objCultiv.setDescripcion("asasas");
            objCultiv.setUsuario_responsable("asasas");
            objCultiv.setEstado(true);*/
        //objVariedad.setObjCultivo(objCultiv);
            objVivero.setNombre("asasas");
            objVivero.setDescripcion("asasas");
        //objCultivo.setGrower_senasa("asasas");
            objVivero.setUsuario_responsable("asasas");
            objVivero.setEstado(true);
            
        // TODO code application logic here
//        List<entCultivo> list=CultivoDAO.Listar(true);
//        if(list!=null)
        System.out.print(""+ViveroDAO.insertar(objVivero));
    }
    
}
