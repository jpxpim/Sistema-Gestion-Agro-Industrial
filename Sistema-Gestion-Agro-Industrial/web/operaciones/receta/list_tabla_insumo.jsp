 <%@page import="Entidades.entInsumo"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entInsumo> list=clsGestor.ListarInsumo();
if(list!=null)
{%>
<div id="insumo">
<table id="listaInsumo" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Codigo ERP</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entInsumo entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_insumo()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getCod_erp()%></td>
            <td>
                <a href="javascript:void(0)" onclick="selecionar(<%=entidad.getId_insumo()%>,'<%=entidad.getNombre()%>','<%=entidad.getCod_erp()%>')" class="comp_edit btn btn-primary btn-mini">Seleccionar</a>

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

   $('#listaInsumo').dataTable({
                                           "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
                                            "sPaginationType": "bootstrap",
                                            "sScrollY": "250px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            