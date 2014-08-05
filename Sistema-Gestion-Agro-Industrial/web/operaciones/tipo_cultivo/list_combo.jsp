<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entTipoCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbTipoCultivo" name="cbTipoCultivo" title="Por favor selecione un Tipo Cultivo!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entTipoCultivo> list=clsGestor.ListarTipoCultivo(true);
    if(list!=null)

        for(entTipoCultivo entidad : list)
            out.print("<option value='"+entidad.getId_tipo_cultivo()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>