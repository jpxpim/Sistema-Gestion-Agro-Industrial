<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbCultivo" name="cbCultivo" title="Por favor selecione un Cultivo!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entCultivo> list=clsGestor.ListarCultivo(true);
    if(list!=null)

        for(entCultivo entidad : list)
            out.print("<option value='"+entidad.getId_cultivo()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>