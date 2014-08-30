<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entTransportista"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbTransportista" name="cbTransportista" title="Por favor selecione un Transportista!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entTransportista> list=clsGestor.ListarTransportista(true);
    if(list!=null)

        for(entTransportista entidad : list)
            out.print("<option value='"+entidad.getId_transportista()+"'>"+entidad.getRazon_social()+"</option>");
}
 %>
</select>