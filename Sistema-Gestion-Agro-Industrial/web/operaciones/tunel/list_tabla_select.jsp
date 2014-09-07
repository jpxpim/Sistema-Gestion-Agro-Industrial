 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entTunel"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
if(request.getParameter("estado") != null && request.getParameter("estado") != ""){
List<entTunel> list=clsGestor.ListarTunel(true,Integer.parseInt(request.getParameter("estado")));
if(list!=null)
{%>
<div id="tablaTunel">
 <table id="list" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Pos X</th>
                            <th>Pos Y</th>
                            <th>Pos H</th>                     
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
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectTunel(<%=entidad.getId_tunel()%>,'<%=entidad.getNombre()%>',<%=((entidad.getPos_y()*entidad.getPos_x())*entidad.getPos_h())%>)" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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

    $('#list').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 

});
</script>

<%}else
    out.print("No se enontraron datos.");
}else
    out.print("No se enontraron datos.");}%>  
                                                                        
                                                                       
                                                                            