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
    
    //<editor-fold defaultstate="collapsed" desc="entUsuario">
    public static List<entUsuario> ListarUsuario(boolean activo) throws Exception
    {
        return UsuarioDAO.Listar(activo);
    }
    
    public  static int insertarUsuario(entUsuario entidad) throws Exception
    {
        return UsuarioDAO.insertar(entidad);
    }
    
    public static boolean actualizarUsuario(entUsuario entidad) throws Exception
    {
        return UsuarioDAO.actualizar(entidad);
    }
    public static byte[] getFotoUsuario(int IdUsuario) throws Exception
    {
        return UsuarioDAO.getFoto(IdUsuario);
    }
    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entTipoCultivo">
    public static List<entTipoCultivo> ListarTipoCultivo(boolean activo) throws Exception
    {
        return Tipo_CultivoDAO.Listar(activo);
    }
    
    public  static int insertarTipoCultivo(entTipoCultivo entidad) throws Exception
    {
        return Tipo_CultivoDAO.insertar(entidad);
    }
    
    public static boolean actualizarTipoCultivo(entTipoCultivo entidad) throws Exception
    {
        return Tipo_CultivoDAO.actualizar(entidad);
    }

    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entSector">
    public static List<entSector> ListarSector(boolean activo) throws Exception
    {
        return SectorDAO.Listar(activo);
    }
    
    public  static int insertarSector(entSector entidad) throws Exception
    {
        return SectorDAO.insertar(entidad);
    }
    
    public static boolean actualizarSector(entSector entidad) throws Exception
    {
        return SectorDAO.actualizar(entidad);
    }

    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entSubSector">
    public static List<entSubSector> ListarSubSector(boolean activo) throws Exception
    {
        return SubSectorDAO.Listar(activo);
    }
    
    public  static int insertarSubSector(entSubSector entidad) throws Exception
    {
        return SubSectorDAO.insertar(entidad);
    }
    
    public static boolean actualizarSubSector(entSubSector entidad) throws Exception
    {
        return SubSectorDAO.actualizar(entidad);
    }

    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entPatron">
    public static List<entPatron> ListarPatron(boolean activo) throws Exception
    {
        return PatronDAO.Listar(activo);
    }
    
    public  static int insertarPatron(entPatron entidad) throws Exception
    {
        return PatronDAO.insertar(entidad);
    }
    
    public static boolean actualizarPatron(entPatron entidad) throws Exception
    {
        return PatronDAO.actualizar(entidad);
    }

    
// </editor-fold>
}
