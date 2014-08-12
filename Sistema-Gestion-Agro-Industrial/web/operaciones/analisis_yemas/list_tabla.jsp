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
<table id="tabla" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>N. Lote</th>
                    <th>N. Campañia</th>
                    <th>N. Evaluador</th>
                    <th>Feminelas</th>
                    <th>Fertilidad</th>
                    <th>F. Muestra</th>
                    <th>Feminelas</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
    <%
    for(entAnalisisYemas entidad : list)
    {
    %>

    <tbody>                                                                                
        <tr>
            <td><%=entidad.getId_analisis_yemas()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=fecha.format(entidad.getFecha_inicio())%></td>
            <td><%=fecha.format(entidad.getFecha_fin())%></td>
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
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_campania()%>,'<%=entidad.getNombre()%>','<%=fecha.format(entidad.getFecha_inicio())%>','<%=fecha.format(entidad.getFecha_fin())%>','<%=entidad.isEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

            </td>
        </tr>

    </tbody>


    <%
    }
    %>
    </table>
<%} }%>  
                                                                        
                                                                       
                                                                            