 <%@page import="Entidades.entLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
List<entLote> list=clsGestor.ListarLote(false);
if(list!=null)
{%>
<table id="tabla" class="table table-striped table-condensed">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>C. Control</th>
                    <th>Nº Hectareas</th>
                    <th>Centro de Costo</th>
                    <th>Año de Siembra</th>
                    <th>Productor</th>
                    <th>Sub Sector</th>
                    <th>Tipo Cultivo</th>
                    <th>Edad Cultivo</th>
                    <th>Variedad</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
    <%
    for(entLote entidad : list)
    {
    %>

    <tbody>                                                                                
        <tr>
            <td><%=entidad.getId_lote()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getCodigo_control()%></td>
            <td><%=entidad.getHectareas()%></td>
            <td><%=entidad.getCentro_costo()%></td>
            <td><%=entidad.getAnio_siembra()%></td>
            <td><%=entidad.getObjProductor().getNombre()%></td>
            <td><%=entidad.getObjSubSector().getNombre()%></td>
            <td><%=entidad.getObjTipoCultivo().getNombre()%></td>
            <td><%=entidad.getObjEdadCultivo().getNombre()%></td>
            <td><%=entidad.getObjVariedad().getNombre()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="edit_form(<%=entidad.getId_lote()%>,'<%=entidad.getNombre()%>','<%=entidad.getDescripcion()%>','<%=entidad.getCodigo_control()%>','<%=entidad.getHectareas()%>','<%=entidad.getCentro_costo()%>','<%=entidad.getAnio_siembra()%>','<%=entidad.getEstado()%>',<%=entidad.getObjProductor().getId_productor()%>,'<%=entidad.getObjProductor().getNombre()%>',<%=entidad.getObjPatron().getId_patron()%>,'<%=entidad.getObjPatron().getNombre()%>',<%=entidad.getObjVivero().getId_vivero()%>,'<%=entidad.getObjVivero().getNombre()%>',<%=entidad.getObjSubSector().getId_sub_sector()%>,'<%=entidad.getObjSubSector().getNombre()%>',<%=entidad.getObjTipoCultivo().getId_tipo_cultivo()%>,'<%=entidad.getObjTipoCultivo().getNombre()%>',<%=entidad.getObjEdadCultivo().getId_edad_cultivo()%>,'<%=entidad.getObjEdadCultivo().getNombre()%>',<%=entidad.getObjVariedad().getId_variedad()%>,'<%=entidad.getObjVariedad().getNombre()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>

            </td>
        </tr>

    </tbody>


    <%
    }
    %>
    </table>
<%} }%>  
                                                                        
                                                                       
                                                                            