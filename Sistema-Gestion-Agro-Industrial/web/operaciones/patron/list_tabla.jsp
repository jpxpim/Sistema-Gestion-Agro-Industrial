 <%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entPatron"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
 entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
List<entPatron> list=clsGestor.ListarPatron(false);
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
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>  
     <tbody>      
    <%
    for(entPatron entidad : list)
    {
    %>

                                                                             
        <tr>
            <td><%=entidad.getId_patron()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
            <td><%=entidad.getCodigo_control()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_patron()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getEstado()%>','<%=entidad.getCodigo_control()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                            "sScrollY": "210px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%}} %>  
                                                                        
                                                                       
                                                                            