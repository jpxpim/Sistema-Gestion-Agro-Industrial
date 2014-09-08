<%@page import="Entidades.entDetallePaleta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%
    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("pos") != null && request.getParameter("pos") != "")
    {        
        int pos=Integer.parseInt(request.getParameter("pos"));
        if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(pos).getId_det_carga_tunel()>0)
            objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(pos).setEliminado(true);
        else
            objSession.getObjCargaTunel().getListaDetalleCargaTunel().remove(pos);
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);
        
    }
                 
}
%>  
                                                                        
                                                                       
                                                                            