<%@page import="Entidades.entDetallePaleta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%
    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("pos") != null && request.getParameter("pos") != "")
    {
        objSession.getObjPaleta().getListaDetallePaleta().remove(Integer.parseInt(request.getParameter("pos")));
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);
        
    }
                 
}
%>  
                                                                        
                                                                       
                                                                            