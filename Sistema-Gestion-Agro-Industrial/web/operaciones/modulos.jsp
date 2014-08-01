<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("posicion") != null && request.getParameter("posicion") != "")
    {
        objSession.setPosicion(Integer.parseInt(request.getParameter("posicion")));
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession);
        sesion.setMaxInactiveInterval(-1);
    }
}
%>     