 <%@page import="Entidades.entSubSector"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat hora=new SimpleDateFormat("h:mm a");
List<entSubSector> list=clsGestor.ListarSubSector(false);
if(list!=null)
{%>
<table id="tabla" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Responsable</th>
                    <th>Sector</th>
                    <th>Grower SENASA</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
    <%
    for(entSubSector entidad : list)
    {
    %>

    <tbody>                                                                                
        <tr>
            <td><%=entidad.getId_sub_sector()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
            <td><%=entidad.getUsuario_responsable()%></td>
             <td><%=entidad.getObjSector().getNombre()%></td>
             <td><%=entidad.getGrower_senasa()%></td>
            <td><%=fecha.format(entidad.getFecha_modificacion())%></td>
            <td><%=hora.format(entidad.getFecha_modificacion())%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_sub_sector()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getUsuario_responsable()%>','<%=entidad.getEstado()%>','<%=entidad.getGrower_senasa()%>',<%=entidad.getObjSector().getId_sector()%>,'<%=entidad.getObjSector().getNombre()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

            </td>
        </tr>

    </tbody>


    <%
    }
    %>
    </table>

<%} %>  
                                                                        
                                                                       
                                                                            