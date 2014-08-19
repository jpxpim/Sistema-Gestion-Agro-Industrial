
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entDesbrote"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("id") != null && request.getParameter("id") != "" &&
           request.getParameter("tipo") != null && request.getParameter("tipo") != "")
        {
            entDesbrote entidad = clsGestor.BuscarPorIdDesbrote(Integer.parseInt(request.getParameter("id")));
            if(request.getParameter("tipo").equals("0"))
                entidad.setSeleccion(true);
            if(entidad!=null)
            {
                objSession.setObjDesbrote(entidad);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
                
            }
            
        }
}
 %>