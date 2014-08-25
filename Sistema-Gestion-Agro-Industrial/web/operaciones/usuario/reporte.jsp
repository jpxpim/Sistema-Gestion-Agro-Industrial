<%@page import="java.util.Date"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entUsuario"%>
<%@page import="Entidades.entSesion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    SimpleDateFormat e=new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat fecha=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");

List<entUsuario> list=clsGestor.ListarUsuario(false);
if(list!=null)
{%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Usuario "+e.format(new Date())+".xls\"");%>
<center><h1>REPORTE USUARIOS </h1></center>
<table border="1">
    
    <tr>
        <td>
            <center> <strong>Id</strong> </center>
        </td>
         <td>
             <center> <strong>Nombre</strong> </center>
        </td>
         <td>
             <center> <strong>Apellidos</strong> </center>
        </td>
         <td>
             <center> <strong>Usuario</strong> </center>
        </td>
        <td>
             <center> <strong>Codigo ERP</strong> </center>
        </td>
        <td>
             <center> <strong>Telefono</strong> </center>
        </td>
                 <td>
             <center> <strong>Celular</strong> </center>
        </td>
        <td>
             <center> <strong>e-mail</strong> </center>
        </td>
         <td>
             <center> <strong>Fecha Registro</strong> </center>
        </td>
         <td>
        <center> <strong>Estado</strong> </center>
        </td>
    </tr>
    <%
         
        
     
         for(entUsuario entidad : list)
        {
        %>
       
             <tr>
        <td><%=entidad.getId_usuario()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getApellido()%></td>
             <td><%=entidad.getLogin()%></td>
             <td><%=entidad.getCodigo_erp()%></td>
             <td><%=entidad.getTelefono() %></td>
             <td><%=entidad.getCelular() %></td>
             <td><%=entidad.getEmail() %></td>
             <td><%=e.format(entidad.getFecha_modificacion())%></td>
            <td>
                 <%
                   if(entidad.getEstado())
                   out.print("Activado");
                   else
                       out.print("Desactivado");
                %>


            </td>
        </tr>
        <%        
        }
       %>
        
        </table>
<%out.print(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre()+" "+fecha.format(new Date())); %>
<%} }%>  
           