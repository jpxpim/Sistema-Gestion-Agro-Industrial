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
    
    //<editor-fold defaultstate="collapsed" desc="entConfiguracion">
    public static boolean actualizarConfiguracion(entConfiguracion entidad) throws Exception{
        return ConfiguracionDAO.actualizar(entidad);
    }
    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entSesion">
    public static entSesion loginSession(String login,String contrasena) throws Exception
    {
        return SesionDAO.login(login, contrasena);
    }
    
// </editor-fold>
    
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
    
    //<editor-fold defaultstate="collapsed" desc="entVariedad">
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
    
    //<editor-fold defaultstate="collapsed" desc="entCliente">
    public static List<entCliente> ListarCliente(boolean activo) throws Exception
    {
        return ClienteDAO.Listar(activo);
    }
    
    public  static int insertarCliente(entCliente entidad) throws Exception
    {
        return ClienteDAO.insertar(entidad);
    }
    
    public static boolean actualizarCliente(entCliente entidad) throws Exception
    {
        return ClienteDAO.actualizar(entidad);
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
    public static boolean restablecerUsuario(int Id,String Contrasena) throws Exception
    {
        return UsuarioDAO.restablecer(Id, Contrasena);
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
    
    //<editor-fold defaultstate="collapsed" desc="entModulo">
      public static List<entModulo> ListarUsuarioModulo(int idUsuario) throws Exception
    {
        return ModuloDAO.ListarUsuario(idUsuario);
    }
    
   

    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="EntCampania">
    public static List<entCampania> ListarCampania(boolean activo) throws Exception
    {
        return CampaniaDAO.Listar(activo);
    }
    
    public  static int insertarCampania(entCampania entidad) throws Exception
    {
        return CampaniaDAO.insertar(entidad);
    }
    
    public static boolean actualizarCampania(entCampania entidad) throws Exception
    {
        return CampaniaDAO.actualizar(entidad);
    }
    public static List<entCampania> ListarDistintoLoteCampania(int idLote) throws Exception
   {
        return CampaniaDAO.ListarDistintoLote(idLote);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entProductor">
    public static List<entProductor> ListarProductor(boolean activo) throws Exception
    {
        return ProductorDAO.Listar(activo);
    }
    
    public  static int insertarProductor(entProductor entidad) throws Exception
    {
        return ProductorDAO.insertar(entidad);
    }
    
    public static boolean actualizarProductor(entProductor entidad) throws Exception
    {
        return ProductorDAO.actualizar(entidad);
    }
// </editor-fold> 
    
    //<editor-fold defaultstate="collapsed" desc="entLote">
    public static List<entLote> ListarLote(boolean activo) throws Exception
    {
        return LoteDAO.Listar(activo);
    }
    
    public  static int insertarLote(entLote entidad) throws Exception
    {
        return LoteDAO.insertar(entidad);
    }
    
    public static boolean actualizarLote(entLote entidad) throws Exception
    {
        return LoteDAO.actualizar(entidad);
    }
    
    public static List<entLote> GraficoHectreasAnioLote() throws Exception
    {
        return LoteDAO.GraficoHectreasAnio();
    }    
    public static List<entLote> GraficoHectareasVariedadLote() throws Exception
    {
        return LoteDAO.GraficoHectareasVariedad();
    }    
    
     
// </editor-fold>
     
    //<editor-fold defaultstate="collapsed" desc="entCampaniaLote">
    public static List<entCampaniaLote> ListarCampaniaLote() throws Exception
    {
        return CampaniaLoteDAO.Listar();
    }
    
    public  static int insertarCampaniaLote(entCampaniaLote entidad) throws Exception
    {
        return CampaniaLoteDAO.insertar(entidad);
    }
    
    public static boolean actualizarCampaniaLote(entCampaniaLote entidad) throws Exception
    {
        return CampaniaLoteDAO.actualizar(entidad);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entFormulario">
   
    public  static int insertarFormulario(entFormulario entidad) throws Exception
    {
        return FormularioDAO.insertar(entidad);
    }
    
    public static boolean actualizarFormulario(entFormulario entidad) throws Exception
    {
        return FormularioDAO.actualizar(entidad);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entFormularioUsuario">
   
    public  static int insertarentFormularioUsuario(entFormularioUsuario entidad) throws Exception
    {
        return FormularioUsuarioDAO.insertar(entidad);
    }
    
    public static boolean eliminarentFormularioUsuario(entFormularioUsuario entidad) throws Exception
    {
        return FormularioUsuarioDAO.eliminar(entidad);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entEvaluador">
   
    public static List<entEvaluador> ListarEvaluador(boolean activo) throws Exception
    {
        return EvaluadorDAO.Listar(activo);
    }
    
    public  static int insertarEvaluador(entEvaluador entidad) throws Exception
    {
        return EvaluadorDAO.insertar(entidad);
    }
    
    public static boolean actualizarEvaluador(entEvaluador entidad) throws Exception
    {
        return EvaluadorDAO.actualizar(entidad);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entAnalisisYemas">
   
    public static List<entAnalisisYemas> ListarAnalisisYemas(boolean activo) throws Exception
    {
        return AnalisisYemasDAO.Listar(activo);
    }
    
    public  static int insertarAnalisisYemas(entAnalisisYemas entidad) throws Exception
    {
        return AnalisisYemasDAO.insertar(entidad);
    }
    
    public static boolean actualizarAnalisisYemas(entAnalisisYemas entidad) throws Exception
    {
        return AnalisisYemasDAO.actualizar(entidad);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entBrotacion">
    public  static int insertarBrotacion(entBrotacion entidad) throws Exception
    {
        return BrotacionDAO.insertar(entidad);
    }
    public static boolean actualizarBrotacion(entBrotacion entidad) throws Exception
    {
        return BrotacionDAO.actualizar(entidad);
    }
    public static List<entBrotacion> ListarBrotacion(boolean activo) throws Exception
    {
        return BrotacionDAO.Listar(activo);
    }
    public static entBrotacion BuscarPorIdBrotacion(int id) throws Exception
    {
        return BrotacionDAO.BuscarPorId(id);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entDesbrote">
    public  static int insertarDesbrote(entDesbrote entidad) throws Exception
    {
        return DesbroteDAO.insertar(entidad);
    }
    public static boolean actualizarDesbrote(entDesbrote entidad) throws Exception
    {
        return DesbroteDAO.actualizar(entidad);
    }
    public static List<entDesbrote> ListarDesbrote(boolean activo) throws Exception
    {
        return DesbroteDAO.Listar(activo);
    }
    public static entDesbrote BuscarPorIdDesbrote(int id) throws Exception
    {
        return DesbroteDAO.BuscarPorId(id);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entPrePoda">
    public  static int insertarPrePoda(entPrePoda entidad) throws Exception
    {
        return PrePodaDAO.insertar(entidad);
    }
    public static boolean actualizarPrePoda(entPrePoda entidad) throws Exception
    {
        return PrePodaDAO.actualizar(entidad);
    }
    public static List<entPrePoda> ListarPrePoda(boolean activo) throws Exception
    {
        return PrePodaDAO.Listar(activo);
    }
    public static entPrePoda BuscarPorIdPrePoda(int id) throws Exception
    {
        return PrePodaDAO.BuscarPorId(id);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entPoda">
    public  static int insertarPoda(entPoda entidad) throws Exception
    {
        return PodaDAO.insertar(entidad);
    }
    public static boolean actualizarPoda(entPoda entidad) throws Exception
    {
        return PodaDAO.actualizar(entidad);
    }
    public static List<entPoda> ListarPoda(boolean activo) throws Exception
    {
        return PodaDAO.Listar(activo);
    }
    public static entPoda BuscarPorIdPoda(int id) throws Exception
    {
        return PodaDAO.BuscarPorId(id);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entRaleo">
    public  static int insertarRaleo(entRaleo entidad) throws Exception
    {
        return RaleoDAO.insertar(entidad);
    }
    public static boolean actualizarRaleo(entRaleo entidad) throws Exception
    {
        return RaleoDAO.actualizar(entidad);
    }
    public static List<entRaleo> ListarRaleo(boolean activo) throws Exception
    {
        return RaleoDAO.Listar(activo);
    }
    public static entRaleo BuscarPorIdRaleo(int id) throws Exception
    {
        return RaleoDAO.BuscarPorId(id);
    }
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entChofer">
    public  static int insertarChofer(entChofer entidad) throws Exception
    {
        return ChoferDAO.insertar(entidad);
    }
    public static boolean actualizarChofer(entChofer entidad) throws Exception
    {
        return ChoferDAO.actualizar(entidad);
    }
    public static List<entChofer> ListarChofer(boolean activo) throws Exception
    {
        return ChoferDAO.Listar(activo);
    }

// </editor-fold>    
    
    //<editor-fold defaultstate="collapsed" desc="entDireccionLlegada">
    public  static int insertarDireccionLlegada(entDireccionLlegada entidad) throws Exception
    {
        return DireccionLlegadaDAO.insertar(entidad);
    }
    public static boolean actualizarDireccionLlegada(entDireccionLlegada entidad) throws Exception
    {
        return DireccionLlegadaDAO.actualizar(entidad);
    }
    public static List<entDireccionLlegada> ListarDireccionLlegada(boolean activo) throws Exception
    {
        return DireccionLlegadaDAO.Listar(activo);
    }

// </editor-fold>
  
    //<editor-fold defaultstate="collapsed" desc="entTransportista">
    public  static int insertarTransportista(entTransportista entidad) throws Exception
    {
        return TransportistaDAO.insertar(entidad);
    }
    public static boolean actualizarTransportista(entTransportista entidad) throws Exception
    {
        return TransportistaDAO.actualizar(entidad);
    }
    public static List<entTransportista> ListarTransportista(boolean activo) throws Exception
    {
        return TransportistaDAO.Listar(activo);
    }

    // </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entJava">
    public static List<entJaba> ListarJaba(boolean activo) throws Exception
    {
        return JabaDAO.Listar(activo);
    }
    
    public  static int insertarJaba(entJaba entidad) throws Exception
    {
        return JabaDAO.insertar(entidad);
    }
    
    public static boolean actualizarJaba(entJaba entidad) throws Exception
    {
        return JabaDAO.actualizar(entidad);
    }
    
    // </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entCategoria">
    public static List<entCategoria> ListarCategoria(boolean activo) throws Exception
    {
        return CategoriaDAO.Listar(activo);
    }
    
    public  static int insertarCategoria(entCategoria entidad) throws Exception
    {
        return CategoriaDAO.insertar(entidad);
    }
    
    public static boolean actualizarCategoria(entCategoria entidad) throws Exception
    {
        return CategoriaDAO.actualizar(entidad);
    }
    
    // </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entParihuela">
    public static List<entParihuela> ListarParihuela(boolean activo) throws Exception
    {
        return ParihuelaDAO.Listar(activo);
    }
    
    public  static int insertarParihuela(entParihuela entidad) throws Exception
    {
        return ParihuelaDAO.insertar(entidad);
    }
    
    public static boolean actualizarParihuela(entParihuela entidad) throws Exception
    {
        return ParihuelaDAO.actualizar(entidad);
    }
    
    // </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entRecepcion">
    
    public static List<entRecepcion>  ListarPorDiaRecepcionRecepcion(int idDiaRecepcion) throws Exception
    {
        return RecepcionDAO.ListarPorDiaRecepcion(idDiaRecepcion);
    }
    
    public static List<entRecepcion> ListarRecepcion(boolean activo) throws Exception
    {
        return RecepcionDAO.Listar(activo);
    }
    
    public  static int insertarRecepcion(entRecepcion entidad) throws Exception
    {
        return RecepcionDAO.insertar(entidad);
    }
    
    public static boolean actualizarRecepcion(entRecepcion entidad) throws Exception
    {
        return RecepcionDAO.actualizar(entidad);
    }
     public static entRecepcion BuscarPorIdRecepcion(int id) throws Exception
    {
        return RecepcionDAO.BuscarPorId(id);
    }
    // </editor-fold>
     
    //<editor-fold defaultstate="collapsed" desc="entDiaRecepcion">
     public static entDiaRecepcion verificarDiaRecepcion() throws Exception
    {
        return DiaRecepcionDAO.verificar();
    }
    public  static int insertarDiaRecepcion(entDiaRecepcion entidad) throws Exception
    {
      return DiaRecepcionDAO.insertar(entidad);
    }
    public static boolean actualizarDiaRecepcion(entDiaRecepcion entidad) throws Exception
    {
      return DiaRecepcionDAO.actualizar(entidad);
    }
    public static boolean pedienteDiaRecepcion() throws Exception
    {
        return DiaRecepcionDAO.pediente();
    }
  
    // </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entDescarte">
    public static List<entDescarte> ListarPorDiaRecepcionDescarte(int idDiaRecepcion) throws Exception
    {
        return DescarteDAO.ListarPorDiaRecepcion(idDiaRecepcion);
    }
    public static List<entDescarte> ListarDescarte() throws Exception
    {
        return DescarteDAO.Listar();
    }
    
    public  static int insertarDescarte(entDescarte entidad) throws Exception
    {
        return DescarteDAO.insertar(entidad);
    }
    
    public static boolean actualizarDescarte(entDescarte entidad) throws Exception
    {
        return DescarteDAO.actualizar(entidad);
    }
    // </editor-fold> 
    
    //<editor-fold defaultstate="collapsed" desc="entEnvase">
    public static List<entEnvase> ListarEnvase(boolean activo) throws Exception
    {
        return EnvaseDAO.Listar(activo);
    }
    
    public  static int insertarEnvase(entEnvase entidad) throws Exception
    {
        return EnvaseDAO.insertar(entidad);
    }
    
    public static boolean actualizarEnvase(entEnvase entidad) throws Exception
    {
        return EnvaseDAO.actualizar(entidad);
    }
    // </editor-fold> 
    
    //<editor-fold defaultstate="collapsed" desc="entCalibre">
    public static List<entCalibre> ListarCalibre(boolean activo) throws Exception
    {
        return CalibreDAO.Listar(activo);
    }
    
    public  static int insertarCalibre(entCalibre entidad) throws Exception
    {
        return CalibreDAO.insertar(entidad);
    }
    
    public static boolean actualizarCalibre(entCalibre entidad) throws Exception
    {
        return CalibreDAO.actualizar(entidad);
    }
    // </editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="entColor">
    public static List<entColor> ListarColor(boolean activo) throws Exception
    {
        return ColorDAO.Listar(activo);
    }
    
    public  static int insertarColor(entColor entidad) throws Exception
    {
        return ColorDAO.insertar(entidad);
    }
    
    public static boolean actualizarColor(entColor entidad) throws Exception
    {
        return ColorDAO.actualizar(entidad);
    }
    // </editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="entEmpleado">
    public static List<entEmpleado> ListarEmpleado(boolean activo) throws Exception
    {
        return EmpleadoDAO.Listar(activo);
    }
    
//    public  static int insertarEmpleado(entEmpleado entidad) throws Exception
//    {
//        return EmpleadoDAO.insertar(entidad);
//    }
//    
//    public static boolean actualizarEmpleado(entEmpleado entidad) throws Exception
//    {
//        return EmpleadoDAO.actualizar(entidad);
//    }
    // </editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="entLineaProduccion">
    public static List<entLineaProduccion> ListarLineaProduccion(boolean activo) throws Exception
    {
        return LineaProduccionDAO.Listar(activo);
    }
    
    public  static int insertarLineaProduccion(entLineaProduccion entidad) throws Exception
    {
        return LineaProduccionDAO.insertar(entidad);
    }
    
    public static boolean actualizarLineaProduccion(entLineaProduccion entidad) throws Exception
    {
        return LineaProduccionDAO.actualizar(entidad);
    }
    // </editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="entProductoTerminado">

    public  static int insertarProductoTerminado(entProductoTerminado entidad) throws Exception
    {
      return ProductoTerminadoDAO.insertar(entidad);
    }
    public static List<entProductoTerminado> ListarProductoTerminado(int id_dia_recepcion,int idLineaProduccion) throws Exception
    {
        return ProductoTerminadoDAO.Listar(id_dia_recepcion,idLineaProduccion);
    }
      public static boolean actualizarProductoTerminado(entProductoTerminado entidad) throws Exception
    {
        return ProductoTerminadoDAO.actualizar(entidad);
    }
    public static List<entProductoTerminado> ListarPorDiaRecepccionProductoTerminado(int id_dia_recepcion) throws Exception
    {
        return ProductoTerminadoDAO.ListarPorDiaRecepccion(id_dia_recepcion);
    }
    public static entProductoTerminadoTemp buscarOrigenProductoTerminado(String Codigo) throws Exception
    {
        return ProductoTerminadoDAO.buscarOrigen(Codigo);
    }
    public static List<entProductoTerminado> GraficoAcumulativoDiaProduccionProductoTerminado(int idLinea,int tiempo,boolean acumulativo)throws Exception
    {
        return ProductoTerminadoDAO.GraficoAcumulativoDiaProduccion(idLinea, tiempo, acumulativo);
    }
    public static List<entProductoTerminado> GraficoEnvasexLineaProduccionProduccionProductoTerminado(int idLineaProduccion) throws Exception
    {
        return ProductoTerminadoDAO.GraficoEnvasexLineaProduccion(idLineaProduccion);
    }
     public static List<entProductoTerminado> GraficoVariedadxLineaProduccionProductoTerminado(int idLineaProduccion) throws Exception
    {   
        return ProductoTerminadoDAO.GraficoVariedadxLineaProduccion(idLineaProduccion);
    }
    public static List<entProductoTerminado> GraficoCalibredxLineaProduccionProductoTerminado(int idLineaProduccion) throws Exception
    {   
        return ProductoTerminadoDAO.GraficoCalibredxLineaProduccion(idLineaProduccion);
    }
    public static List<entProductoTerminado> GraficoCategoriaxLineaProduccionProductoTerminado(int idLineaProduccion) throws Exception
    {   
        return ProductoTerminadoDAO.GraficoCategoriaxLineaProduccion(idLineaProduccion);
    }
    public static List<entProductoTerminado> GraficoSelecionadorProductoTerminado() throws Exception
    {
      return ProductoTerminadoDAO.GraficoSelecionador();  
    } 
    public static List<entProductoTerminado> GraficoEmbaladorProductoTerminado() throws Exception
    {
      return ProductoTerminadoDAO.GraficoEmbalador();  
    } 
    
    // </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entPaleta">
//    public static List<entPaleta> ListarPaleta(boolean activo) throws Exception
//    {
//        return PaletaDAO.Listar(activo);
//    }
    public static List<entPaleta> ListarPackingPaleta() throws Exception
    {
        return PaletaDAO.ListarPacking();
    }
    
    public  static int insertarPaleta(entPaleta entidad) throws Exception
    {
        return PaletaDAO.insertar(entidad);
    }
    public static List<entDetallePaleta> ListarPorProductoTerminadoRepaletizadoPaleta() throws Exception
    {
        return PaletaDAO.ListarPorProductoTerminadoRepaletizado();
    }
     public  static int insertarRepaletizadoPaleta(entPaleta entidad) throws Exception 
    {
        return PaletaDAO.insertarRepaletizado(entidad);
    }
//    
//    public static boolean actualizarPaleta(entPaleta entidad) throws Exception
//    {
//        return PaletaDAO.actualizar(entidad);
//    }
    // </editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="entInsumo">
    public static List<entInsumo> ListarInsumo( ) throws Exception
    {
        return InsumoDAO.Listar();
    }
    // </editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="entReceta">
    public static List<entReceta> ListarReceta(boolean activo) throws Exception
    {
        return RecetaDAO.Listar(activo);
    }
     public static List<entDetalleReceta> ListarDetalleReceta(int IdReceta) throws Exception
    {
        return RecetaDAO.ListarDetalle(IdReceta);
    }
     public  static int insertarReceta(entReceta entidad) throws Exception
    {
        return RecetaDAO.insertar(entidad);
    }
      public  static boolean actualizarReceta(entReceta entidad) throws Exception
    {
        return RecetaDAO.actualizar(entidad);
    }
    // </editor-fold>  
    
    //<editor-fold defaultstate="collapsed" desc="entTunel">
    public static List<entTunel> ListarTunel(boolean activo,int carga) throws Exception
    {
        return TunelDAO.Listar(activo,carga);
    }
    
    public  static int insertarTunel(entTunel entidad) throws Exception
    {
        return TunelDAO.insertar(entidad);
    }
   
    public static boolean actualizarTunel(entTunel entidad) throws Exception
    {
        return TunelDAO.actualizar(entidad);
    }
    
// </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="entCargaTunel">
  
    public  static int insertarCargaTunel(entCargaTunel entidad) throws Exception
    {
        return CargaTunelDAO.insertar(entidad);
    }
    public static entCargaTunel  buscarxTunelCargaTunel(int idTunel) throws Exception
    {
        return CargaTunelDAO.buscarxTunel(idTunel);
    }

    public static boolean actualizarDescargaCargaTunel(entCargaTunel entidad) throws Exception
    {
        return CargaTunelDAO.actualizarDescarga(entidad);
    }   
    public static boolean actualizarCarga(entCargaTunel entidad) throws Exception
    {
         return CargaTunelDAO.actualizarCarga(entidad);
}
// </editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Ubigeo">
   public List<entDepartamento> listarDepartamento() throws Exception
   {
       return DepartamentoDAO.listarDepartamento();
   }
     public List<entDistrito> listarDistritoXProvincia(int IdProvincia) throws Exception
     {
         return DistritoDAO.listarDistritoXProvincia(IdProvincia);
     }
     public List<entProvincia> listarProvinciaXDepartamento(int IdDepartamento) throws Exception
     {
         return ProvinciaDAO.listarProvinciaXDepartamento(IdDepartamento);
     }
     public  entDistrito buscarIdProvincia (int idDistrito) throws Exception
     {
         return DistritoDAO.buscarId(idDistrito);
     }
        // </editor-fold> 
}
