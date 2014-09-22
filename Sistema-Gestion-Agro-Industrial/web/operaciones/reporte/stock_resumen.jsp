 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entReporte"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
if(request.getParameter("posicion") != null && request.getParameter("posicion") != "" &&
                request.getParameter("estado") != null && request.getParameter("estado") != "" )
{
List<entReporte> list=clsGestor.listarStockResumenReporte(Integer.parseInt(request.getParameter("posicion")),Integer.parseInt(request.getParameter("estado")));
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Cliente</th>
                    <th>Variedad</th>
                    <th>Envase</th>
                    <th>Peso</th>
                    <th>Categoria</th>
                    <th>Calibre</th>
                    <th>Cajas</th>
                    <th>Paletas</th>
                    
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entReporte entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getParametro_1()%></td>
            <td><%=entidad.getParametro_2()%></td>
            <td><%=entidad.getParametro_3()%></td>
            <td><%=entidad.getParametro_4()%></td>
            <td><%=entidad.getParametro_5()%></td>
            <td><%=entidad.getParametro_6()%></td>
            <td><%=entidad.getParametro_7()%></td>
            <td><%=entidad.getParametro_8()%></td>            
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
                                                                        
                                                                       
                                                                            