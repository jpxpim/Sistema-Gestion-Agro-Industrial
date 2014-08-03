<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entSector"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbSector" name="cbSector" title="Por favor selecione un Sector!" required>
   <option value="">Selecione una Opción</option>

<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    List<entSector> list=clsGestor.ListarSector(true);
    if(list!=null)

        for(entSector entidad : list)
            out.print("<option value='"+entidad.getId_sector()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>