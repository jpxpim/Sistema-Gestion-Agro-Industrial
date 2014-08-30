 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entChofer"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entChofer> list=clsGestor.ListarChofer(false);
if(list!=null)
{%>
<div id="tablaChofer">
<table id="listaChofer" class="table table-striped location_table">
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
    for(entChofer entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_chofer()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getBrevete()%></td>
             <td><%=entidad.getObjTransportista().getRazon_social()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_chofer()%>,'<%=entidad.getNombre()%>','<%=entidad.getNombre()%>','<%=entidad.getNombre()%>','<%=entidad.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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

   $('#listaChofer').dataTable({
                                           "sDom": "<'row'<'span3'><'span3'f>r>t<'row'<'span3'i><'span3'>S>",
                                            "sScrollY": "200px",
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            