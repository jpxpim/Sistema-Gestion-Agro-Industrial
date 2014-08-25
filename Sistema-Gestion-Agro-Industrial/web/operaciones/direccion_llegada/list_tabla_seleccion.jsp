 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entDireccionLlegada"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entDireccionLlegada> list=clsGestor.ListarDireccionLlegada(true);
if(list!=null)
{%>
<div id="tablaDireccion">
<table id="listaDireccionLlegada" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>                    
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entDireccionLlegada entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_dir_llegada()%></td>
            <td><%=entidad.getNombre()%></td>
            <td>
                <a data-dismiss="modal"  href="javascript:void(0)" onclick="seleccionDireccionLlegada(<%=entidad.getId_dir_llegada()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-primary btn-mini">Seleccionar</a>

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

   $('#listaDireccionLlegada').dataTable({
                                           "sDom": "<'row'<'span3'><'span3'f>r>t<'row'<'span3'i><'span3'>S>",
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            