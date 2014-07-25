 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="Entidades.entUsuario"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
List<entUsuario> list=clsGestor.ListarUsuario(false);
BASE64Encoder e = new BASE64Encoder();
if(list!=null)
{%>
<table id="tabla" class="table table-bordered table-striped table_vam">
    <thead>
            <tr>
                    <th>Imagen</th>
                    <th>Id</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Usuario</th>
                    <th>Código ERP</th>
                    <th>Telefono</th>
                    <th>Celular</th>
                    <th>E-Mail</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead>   
    <%
    for(entUsuario entidad : list)
    {
    %>

    <tbody>                                                                                
        <tr>
            <td style="width:100px">
               <img  style="height:90px;width:90px" class="fileupload-preview thumbnail" src="data:image/png;base64,<%=e.encodeBuffer(entidad.getFoto())%>">
            </td>
            <td><%=entidad.getId_usuario()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getApellido()%></td>
            <td><%=entidad.getLogin()%></td>
            <td><%=entidad.getCodigo_erp()%></td>
            <td><%=entidad.getTelefono()%></td>
            <td><%=entidad.getCelular()%></td>
            <td><%=entidad.getEmail()%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Desactivado</span>");
                %>


            </td>
            <td>
                <a href='javascript:void(0)' onclick='edit_form(<%=entidad.getId_usuario()%>,"<%=entidad.getNombre()%>","<%=entidad.getApellido()%>","<%=entidad.getEmail()%>","<%=entidad.getTelefono()%>","<%=entidad.getCelular()%>","<%=fecha.format(entidad.getFecha_nacimiento())%>","<%=entidad.getLogin()%>","<%=entidad.getCodigo_erp()%>","<%=entidad.getUsuario_responsable()%>","<%=entidad.getContrasena()%>","<%=entidad.getEstado()%>")' class="comp_edit btn btn-primary btn-mini">Editar</a>

            </td>
        </tr>

    </tbody>


    <%
    }
    %>
    </table>

<%} %>  
                                                                        
                                                                       
                                                                            