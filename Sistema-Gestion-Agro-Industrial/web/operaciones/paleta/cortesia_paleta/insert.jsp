
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("IdPaleta") != null && request.getParameter("IdPaleta") != "" &&
        request.getParameter("Codigo") != null && request.getParameter("Codigo") != "")
        {
            entPaleta entidad=objSession.getObjPaleta();
            entidad.setEstado_paleta(4);
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            

             if(clsGestor.actualizarMovimientosPaleta(entidad))
            {
                objSession.setObjPaleta(new entPaleta());
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession); 
                sesion.setMaxInactiveInterval(-1);
                out.print(1);
            }
            else
                out.print(0);
           
        }

}%>  
                                                                        
                                                                       
                                                                            