 <%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entSubSector"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entSubSector> list=clsGestor.ListarSubSector(false);
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
                    <th>Sector</th>
                    <th>Grower SENASA</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
     <tbody>     
    <%
    for(entSubSector entidad : list)
    {
    %>
                                                               
        <tr>
            <td><%=entidad.getId_sub_sector()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
            <td><%=entidad.getCodigo_control()%></td>
             <td><%=entidad.getObjSector().getNombre()%></td>
             <td><%=entidad.getGrower_senasa()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activo</span>");
                   else
                       out.print(" <span class='label label-important'>Inactivo</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_sub_sector()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getEstado()%>','<%=entidad.getGrower_senasa()%>',<%=entidad.getObjSector().getId_sector()%>,'<%=entidad.getObjSector().getNombre()%>','<%=entidad.getCodigo_control()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                            "sScrollY": "320px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            