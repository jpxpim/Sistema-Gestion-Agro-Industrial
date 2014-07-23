/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Com;

import Dao.CultivoDAO;
import Entidades.entCultivo;
import java.util.List;

/**
 *
 * @author Toditos
 */
public class clsGestor {
    //<editor-fold defaultstate="collapsed" desc="entCultivo">
    public static List<entCultivo> ListarCultivo(boolean activo) throws Exception
    {
        return CultivoDAO.Listar(activo);
    }
    
    public  static int insertarCultivo(entCultivo entidad) throws Exception
    {
        return CultivoDAO.insertar(entidad);
    }
    
    public static boolean actualizarCultivo(entCultivo entidad) throws Exception
    {
        return CultivoDAO.actualizar(entidad);
    }
    
// </editor-fold>
}
