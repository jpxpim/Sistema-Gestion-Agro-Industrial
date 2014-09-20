 <%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entCalibre"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entCalibre> list=clsGestor.ListarCalibre(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>                    
                    <th>Codigo Control</th>
                    <th>Cultivo</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
     <tbody>     
    <%
    for(entCalibre entidad : list)
    {
    %>
                                                               
        <tr>
            <td><%=entidad.getId_calibre()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getCodigo_control()%></td>
            <td><%=entidad.getObjCultivo().getNombre()%></td>
            <td>
                 <%
                   if(entidad.isEstado())
                   out.print(" <span class='label label-success'>Activo</span>");
                   else
                       out.print(" <span class='label label-important'>Inactivo</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_calibre()%>,'<%=entidad.getNombre()%>','<%=entidad.getCodigo_control()%>',<%=entidad.getObjCultivo().getId_cultivo()%>,'<%=entidad.getObjCultivo().getNombre()%>','<%=entidad.isEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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

<%} }%>  
                                                                        
                                                                       
                                                                            