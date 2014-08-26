 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entRecepcion"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
if(objSession.getObjRecepcion()!=null)   
    out.print("<script type='text/javascript'>getRecepcion(0);</script>");
else
{  
    
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
List<entRecepcion> list=clsGestor.ListarRecepcion(false);
if(list!=null)
{%>
<div id="frame">
 <button class="btn btn-invert" onclick="getRecepcion(0)" type="button">Agregar Recepcion</button>
<div class="row-fluid">
    
<div class="span12">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>D. LLegada</th>
                    <th>Chofer</th>
                    <th>N° Guia</th>
                    <th>Placa</th>
                    <th>Modelo</th>
                    <th>Precinto</th>
                    <th>F. Recepcción</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entRecepcion entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_recepcion()%></td>
            <td><%=entidad.getObjDireccionLlegada().getNombre()%></td>
            <td><%=entidad.getObjChofer().getNombre()%></td>
            <td><%=entidad.getNum_guia()%></td>
            <td><%=entidad.getPlaca()%></td>
            <td><%=entidad.getModelo()%></td>
            <td><%=entidad.getPrecinto()%></td>
            <td><%=fecha.format(entidad.getFecha_recepcion())%></td>
            <td>
                 <%
                   if(entidad.getEstado()==1)
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Inactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="getRecepcion(<%=entidad.getId_recepcion()%>)" class="comp_edit btn btn-primary btn-mini">Editar</a>
            </td>
        </tr>


    <%
    }
    %>
     </tbody>
    </table>
</div>
</div>
<script type="text/javascript">
$(function () { 

   $('#lista').dataTable({
       "sDom": "<'row'<'span2'><'span2'f>r>t<'row'<'span2'i><'span2'>S>",
        "sScrollY": "320px",
        "bDestroy": true,
        "bDeferRender": true
    }); 
 
});

</script>

<%}
}}%>  
                                                                        
                                                                       
                                                                            