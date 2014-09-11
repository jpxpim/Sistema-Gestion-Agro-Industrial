<%@page import="Entidades.entDepartamento"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbDepartamento" name="cbDepartamento" title="Por favor selecione un Departamento!" required>
   <option value="">Selecione una Opción</option>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entDepartamento> list=clsGestor.listarDepartamento();
    if(list!=null)
        for(entDepartamento entidad : list)
            out.print("<option value='"+entidad.getId_departamento()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>