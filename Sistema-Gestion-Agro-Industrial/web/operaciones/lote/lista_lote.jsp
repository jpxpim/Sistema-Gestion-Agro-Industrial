 <%@page import="Entidades.entLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
List<entLote> list=clsGestor.ListarLote(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>C. Control</th>
                    <th>Nº Hectareas</th>
                    <th>Centro de Costo</th>
                    <th>Año de Siembra</th>
                    <th>Productor</th>
                    <th>Sub Sector</th>
                    <th>Tipo Cultivo</th>
                    <th>Edad Cultivo</th>
                    <th>Variedad</th>
                    <th>Estado</th>
            </tr>
    </thead>   
     <tbody>   
    <%
    for(entLote entidad : list)
    {
    %>
                                                                                
        <tr>
            <td><%=entidad.getId_lote()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getCodigo_control()%></td>
            <td><%=entidad.getHectareas()%></td>
            <td><%=entidad.getCentro_costo()%></td>
            <td><%=entidad.getAnio_siembra()%></td>
            <td><%=entidad.getObjProductor().getNombre()%></td>
            <td><%=entidad.getObjSubSector().getNombre()%></td>
            <td><%=entidad.getObjTipoCultivo().getNombre()%></td>
            <td><%=entidad.getObjEdadCultivo().getNombre()%></td>
            <td><%=entidad.getObjVariedad().getNombre()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activo</span>");
                   else
                       out.print(" <span class='label label-important'>Inactivo</span>");
                %>


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
                                            "sScrollY": "400px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>
<%} }%>  
                                                                        
                                                                       
                                                                            