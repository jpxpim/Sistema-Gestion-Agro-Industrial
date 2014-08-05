<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entEdadCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbEdadCultivo" name="cbEdadCultivo" title="Por favor selecione una Edad Cultivo!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entEdadCultivo> list=clsGestor.ListarEdadCultivo(true);
    if(list!=null)

        for(entEdadCultivo entidad : list)
            out.print("<option value='"+entidad.getId_edad_cultivo()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>