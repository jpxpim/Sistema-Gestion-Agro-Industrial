<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entTunel"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbTunel" name="cbTunel" title="Por favor selecione un Tunel!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entTunel> list=clsGestor.ListarTunel(true);
    if(list!=null)

        for(entTunel entidad : list)
            out.print("<option value='"+entidad.getId_tunel()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>