<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entLineaNaviera"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbLineaNaviera" name="cbLineaNaviera" title="Por favor selecione una Via de Embarque!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entLineaNaviera> list=clsGestor.ListarLineaNaviera(true);
    if(list!=null)

        for(entLineaNaviera entidad : list)
            out.print("<option value='"+entidad.getId_linea_naviera()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>