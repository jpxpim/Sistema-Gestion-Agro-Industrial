/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCultivo;
import java.util.List;

/**
 *
 * @author Toditos
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        
        entCultivo objCultivo = new entCultivo();
            objCultivo.setNombre("asasas");
            objCultivo.setDescripcion("asasas");
            objCultivo.setUsuario_responsable("asasas");
            objCultivo.setEstado(true);
            
        // TODO code application logic here
//        List<entCultivo> list=CultivoDAO.Listar(true);
//        if(list!=null)
        System.out.print(""+CultivoDAO.insertar2(objCultivo));
    }
    
}
