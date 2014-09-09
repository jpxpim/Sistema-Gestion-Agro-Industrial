 <%@page import="Entidades.entCalibre"%>
<%@page import="Entidades.entProductoTerminado"%>
<%@page import="Entidades.entDetallePaleta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("IdProductoTerminado") != null && request.getParameter("IdProductoTerminado") != "" &&
        request.getParameter("IdDetPaleta") != null && request.getParameter("IdDetPaleta") != "" &&
        request.getParameter("IdPaleta") != null && request.getParameter("IdPaleta") != "" &&
        request.getParameter("EPaleta") != null && request.getParameter("EPaleta") != "" )
        {
           
            entProductoTerminado objProductoTerminado= new entProductoTerminado();
            objProductoTerminado.setId_producto_terminado(Integer.parseInt(request.getParameter("IdProductoTerminado")));
            
            entDetallePaleta entidad = new entDetallePaleta();
            entidad.setObjProductoTerminado(objProductoTerminado);
            entidad.setId_det_paleta(Integer.parseInt(request.getParameter("IdDetPaleta")));
            entidad.setId_paleta(Integer.parseInt(request.getParameter("IdPaleta")));
            entidad.setId_paleta_origen(Integer.parseInt(request.getParameter("EPaleta")));
            entidad.setEstado(3);
            
             if(clsGestor.actualizarDetalleMovimientosPaleta(entidad))
            {
                out.print(1);
            }
            else
                out.print(0);
           
        }

}%>  
                                                                        
                                                                       
                                                                            