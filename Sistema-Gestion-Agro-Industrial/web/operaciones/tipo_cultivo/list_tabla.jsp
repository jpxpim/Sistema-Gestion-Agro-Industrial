 <%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entTipoCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{ 
List<entTipoCultivo> list=clsGestor.ListarTipoCultivo(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Codigo Control</th>
                    <th>Responsable</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
    <tbody>  
    <%
    for(entTipoCultivo entidad : list)
    {
    %>

                                                                                  
        <tr>
            <td><%=entidad.getId_tipo_cultivo()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
            <td><%=entidad.getCodigo_control()%></td>
            <td><%=entidad.getUsuario_responsable()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_tipo_cultivo()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getCodigo_control()%>','<%=entidad.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                           "sDom": "<'row'<'span3'><'span3'f>r>t<'row'<'span3'i><'span3'>S>",
                                            "sScrollY": "200px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            