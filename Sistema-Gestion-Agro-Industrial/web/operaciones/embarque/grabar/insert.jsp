
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
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
            entVivero entidad = new entVivero();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setCodigo_control(request.getParameter("txtCodigo"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdVivero").equals("0") )
            {
                entidad.setId_vivero(Integer.parseInt(request.getParameter("IdVivero")));
                 if(clsGestor.actualizarVivero(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarVivero(entidad);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
}
 %>