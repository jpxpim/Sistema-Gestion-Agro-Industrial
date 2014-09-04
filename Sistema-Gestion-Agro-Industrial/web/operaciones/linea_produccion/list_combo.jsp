<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entLineaProduccion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbLineaProduccion" name="cbLineaProduccion" title="Por favor selecione un LineaProduccion!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entLineaProduccion> list=clsGestor.ListarLineaProduccion(true);
    if(list!=null)

        for(entLineaProduccion entidad : list)
            out.print("<option value='"+entidad.getId_linea_produccion()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>