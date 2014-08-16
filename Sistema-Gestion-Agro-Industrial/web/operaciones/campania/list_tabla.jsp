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
List<entCampania> list=clsGestor.ListarCampania(false);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>  
    <tbody>    
    <%
    for(entCampania entidad : list)
    {
    %>

                                                                                
        <tr>
            <td><%=entidad.getId_campania()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=fecha.format(entidad.getFecha_inicio())%></td>
            <td><%=fecha.format(entidad.getFecha_fin())%></td>
            <td>
                 <%
                   if(entidad.isEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_campania()%>,'<%=entidad.getNombre()%>','<%=fecha.format(entidad.getFecha_inicio())%>','<%=fecha.format(entidad.getFecha_fin())%>','<%=entidad.isEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                           "sDom": "<'row'<'span2'><'span2'f>r>t<'row'<'span2'i><'span2'>S>",
                                            "sScrollY": "200px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>
<%} }%>  
                                                                        
                                                                       
                                                                            