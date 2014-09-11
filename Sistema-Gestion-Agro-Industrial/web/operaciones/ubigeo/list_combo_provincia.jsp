<%@page import="Entidades.entProvincia"%>
<%@page import="Entidades.entDepartamento"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbProvincia" name="cbProvincia" title="Por favor selecione un Provincia!" required>
   <option value="">Selecione una Opción</option>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
if(request.getParameter("id") != null && request.getParameter("id") != "")
{   
    List<entProvincia> list=clsGestor.listarProvinciaXDepartamento(Integer.parseInt(request.getParameter("id")));
    if(list!=null)
        for(entProvincia entidad : list)
            out.print("<option value='"+entidad.getId_provincia()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>