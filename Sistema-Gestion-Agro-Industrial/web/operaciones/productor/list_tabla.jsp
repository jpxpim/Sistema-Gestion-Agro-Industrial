 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entProductor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
List<entProductor> list=clsGestor.ListarProductor(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Codigo ERP</th>
                    <th>Codigo Control</th>
                    <th>Responsable</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
     <tbody>    
    <%
    for(entProductor entidad : list)
    {
    %>

                                                                               
        <tr>
            <td><%=entidad.getId_productor()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getCodigo_erp()%></td>
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
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_productor()%>,'<%=entidad.getNombre()%>','<%=entidad.getCodigo_erp()%>','<%=entidad.getEstado()%>','<%=entidad.getCodigo_control()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                                                        
                                                                       
                                                                            