<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entSubSector"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbSubSector" name="cbSubSector" title="Por favor selecione un Sub Sector!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entSubSector> list=clsGestor.ListarSubSector(true);
    if(list!=null)

        for(entSubSector entidad : list)
            out.print("<option value='"+entidad.getId_sub_sector()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>