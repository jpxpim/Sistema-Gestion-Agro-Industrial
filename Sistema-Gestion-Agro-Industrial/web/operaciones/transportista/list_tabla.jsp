 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entTransportista"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entTransportista> list=clsGestor.ListarTransportista(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Raz�n Social</th>
                    <th>RUC</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entTransportista entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_transportista()%></td>
            <td><%=entidad.getRazon_social()%></td>
            <td><%=entidad.getRuc()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activo</span>");
                   else
                       out.print(" <span class='label label-important'>Inactivo</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_transportista()%>,'<%=entidad.getRazon_social()%>','<%=entidad.getRuc()%>','<%=entidad.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                            "sScrollY": "150px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            