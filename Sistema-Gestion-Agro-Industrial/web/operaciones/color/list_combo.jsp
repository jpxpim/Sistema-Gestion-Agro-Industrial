<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entColor"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbColor" name="cbColor" title="Por favor selecione un Sub Color!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entColor> list=clsGestor.ListarColor(true);
    if(list!=null)

        for(entColor entidad : list)
            out.print("<option value='"+entidad.getId_color()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>