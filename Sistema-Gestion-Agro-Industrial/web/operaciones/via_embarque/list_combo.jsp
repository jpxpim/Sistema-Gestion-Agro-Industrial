<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entViaEmbarque"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<select id="cbViaEmbarque" name="cbViaEmbarque" title="Por favor selecione una Via de Embarque!" required>
   <option value="">Selecione una Opción</option>

<%
    entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    List<entViaEmbarque> list=clsGestor.ListarViaEmbarque(true);
    if(list!=null)

        for(entViaEmbarque entidad : list)
            out.print("<option value='"+entidad.getId_via_embarque()+"'>"+entidad.getNombre()+"</option>");
}
 %>
</select>