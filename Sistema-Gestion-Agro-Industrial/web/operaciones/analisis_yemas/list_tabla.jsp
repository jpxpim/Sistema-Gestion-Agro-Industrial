 <%@page import="Entidades.entAnalisisYemas"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCampania"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
List<entAnalisisYemas> list=clsGestor.ListarAnalisisYemas(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>N. Lote</th>
                    <th>N. Campañia</th>
                    <th>N. Evaluador</th>
                    <th>Feminelas</th>
                    <th>Fertilidad</th>
                    <th>F. Muestra</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
     <tbody>    
    <%
    for(entAnalisisYemas entidad : list)
    {
    %>

                                                                               
        <tr>
            <td><%=entidad.getId_analisis_yemas()%></td>
            <td><%=entidad.getObjCampaniaLote().getObjLote().getNombre()%></td>
            <td><%=entidad.getObjCampaniaLote().getObjCampania().getNombre()%></td>
            <td><%=entidad.getObjEvaluador().getNombre()%> <%=entidad.getObjEvaluador().getApellido()%></td>
            <td><%=entidad.getFeminelas()%></td>
            <td><%=entidad.getFertilidad()%></td>
            <td><%=fecha.format(entidad.getFecha_muestra())%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_analisis_yemas()%>
                    ,<%=entidad.getObjEvaluador().getId_evaluador()%>
                    ,<%=entidad.getObjCampaniaLote().getId_campania_lote()%>
                    ,'<%=entidad.getObjEvaluador().getNombre()%> <%=entidad.getObjEvaluador().getApellido()%>'
                    ,'<%=entidad.getObjEvaluador().getCodigo_erp()%>'
                    ,'<%=entidad.getObjCampaniaLote().getObjLote().getNombre()%> - <%=entidad.getObjCampaniaLote().getObjCampania().getNombre()%>'
                    ,<%=entidad.getFeminelas()%>
                    ,<%=entidad.getFertilidad()%>
                    ,'<%=fecha.format(entidad.getFecha_muestra())%>'
                    ,'<%=entidad.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>
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
                                           "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
                                            "sScrollY": "200px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            