<%@page import="Entidades.entDetallePaleta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%
    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    
    objSession.getObjPaleta().setListaDetallePaleta(new ArrayList<entDetallePaleta>());                      
    HttpSession sesion = request.getSession();
    sesion.setAttribute("SessionUsuario", objSession); 
    sesion.setMaxInactiveInterval(-1);
    out.print(1);
            
}
%>  
                                                                        
                                                                       
                                                                            