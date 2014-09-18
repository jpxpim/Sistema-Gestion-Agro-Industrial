<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entPuerto"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbPuerto" name="cbPuerto" title="Por favor selecione un Puerto!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entPuerto> list=clsGestor.ListarPuerto(true);
    if(list!=null)

        for(entPuerto entidad : list)
            out.print("<option value='"+entidad.getId_puerto()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>