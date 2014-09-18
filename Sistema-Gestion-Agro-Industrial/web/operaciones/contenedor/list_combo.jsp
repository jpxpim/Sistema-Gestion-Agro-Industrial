<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entContenedor"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbContenedor" name="cbContenedor" title="Por favor selecione un Contenedor!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entContenedor> list=clsGestor.ListarContenedor(true);
    if(list!=null)

        for(entContenedor entidad : list)
            out.print("<option value='"+entidad.getId_contenedor()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>