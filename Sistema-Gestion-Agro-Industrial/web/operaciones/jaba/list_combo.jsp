<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entJaba"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbJaba" name="cbJaba" title="Por favor selecione un Jaba!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entJaba> list=clsGestor.ListarJaba(true);
    if(list!=null)

        for(entJaba entidad : list)
            out.print("<option value='"+entidad.getId_jaba()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>