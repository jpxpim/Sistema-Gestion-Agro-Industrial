/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Com;

import Dao.*;
import Entidades.*;
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
    
    //<editor-fold defaultstate="collapsed" desc="entEdadCultivo">
    public static List<entEdadCultivo> ListarEdadCultivo(boolean activo) throws Exception
    {
        return EdadCultivoDAO.Listar(activo);
    }
    
    public  static int insertarEdadCultivo(entEdadCultivo entidad) throws Exception
    {
        return EdadCultivoDAO.insertar(entidad);
    }
    
    public static boolean actualizarEdadCultivo(entEdadCultivo entidad) throws Exception
    {
        return EdadCultivoDAO.actualizar(entidad);
    }
    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entVivero">
    public static List<entVivero> ListarVivero(boolean activo) throws Exception
    {
        return ViveroDAO.Listar(activo);
    }
    
    public  static int insertarVivero(entVivero entidad) throws Exception
    {
        return ViveroDAO.insertar(entidad);
    }
    
    public static boolean actualizarVivero(entVivero entidad) throws Exception
    {
        return ViveroDAO.actualizar(entidad);
    }
    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entVivero">
    public static List<entVariedad> ListarVariedad(boolean activo) throws Exception
    {
        return VariedadDAO.Listar(activo);
    }
    
    public  static int insertarVariedad(entVariedad entidad) throws Exception
    {
        return VariedadDAO.insertar(entidad);
    }
    
    public static boolean actualizarVariedad(entVariedad entidad) throws Exception
    {
        return VariedadDAO.actualizar(entidad);
    }
    
// </editor-fold>
}
