
<%@page import="Entidades.entInsumo"%>
<%@page import="Entidades.entDetalleReceta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("pos") != null && request.getParameter("pos") != "" )
        {
            
            int pos=Integer.parseInt(request.getParameter("pos")); 
            
            if(objSession.getListDetalleReceta().get(pos).getId_det_receta()>0)
                objSession.getListDetalleReceta().get(pos).setEliminado_session(true);
            else
                objSession.getListDetalleReceta().remove(pos);
            
            HttpSession sesion = request.getSession();
            sesion.setAttribute("SessionUsuario", objSession);
            sesion.setMaxInactiveInterval(-1);

        }
}
 %>