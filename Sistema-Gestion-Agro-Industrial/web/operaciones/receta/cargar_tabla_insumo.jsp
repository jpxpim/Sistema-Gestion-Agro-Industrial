
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
        if(request.getParameter("id") != null && request.getParameter("id") != "" )
        {
            objSession.setListDetalleReceta(new ArrayList<entDetalleReceta>() );
            List<entDetalleReceta> list=clsGestor.ListarDetalleReceta(Integer.parseInt(request.getParameter("id")));
            if(list!=null)
            {
                objSession.setListDetalleReceta(list);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
            }
             HttpSession sesion = request.getSession();
            sesion.setAttribute("SessionUsuario", objSession);
            sesion.setMaxInactiveInterval(-1);

        }
}
 %>