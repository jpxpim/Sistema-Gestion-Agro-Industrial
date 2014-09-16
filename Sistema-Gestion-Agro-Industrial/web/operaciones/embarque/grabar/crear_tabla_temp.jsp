 <%@page import="Entidades.entDetalleEmbarque"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entContenedor"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null && objSession.getObjEmbarque()!=null)
 if(request.getParameter("idContenedor") != null && request.getParameter("idContenedor") != "" &&         
    request.getParameter("nContenedor") != null && request.getParameter("nContenedor") != "" &&
    request.getParameter("XContenedor") != null && request.getParameter("XContenedor") != "" &&
    request.getParameter("YContenedor") != null && request.getParameter("YContenedor") != "")   
{
    entContenedor entidad=new entContenedor();
    entidad.setNombre(request.getParameter("nContenedor"));
    entidad.setId_contenedor(Integer.parseInt(request.getParameter("idContenedor")));
    entidad.setPos_x(Integer.parseInt(request.getParameter("XContenedor")));
    entidad.setPos_y(Integer.parseInt(request.getParameter("YContenedor")));
    objSession.getObjEmbarque().setObjContenedor(entidad);
    objSession.getObjEmbarque().setList(new ArrayList<entDetalleEmbarque>());
    
    for(int x=0;x<objSession.getObjEmbarque().getObjContenedor().getPos_x();x++)
     for(int y=0;y<objSession.getObjEmbarque().getObjContenedor().getPos_y();y++)
     {
         entDetalleEmbarque detalle = new entDetalleEmbarque();
         detalle.setObjPaleta(null);
         detalle.setPos_x(x+1);
         detalle.setPos_y(y+1);
         objSession.getObjEmbarque().getList().add(detalle);
     }
    
    HttpSession sesion = request.getSession();
    sesion.setAttribute("SessionUsuario", objSession);
    sesion.setMaxInactiveInterval(-1);
} 
%>  
                                                                        
                                                                       
                