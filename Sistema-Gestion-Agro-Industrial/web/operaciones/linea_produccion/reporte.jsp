<%@page import="java.util.Date"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCategoria"%>
<%@page import="Entidades.entSesion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    SimpleDateFormat e=new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat fecha=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");

List<entCategoria> list=clsGestor.ListarCategoria(false);
if(list!=null)
{%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Categoria "+e.format(new Date())+".xls\"");%>
<center><h1>REPORTE CATEGORIA </h1></center>
<table border="1">
    
    <tr>
        <td>
            <center> <strong>Id</strong> </center>
        </td>
         <td>
             <center> <strong>Nombre</strong> </center>
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
         
        
     
         for(entCategoria entidad : list)
        {
        %>
       
             <tr>
        <td><%=entidad.getId_categoria()%></td>
            <td><%=entidad.getNombre()%></td>
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
<%out.print(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre()+" "+fecha.format(new Date())); %>
<%} }%>  
           