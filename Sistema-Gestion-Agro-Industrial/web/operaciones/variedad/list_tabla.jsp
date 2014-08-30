 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVariedad"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entVariedad> list=clsGestor.ListarVariedad(false);
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
                    <th>Cultivo</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>    
    <%
    for(entVariedad entidad : list)
    {
    %>

                                                                               
        <tr>
            <td><%=entidad.getId_variedad()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
             <td><%=entidad.getCodigo_control()%></td>
             <td><%=entidad.getObjCultivo().getNombre()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_variedad()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getEstado()%>',<%=entidad.getObjCultivo().getId_cultivo()%>,'<%=entidad.getObjCultivo().getNombre()%>','<%=entidad.getCodigo_control()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                           "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
                                            "sScrollY": "260px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            