
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCultivo"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("parametro") != null && request.getParameter("parametro") != "")
        {
            
        }
}
 %>