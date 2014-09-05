<%@page import="Entidades.entDetalleCargaTunel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%
    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    
    objSession.getObjCargaTunel().setListaDetalleCargaTunel(new ArrayList<entDetalleCargaTunel>());                      
    HttpSession sesion = request.getSession();
    sesion.setAttribute("SessionUsuario", objSession); 
    sesion.setMaxInactiveInterval(-1);
    out.print(1);
            
}
%>  
                                                                        
                                                                       
                                                                            