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
        request.getParameter("Codigo") != null && request.getParameter("Codigo") != "" &&
        request.getParameter("nCalibre") != null && request.getParameter("nCalibre") != "" &&
        request.getParameter("nVariedad") != null && request.getParameter("nVariedad") != "" &&
        request.getParameter("cLote") != null && request.getParameter("cLote") != "")
        {
            entProductoTerminado objProductoTerminado= new entProductoTerminado();
            objProductoTerminado.setCodigo_control(request.getParameter("Codigo"));
            objProductoTerminado.setEmbalador(request.getParameter("nCalibre"));
            objProductoTerminado.setSeleccionador(request.getParameter("nVariedad"));
            objProductoTerminado.setUsuario_responsable(request.getParameter("cLote") );
            objProductoTerminado.setId_producto_terminado(Integer.parseInt(request.getParameter("IdProductoTerminado")));
            
            entDetallePaleta entidad = new entDetallePaleta();
            entidad.setObjProductoTerminado(objProductoTerminado);
            
            boolean valida=false;
            for(entDetallePaleta objDetallePaleta :  objSession.getObjPaleta().getListaDetallePaleta())
                if(objDetallePaleta.getObjProductoTerminado().getId_producto_terminado()==entidad.getObjProductoTerminado().getId_producto_terminado())
                {
                     valida=true;
                }
            
            if(valida)
                out.print(0);
            else
            {
                objSession.getObjPaleta().getListaDetallePaleta().add(entidad);                      
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession); 
                sesion.setMaxInactiveInterval(-1);
                out.print(1);
            }
            
        }
}%>  
                                                                        
                                                                       
                                                                            