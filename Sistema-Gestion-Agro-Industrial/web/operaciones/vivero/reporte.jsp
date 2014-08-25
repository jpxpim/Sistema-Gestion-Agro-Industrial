<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%@page import="Entidades.entSesion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entVivero> list=clsGestor.ListarVivero(false);
if(list!=null)
{%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"reporte.xls\"");%>
<center><h1>REPORTE VIVERO </h1></center>
<table border="1">
    
    <tr>
        <td>
            <center> <strong>Id</strong> </center>
        </td>
         <td>
             <center> <strong>Nombre</strong> </center>
        </td>
         <td>
             <center> <strong>Descripcion</strong> </center>
        </td>
         <td>
             <center> <strong>Codigo Control</strong> </center>
        </td>
         <td>
             <center> <strong>Fecha Registro</strong> </center>
        </td>
         <td>
        <center> <strong>Estado</strong> </center>
        </td>
    </tr>
    <%
         SimpleDateFormat e=new SimpleDateFormat("dd/MM/yyyy");
        
     
         for(entVivero entidad : list)
        {
        %>
       
             <tr>
        <td><%=entidad.getId_vivero()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
             <td><%=entidad.getCodigo_control()%></td>
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

<%} }%>  
           