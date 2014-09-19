
<%@page import="Entidades.entSesion"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page import="java.util.Date"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entUsuario"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("txtCRepetida") != null && request.getParameter("txtCRepetida") != ""  &&
            request.getParameter("txtCNuevo") != null && request.getParameter("txtCNuevo") != "" &&
            request.getParameter("txtCActual") != null && request.getParameter("txtCActual") != "")
    {
        if(request.getParameter("txtCActual").equals(objSession.getObjUsuario().getContrasena()))
        {
            if(clsGestor.contrasenaUsuario(objSession.getObjUsuario().getId_usuario(),request.getParameter("txtCNuevo")))
            {
                out.print(1);
                objSession.getObjUsuario().setContrasena(request.getParameter("txtCNuevo"));
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
            }
            else
                out.print(0);

        }else
            out.print(-1);
    }
}
 %>