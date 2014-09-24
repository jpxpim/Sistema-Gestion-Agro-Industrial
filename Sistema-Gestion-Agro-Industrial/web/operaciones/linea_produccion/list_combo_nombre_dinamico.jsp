<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entLineaProduccion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>


<%entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{ 
if(request.getParameter("nombre") != null && request.getParameter("nombre") != "") 
{
%>
<select id="cb<%=request.getParameter("nombre")%>" name="cb<%=request.getParameter("nombre")%>" title="Por favor selecione una Linea de Produccion!" required>
   <option value="">Selecione una Opción</option>
<%
  
    List<entLineaProduccion> list=clsGestor.ListarLineaProduccion(true,true);
    if(list!=null)
        for(entLineaProduccion entidad : list)
              out.print("<option value='"+entidad.getId_linea_produccion()+"'>"+entidad.getNombre()+"</option>");
 %>
</select>
 
<%
}}
%>