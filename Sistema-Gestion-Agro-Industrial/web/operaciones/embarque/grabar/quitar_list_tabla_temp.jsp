<%@page import="Entidades.entDetalleEmbarque"%>
<%@page import="java.util.Date"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>

<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("pos") != null && request.getParameter("pos") != "") 
    {         
        int pos=Integer.parseInt(request.getParameter("pos"));                
        entDetalleEmbarque entidad =objSession.getObjEmbarque().getList().get(pos);                        
        objSession.getObjEmbarque().getList().remove(pos);                    
        entidad.setObjPaleta(null);
        entidad.setSensor(0); 
        entidad.setThermoregistro("");                
        objSession.getObjEmbarque().getList().add(pos, entidad);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);
    }
}%>  
                                                                        
                                                                       
                                                                            