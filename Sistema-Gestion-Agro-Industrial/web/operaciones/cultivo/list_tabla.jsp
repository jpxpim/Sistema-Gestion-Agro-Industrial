 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCultivo"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
List<entCultivo> list=clsGestor.ListarCultivo(false);
if(list!=null)
{%>
<table id="tabla" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Codigo Control</th>
                    <th>Responsable</th>
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
            <td><%=entidad.getCodigo_control()%></td>
            <td><%=entidad.getUsuario_responsable()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_cultivo()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getEstado()%>','<%=entidad.getCodigo_control()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

            </td>
        </tr>

    </tbody>


    <%
    }
    %>
    </table>
<%} }%>  
                                                                        
                                                                       
                                                                            