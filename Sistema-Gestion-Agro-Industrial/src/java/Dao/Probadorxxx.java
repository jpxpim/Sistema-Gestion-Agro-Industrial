/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dao;

import Entidades.entCampania;
import Entidades.entCampaniaLote;
import Entidades.entCultivo;
import Entidades.entEdadCultivo;
import Entidades.entFormulario;
import Entidades.entFormularioUsuario;
import Entidades.entLote;
import Entidades.entModulo;
import Entidades.entPatron;
import Entidades.entSector;
import Entidades.entSubSector;
import Entidades.entTipoCultivo;
import Entidades.entUsuario;
import Entidades.entVariedad;
import Entidades.entVivero;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import sun.misc.BASE64Encoder;

/**
 *
 * @author Toditos
 */
public class Probadorxxx {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        entFormularioUsuario entidad = new entFormularioUsuario();
        entidad.setObjUSuario(new entUsuario(2) );
        entidad.setObjFormulario(new entFormulario(8,7));
        entidad.setUsuario_responsable("sdas");
        System.out.print(""+BrotacionDAO.BuscarPorId(22).getList().get(0).getList().size());
    }
    
}
