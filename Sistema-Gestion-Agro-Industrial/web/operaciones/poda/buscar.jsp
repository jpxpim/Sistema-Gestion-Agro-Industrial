<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entPoda"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("id") != null && request.getParameter("id") != "" )
        {
            entPoda entidad = clsGestor.BuscarPorIdPoda(Integer.parseInt(request.getParameter("id")));

            if(entidad!=null)
            {
                objSession.setObjPoda(entidad);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
                
            }
            
        }
}
 %>