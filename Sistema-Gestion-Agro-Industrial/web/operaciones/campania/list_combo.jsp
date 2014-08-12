<%@page import="Entidades.entCampania"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
 <select id="cbCampania" name="cbCampania" title="Por favor selecione un Campaña!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entCampania> list=clsGestor.ListarCampania(true);
    if(list!=null)

        for(entCampania entidad : list)
            out.print("<option value='"+entidad.getId_campania()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>