 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entReporte"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
if(request.getParameter("operacion") != null && request.getParameter("operacion") != "")
{
    String inicio="";
    String fin="";
    if(request.getParameter("inicio") != null && request.getParameter("inicio") != "")
        inicio=request.getParameter("inicio");
    if(request.getParameter("fin") != null && request.getParameter("fin") != "")
        inicio=request.getParameter("fin");
List<entReporte> list=clsGestor.listarCajasEmbaladasXTrabajadorReporte(Integer.parseInt(request.getParameter("operacion")),inicio,fin);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Envase</th>
                    <th>Cajas Embaladas</th>
                    
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
                                                                        
                                                                       
                                                                            