<%@page import="Entidades.entDistrito"%>
<%@page import="Entidades.entProvincia"%>
<%@page import="Entidades.entDepartamento"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbDistrito" name="cbDistrito" title="Por favor selecione un Distrito!" required>
   <option value="">Selecione una Opción</option>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
if(request.getParameter("id") != null && request.getParameter("id") != "")
{   
    List<entDistrito> list=clsGestor.listarDistritoXProvincia(Integer.parseInt(request.getParameter("id")));
    if(list!=null)
        for(entDistrito entidad : list)
            out.print("<option value='"+entidad.getId_istrito()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>