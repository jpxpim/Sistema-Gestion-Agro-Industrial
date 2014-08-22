<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entPrePoda"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("id") != null && request.getParameter("id") != "" &&
           request.getParameter("tipo") != null && request.getParameter("tipo") != "")
        {
            entPrePoda entidad = clsGestor.BuscarPorIdPrePoda(Integer.parseInt(request.getParameter("id")));
            if(request.getParameter("tipo").equals("0"))
                entidad.setSeleccion(true);
            if(entidad!=null)
            {
                objSession.setObjPrePoda(entidad);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
                
            }
            
        }
}
 %>