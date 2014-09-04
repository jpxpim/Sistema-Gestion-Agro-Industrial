 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entProductoTerminado"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
if(request.getParameter("id") != null && request.getParameter("id") != "")
{
    
List<entProductoTerminado> list=clsGestor.ListarProductoTerminado(objSession.getObjDiaRecepcion().getId_dia_recepcion(),Integer.parseInt(request.getParameter("id")));
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                 <th>L.Prod</th>
                    <th>Cod.</th>                   
                    <th>Envase</th>
                    <th>Cat</th>
                    <th>Lote</th>
                    <th>Calibre</th>
                    <th>Color</th>
                    <th>Selec.</th>
                    <th>Empa.</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entProductoTerminado entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getObjLineaProduccion().getNombre()%></td>
             <td><%=entidad.getCodigo_control()%></td>           
            
            <td><%=entidad.getObjEnvase().getNombre()%></td>
            <td><%=entidad.getObjCategoria().getNombre()%></td>
            <td><%=entidad.getObjLote().getCodigo_control()%></td>
            <td><%=entidad.getObjCalibre().getCodigo_control()%></td>
            <td><%=entidad.getObjColor().getCodigo_control()%></td>
            <td><%=entidad.getSeleccionador()%></td>
            <td><%=entidad.getEmbalador()%></td>
           
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_producto_terminado()%>,<%=entidad.getObjLineaProduccion().getId_linea_produccion()%>,'<%=entidad.getObjLineaProduccion().getNombre()%>',<%=entidad.getObjEnvase().getId_envase()%>,'<%=entidad.getObjEnvase().getNombre()%>',<%=entidad.getObjCategoria().getId_categoria()%>,'<%=entidad.getObjCategoria().getNombre()%>',<%=entidad.getObjLote().getId_lote()%>,'<%=entidad.getObjLote().getCodigo_control()%>',<%=entidad.getObjCalibre().getId_calibre()%>,<%=entidad.getObjColor().getId_color()%>,'<%=entidad.getObjCalibre().getCodigo_control()%>-<%=entidad.getObjColor().getCodigo_control()%>','<%=entidad.getSeleccionador()%>','<%=entidad.getEmbalador()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
               "sPaginationType": "bootstrap",
                                            "sScrollY": "380px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }}%>  
                                                                        
                                                                       
                                                                            