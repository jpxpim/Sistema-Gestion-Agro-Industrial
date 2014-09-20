 <%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entEnvase"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entEnvase> list=clsGestor.ListarEnvase(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Cod. Control</th>
                    <th>Peso</th>
                    <th>P. Carga</th>
                    <th>C.T.P.</th>
                    <th>Receta</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
     <tbody>     
    <%
    for(entEnvase entidad : list)
    {
    %>
                                                               
        <tr>
            <td><%=entidad.getId_envase()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getCodigo_control()%></td>
            <td><%=entidad.getPeso()%></td>
            <td><%=entidad.getPeso_carga()%></td>
             <td><%=entidad.getCant_cajas_paleta()%></td>
             <td><%=entidad.getObjReceta().getNombre()%></td>
            <td>
                 <%
                   if(entidad.isEstado())
                   out.print(" <span class='label label-success'>Activo</span>");
                   else
                       out.print(" <span class='label label-important'>Inactivo</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_envase()%>,'<%=entidad.getNombre()%>','<%=entidad.getCodigo_control()%>','<%=entidad.getPeso()%>','<%=entidad.getPeso_carga()%>','<%=entidad.getCant_cajas_paleta()%>',<%=entidad.getObjReceta().getId_receta()%>,'<%=entidad.getObjReceta().getNombre()%>','<%=entidad.isEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

            </td>
        </tr>

    <%
    }
    %>
     </tbody>
    </table>
</div>
<script type="text/javascript">
$(function () { 

   $('#lista').dataTable({
                                           "sPaginationType": "bootstrap",
                                            "sScrollY": "380px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            