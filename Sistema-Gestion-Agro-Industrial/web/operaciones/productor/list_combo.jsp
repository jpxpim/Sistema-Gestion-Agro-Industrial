<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entProductor"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbProductor" name="cbProductor" title="Por favor selecione un Productor!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entProductor> list=clsGestor.ListarProductor(true);
    if(list!=null)

        for(entProductor entidad : list)
            out.print("<option value='"+entidad.getId_productor()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>