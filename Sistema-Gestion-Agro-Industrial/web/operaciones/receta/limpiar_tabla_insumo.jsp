
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entInsumo"%>
<%@page import="Entidades.entDetalleReceta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
            objSession.setListDetalleReceta(new ArrayList<entDetalleReceta>() );
          
            HttpSession sesion = request.getSession();
            sesion.setAttribute("SessionUsuario", objSession);
            sesion.setMaxInactiveInterval(-1);

}
 %>