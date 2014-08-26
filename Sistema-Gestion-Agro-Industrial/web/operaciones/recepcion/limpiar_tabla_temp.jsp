<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    objSession.setObjRecepcion(null);
    HttpSession sesion = request.getSession();
    sesion.setAttribute("SessionUsuario", objSession);
    sesion.setMaxInactiveInterval(-1);
}
%>     