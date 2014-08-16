 <%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
List<entEvaluador> list=clsGestor.ListarEvaluador(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Codigo ERP</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
     <tbody>       
    <%
    for(entEvaluador entidad : list)
    {
    %>

                                                                            
        <tr>
            <td><%=entidad.getId_evaluador()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getApellido()%></td>
            <td><%=entidad.getCodigo_erp()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_evaluador()%>,'<%=entidad.getNombre()%>','<%=entidad.getApellido()%>','<%=entidad.getCodigo_erp()%>','<%=entidad.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                           "sDom": "<'row'<'span2'><'span2'f>r>t<'row'<'span2'i><'span2'>S>",
                                            "sScrollY": "200px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>
<%} }%>  
                                                                        
                                                                       
                                                                            