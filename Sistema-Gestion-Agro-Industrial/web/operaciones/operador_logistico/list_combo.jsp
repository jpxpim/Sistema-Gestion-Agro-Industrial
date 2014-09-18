<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entOperadorLogistico"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbOperadorLogistico" name="cbOperadorLogistico" title="Por favor selecione un Operador Logistico!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entOperadorLogistico> list=clsGestor.ListarOperadorLogistico(true);
    if(list!=null)

        for(entOperadorLogistico entidad : list)
            out.print("<option value='"+entidad.getId_operador_logistico()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>