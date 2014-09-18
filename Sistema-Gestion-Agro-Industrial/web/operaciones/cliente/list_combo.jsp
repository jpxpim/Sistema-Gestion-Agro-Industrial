<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entCliente"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbCliente" name="cbCliente" title="Por favor selecione un Cliente!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entCliente> list=clsGestor.ListarCliente(true);
    if(list!=null)

        for(entCliente entidad : list)
            out.print("<option value='"+entidad.getId_cliente()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>