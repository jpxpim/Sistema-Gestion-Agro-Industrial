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
import Entidades.entEvaluador;
import Entidades.entFormulario;
import Entidades.entFormularioUsuario;
import Entidades.entLote;
import Entidades.entModulo;
import Entidades.entPatron;
import Entidades.entPrePoda;
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
            entPrePoda entidad = new entPrePoda();
            entidad.setObjCampaniaLote(new entCampaniaLote(1));
            entidad.setObjEvaluador(new entEvaluador(1));
            entidad.setUsuario_responsable("s");
            entidad.setEstado(true);

        System.out.print(""+SesionDAO.login("Admin", "123456").getListModulos().size());
    }
    
}
