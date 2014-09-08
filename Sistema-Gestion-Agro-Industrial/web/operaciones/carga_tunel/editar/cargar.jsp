
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{

if(request.getParameter("id") != null && request.getParameter("id") != "")
{
    objSession.setObjCargaTunel(clsGestor.buscarxTunelCargaTunel(Integer.parseInt(request.getParameter("id"))));

    HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);

}
}
%>                                                                        