
<%@page import="java.util.Date"%>
<%@page import="Entidades.entPuerto"%>
<%@page import="Entidades.entLineaNaviera"%>
<%@page import="Entidades.entViaEmbarque"%>
<%@page import="Entidades.entDistrito"%>
<%@page import="Entidades.entOperadorLogistico"%>
<%@page import="Entidades.entChofer"%>
<%@page import="Entidades.entCliente"%>
<%@page import="Entidades.entEmbarque"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("idClienteFacturable") != null && request.getParameter("idClienteFacturable") != "" &&
                request.getParameter("idExportador") != null && request.getParameter("idExportador") != "" &&
                request.getParameter("idConsignatario") != null && request.getParameter("idConsignatario") != "" &&
                request.getParameter("idChofer") != null && request.getParameter("idChofer") != "" &&
                request.getParameter("idOperadorLogistico") != null && request.getParameter("idOperadorLogistico") != "" &&
                request.getParameter("idDistrito") != null && request.getParameter("idDistrito") != "" &&
                request.getParameter("idContenedor") != null && request.getParameter("idContenedor") != "" &&
                request.getParameter("idViaEmbarque") != null && request.getParameter("idViaEmbarque") != "" &&
                request.getParameter("idLineaNaviera") != null && request.getParameter("idLineaNaviera") != "" &&
                request.getParameter("idPuertoEmbarque") != null && request.getParameter("idPuertoEmbarque") != "" &&
                request.getParameter("idPuertoDestino") != null && request.getParameter("idPuertoDestino") != "" &&
                request.getParameter("txtPrecOpLogistico") != null && request.getParameter("txtPrecOpLogistico") != "" &&
                request.getParameter("txtPrecSenasa") != null && request.getParameter("txtPrecSenasa") != "" &&
                request.getParameter("txtPrecAduanas") != null && request.getParameter("txtPrecAduanas") != "" &&
                request.getParameter("txtPrecLineaNaviera") != null && request.getParameter("txtPrecLineaNaviera") != "" &&
                request.getParameter("txtVapor") != null && request.getParameter("txtVapor") != "" &&
                request.getParameter("txtContainer") != null && request.getParameter("txtContainer") != "" &&
                request.getParameter("txtPlacaContainer") != null && request.getParameter("txtPlacaContainer") != "" &&
                request.getParameter("txtPlacaCarreta") != null && request.getParameter("txtPlacaCarreta") != "" &&
                request.getParameter("txtFechaTraslado") != null && request.getParameter("txtFechaTraslado") != "" &&
                request.getParameter("txtFechaPartida") != null && request.getParameter("txtFechaPartida") != "" &&
                request.getParameter("txtFechaArribo") != null && request.getParameter("txtFechaArribo") != "" &&
                request.getParameter("rbColdTreat") != null && request.getParameter("rbColdTreat") != "" &&
                request.getParameter("txtPackingList") != null && request.getParameter("txtPackingList") != "" &&
                request.getParameter("txtTSetPoint") != null && request.getParameter("txtTSetPoint") != "" &&
                request.getParameter("txtTDespacho") != null && request.getParameter("txtTDespacho") != "" &&
                request.getParameter("txtVentilacion") != null && request.getParameter("txtVentilacion") != "" &&
                request.getParameter("txtHumedad") != null && request.getParameter("txtHumedad") != "" &&
                request.getParameter("txtCantidadFiltros") != null && request.getParameter("txtCantidadFiltros") != "" &&
                request.getParameter("txtBooking") != null && request.getParameter("txtBooking") != "" &&
                request.getParameter("txtHoraInicio") != null && request.getParameter("txtHoraInicio") != "" &&
                request.getParameter("txtHoraFin") != null && request.getParameter("txtHoraFin") != "" )
        {
            entEmbarque entidad = objSession.getObjEmbarque();
            entidad.setObjClienteFacturable(new entCliente(Integer.parseInt(request.getParameter("idClienteFacturable"))));
            entidad.setObjClienteExportador(new entCliente(Integer.parseInt(request.getParameter("idExportador"))));
            entidad.setObjClienteConsignatario(new entCliente(Integer.parseInt(request.getParameter("idConsignatario"))));
            entidad.setObjChofer(new entChofer(Integer.parseInt(request.getParameter("idChofer"))));
            entidad.setObjOperadorLogistico(new entOperadorLogistico(Integer.parseInt(request.getParameter("idOperadorLogistico"))));
            entidad.setObjDistrito(new entDistrito(Integer.parseInt(request.getParameter("idDistrito"))));
            entidad.setObjViaEmbarque(new entViaEmbarque(Integer.parseInt(request.getParameter("idViaEmbarque"))));
            entidad.setObjLineaNaviera(new entLineaNaviera(Integer.parseInt(request.getParameter("idLineaNaviera"))));
            entidad.setObjPuertoEmabarque(new entPuerto(Integer.parseInt(request.getParameter("idPuertoEmbarque"))));
            entidad.setObjPuertoDestino(new entPuerto(Integer.parseInt(request.getParameter("idPuertoDestino"))));
            entidad.setPrec_op_logistico(request.getParameter("txtPrecOpLogistico"));
            entidad.setPrec_senasa(request.getParameter("txtPrecSenasa"));
            entidad.setPrec_aduanas(request.getParameter("txtPrecAduanas"));
            entidad.setPrec_linea_nav(request.getParameter("txtPrecLineaNaviera"));
            entidad.setVapor(request.getParameter("txtVapor"));
            entidad.setContainer(request.getParameter("txtContainer"));
            entidad.setPlaca_container(request.getParameter("txtPlacaContainer"));
            entidad.setPlaca_carreta(request.getParameter("txtPlacaCarreta"));
            entidad.setFecha_traslado(new Date(Long.parseLong(request.getParameter("txtFechaTraslado"))));
            entidad.setFecha_partida(new Date(Long.parseLong(request.getParameter("txtFechaPartida"))));
            entidad.setFecha_arribo(new Date(Long.parseLong(request.getParameter("txtFechaArribo"))));
            entidad.setPacking_list(request.getParameter("txtPackingList"));
            entidad.setT_set_point(Double.parseDouble(request.getParameter("txtTSetPoint")));
            entidad.setT_despacho(Double.parseDouble(request.getParameter("txtTDespacho")));
            entidad.setVentilacion(Double.parseDouble(request.getParameter("txtVentilacion")));
            entidad.setHumedad(Double.parseDouble(request.getParameter("txtHumedad")));
            entidad.setCant_filtros(Double.parseDouble(request.getParameter("txtCantidadFiltros")));
            entidad.setBooking(request.getParameter("txtBooking"));
            entidad.setHora_inicio(new Date(Long.parseLong(request.getParameter("txtHoraInicio"))));
            entidad.setHora_fin(new Date(Long.parseLong(request.getParameter("txtHoraFin"))));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            
            if(request.getParameter("rbColdTreat").equals("1"))
                 entidad.setCold_treat(true);

         
            if(entidad.getId_embarque()>0)
            {
                //entidad.setId_vivero(Integer.parseInt(request.getParameter("IdVivero")));
                 //if(clsGestor.actualizarVivero(entidad))
                 {
                     out.print(0);
                 }
                // else
                     out.print(-1);
            }
             else
            {
                int id=clsGestor.insertarEmbarque(entidad);
                if(id>0)
                {
                    out.print(id);
                    objSession.setObjEmbarque(new entEmbarque());
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("SessionUsuario", objSession);
                    sesion.setMaxInactiveInterval(-1);
                }
                else
                    out.print(0);
            }
        
     
            
        }
}
 %>