<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entVariedad"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbVariedad" name="cbVariedad" title="Por favor selecione una Variedad!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entVariedad> list=clsGestor.ListarVariedad(true);
    if(list!=null)

        for(entVariedad entidad : list)
            out.print("<option value='"+entidad.getId_variedad()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>