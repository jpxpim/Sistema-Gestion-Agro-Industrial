
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entRaleo"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("id") != null && request.getParameter("id") != "" &&
           request.getParameter("tipo") != null && request.getParameter("tipo") != "")
        {
            entRaleo entidad = clsGestor.BuscarPorIdRaleo(Integer.parseInt(request.getParameter("id")));
            if(request.getParameter("tipo").equals("0"))
                entidad.setSeleccion(true);
            else
                 entidad.setSeleccion(false);
            if(entidad!=null)
            {
                objSession.setObjRaleo(entidad);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
                
            }
            
        }
}
 %>