 <%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
List<entCampaniaLote> list=clsGestor.ListarCampaniaLote();
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Número de Plantas</th>
                    <th>Fecha de Poda</th>
                    <th>Lote</th>
                    <th>Campaña</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
       <tbody>     
    <%
    for(entCampaniaLote entidad : list)
    {
    %>
                                                              
        <tr>
            <td><%=entidad.getId_campania_lote()%></td>
            <td><%=entidad.getNumero_plantas()%></td>
            <td><%=fecha.format(entidad.getFechaPodaFormacion())%></td>
            <td><%=entidad.getObjLote().getNombre()%></td>
            <td><%=entidad.getObjCampania().getNombre()%></td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_campania_lote()%>,'<%=entidad.getNumero_plantas()%>','<%=fecha.format(entidad.getFechaPodaFormacion())%>',<%=entidad.getObjLote().getId_lote()%>,'<%=entidad.getObjLote().getNombre()%>',<%=entidad.getObjCampania().getId_campania()%>,'<%=entidad.getObjCampania().getNombre()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                                                        
                                                                       
                                                                            