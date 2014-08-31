<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entCategoria"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbCategoria" name="cbCategoria" title="Por favor selecione un Categoria!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entCategoria> list=clsGestor.ListarCategoria(true);
    if(list!=null)

        for(entCategoria entidad : list)
            out.print("<option value='"+entidad.getId_categoria()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>