<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entVivero"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbVivero" name="cbVivero" title="Por favor selecione un Vivero!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entVivero> list=clsGestor.ListarVivero(true);
    if(list!=null)

        for(entVivero entidad : list)
            out.print("<option value='"+entidad.getId_vivero()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>