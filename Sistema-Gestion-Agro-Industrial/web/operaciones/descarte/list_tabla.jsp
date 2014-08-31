 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entDescarte"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
SimpleDateFormat  fecha=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");
List<entDescarte> list=clsGestor.ListarPorDiaRecepcionDescarte(objSession.getObjDiaRecepcion().getId_dia_recepcion());
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>N Jaba</th>
                    <th>P Jaba</th>
                    <th>N Jabas</th>
                    <th>N Parihuela</th>
                    <th>P Parihuela</th>
                    <th>N Lote</th>
                    <th>Cod Lote</th>                   
                    <th>Peso Bruto</th>
                    <th>Racimo</th>                   
                    <th>Campo</th>
                    <th>F Registro</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entDescarte entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_descarte()%></td>
            <td><%=entidad.getObjJaba().getNombre()%></td>
            <td><%=entidad.getObjJaba().getPeso()%></td>
             <td><%=entidad.getNum_jabas()%></td>
             <td><%=entidad.getObjParihuela().getNombre()%></td>
            <td><%=entidad.getObjParihuela().getPeso()%></td>
             <td><%=entidad.getObjLote().getNombre()%></td>
              <td><%=entidad.getObjLote().getCodigo_control()%></td>
             <td><%=entidad.getPeso_bruto()%></td>
            <td>
                 <%
                   if(entidad.getIs_racimo())                       
                   out.print(" <span class='label label-success'>Si</span>");
                   else
                       out.print(" <span class='label label-important'>No</span>");
                %>


            </td>
            <td>
                 <%
                   if(entidad.getIs_campo())
                   out.print(" <span class='label label-success'>Si</span>");
                   else
                       out.print(" <span class='label label-important'>No</span>");
                %>


            </td>
            <td><%=fecha.format(entidad.getFecha_registro())%></td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_descarte()%>,<%=entidad.getObjJaba().getId_jaba()%>,'<%=entidad.getObjJaba().getNombre()%>',<%=entidad.getObjParihuela().getId_parihuela()%>,'<%=entidad.getObjParihuela().getNombre()%>',<%=entidad.getObjLote().getId_lote()%>,'<%=entidad.getObjLote().getNombre()%>',<%=entidad.getNum_jabas()%>,<%=entidad.getPeso_bruto()%>,'<%=entidad.getIs_campo()%>','<%=entidad.getIs_racimo()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
                                                                        
                                                                       
                                                                            