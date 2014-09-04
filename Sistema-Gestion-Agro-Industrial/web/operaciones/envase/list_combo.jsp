<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entEnvase"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbEnvase" name="cbEnvase" title="Por favor selecione un Envase!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entEnvase> list=clsGestor.ListarEnvase(true);
    if(list!=null)

        for(entEnvase entidad : list)
            out.print("<option value='"+entidad.getId_envase()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>