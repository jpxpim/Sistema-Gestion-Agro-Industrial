 <%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCultivo"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat hora=new SimpleDateFormat("h:mm a");
List<entCultivo> list=clsGestor.ListarCultivo(false);
if(list!=null)
{%>
<table id="tabla" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Responsable</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
    <%
    for(entCultivo entidad : list)
    {
    %>

    <tbody>                                                                                
        <tr>
            <td><%=entidad.getId_cultivo()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
            <td><%=entidad.getUsuario_responsable()%></td>
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
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_cultivo()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getUsuario_responsable()%>','<%=entidad.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

            </td>
        </tr>

    </tbody>


    <%
    }
    %>
    </table>

<%} %>  
                                                                        
                                                                       
                                                                            