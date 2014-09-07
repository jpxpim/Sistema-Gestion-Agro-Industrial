 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entTunel"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entTunel> list=clsGestor.ListarTunel(false,2);
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Pos X</th>
                    <th>Pos Y</th>
                    <th>Pos H</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entTunel entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_tunel()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
             <td><%=entidad.getPos_x()%></td>
              <td><%=entidad.getPos_y()%></td>
               <td><%=entidad.getPos_h()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_tunel()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>',<%=entidad.getPos_x()%>,<%=entidad.getPos_y()%>,<%=entidad.getPos_h()%>,'<%=entidad.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

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
        "sScrollY": "325px",
        "bDestroy": true,
        "bDeferRender": true
    }); 

});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            