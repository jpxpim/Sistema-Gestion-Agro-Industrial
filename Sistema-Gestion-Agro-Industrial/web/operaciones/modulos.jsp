<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("posicion") != null && request.getParameter("posicion") != "")
    {
        int pos=Integer.parseInt(request.getParameter("posicion"));
        objSession.setPosicion(pos);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession);
        sesion.setMaxInactiveInterval(-1);
        out.print(objSession.getListModulos().get(pos).getUrl());
        
    }
}
%>     