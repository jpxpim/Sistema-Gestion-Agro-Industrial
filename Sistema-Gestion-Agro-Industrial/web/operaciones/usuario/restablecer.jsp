
<%@page import="Entidades.entSesion"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page import="java.util.Date"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entUsuario"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("id") != null && request.getParameter("id") != "")
    {
        
         if(clsGestor.restablecerUsuario(Integer.parseInt(request.getParameter("id")),objSession.getObjConfiguracion().getUsuario_clave()))
         {
             out.print(0);
         }
         else
             out.print(-1);
    }
}
 %>