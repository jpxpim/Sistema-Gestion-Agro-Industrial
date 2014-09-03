<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entReceta"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbReceta" name="cbReceta" title="Por favor selecione una Receta!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entReceta> list=clsGestor.ListarReceta(true);
    if(list!=null)

        for(entReceta entidad : list)
            out.print("<option value='"+entidad.getId_receta()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>