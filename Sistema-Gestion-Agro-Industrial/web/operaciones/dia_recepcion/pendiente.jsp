<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
   if(clsGestor.pedienteDiaRecepcion())
    out.print("1");
   else
    out.print("0");
}
%>     