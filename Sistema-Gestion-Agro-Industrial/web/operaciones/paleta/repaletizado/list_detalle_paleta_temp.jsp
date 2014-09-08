 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
   
if(objSession.getObjPaleta()!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                <td>N°</td>
                <th>Código Control</th>
                <th>Código Lote</th>
                <th>Calibre</th>
                <th>Variedad</th>
                <th>Prod/Paleta</th>
                <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(int i=0;i<objSession.getObjPaleta().getListaDetallePaleta().size();i++)
    {
    %>
                                                                   
        <tr>
            <td><%=(i+1)%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getCodigo_control()%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getUsuario_responsable()%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getEmbalador()%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getSeleccionador()%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getId_dia_recepcion()%></td>
            <td>
                   <a href="javascript:void(0)" onclick="removerItem(<%=i%>,'<%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getCodigo_control()%>')" class="comp_edit btn btn-primary btn-mini">Quitar</a>
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
   size='<%=objSession.getObjPaleta().getListaDetallePaleta().size()%>';
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            