<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entLote"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbLote" name="cbLote" title="Por favor selecione un Lote!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entLote> list=clsGestor.ListarLote(true);
    if(list!=null)

        for(entLote entidad : list)
            out.print("<option value='"+entidad.getId_lote()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>