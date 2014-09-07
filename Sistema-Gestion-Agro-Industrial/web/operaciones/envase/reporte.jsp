<%@page import="Entidades.entEnvase"%>
<%@page import="java.util.Date"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSesion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    SimpleDateFormat e=new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat fecha=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");

List<entEnvase> list=clsGestor.ListarEnvase(false);
if(list!=null)
{%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Envase "+e.format(new Date())+".xls\"");%>
<center><h1>REPORTE ENVASE </h1></center>
<table border="1">
    
    <tr>
        <td>
            <center> <strong>Id</strong> </center>
        </td>
         <td>
             <center> <strong>Nombre</strong> </center>
        </td>
         <td>
             <center> <strong>Codigo de Control</strong> </center>
        </td>
         <td>
             <center> <strong>Peso</strong> </center>
        </td>
        <td>
             <center> <strong>Peso de Carga</strong> </center>
        </td>
        <td>
             <center> <strong>Cajas por Paleta</strong> </center>
        </td>
        <td>
             <center> <strong>Receta</strong> </center>
        </td>
         <td>
             <center> <strong>Fecha Registro</strong> </center>
        </td>
         <td>
        <center> <strong>Estado</strong> </center>
        </td>
    </tr>
    <%
         
        
     
         for(entEnvase entidad : list)
        {
        %>
       
             <tr>
        <td><%=entidad.getId_envase() %></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getCodigo_control() %></td>
             <td><%=entidad.getPeso()%></td>
             <td><%=entidad.getPeso_carga() %></td>
             <td><%=entidad.getCant_cajas_paleta() %></td>
             <td><%=entidad.getObjReceta().getNombre() %></td>
             <td><%=e.format(entidad.getFecha_modificacion())%></td>
            <td>
                 <%
                   if(entidad.isEstado())
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
           