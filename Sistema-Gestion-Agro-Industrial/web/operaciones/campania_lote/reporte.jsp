<%@page import="Entidades.entCampaniaLote"%>
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

List<entCampaniaLote> list=clsGestor.ListarCampaniaLote();
if(list!=null)
{%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Asignacion Campaña "+e.format(new Date())+".xls\"");%>
<center><h1>REPORTE ASIGNACION CAMPAÑAS </h1></center>
<table border="1">
    
    <tr>
        <td>
            <center> <strong>Id</strong> </center>
        </td>
         <td>
             <center> <strong>N° de Plantas</strong> </center>
        </td>
         <td>
             <center> <strong>Fecha de Poda</strong> </center>
        </td>
         <td>
             <center> <strong>Lote</strong> </center>
        </td>
        
         <td>
             <center> <strong>Campaña</strong> </center>
        </td>
         <td>
             <center> <strong>Fecha Registro</strong> </center>
        </td>
        
    </tr>
    <%
         
        
     
         for(entCampaniaLote entidad : list)
        {
        %>
       
             <tr>
        <td><%=entidad.getId_campania_lote()%></td>
            <td><%=entidad.getNumero_plantas()%></td>
            <td><%=entidad.getFechaPodaFormacion()%></td>
             <td><%=entidad.getObjLote().getNombre() %></td>
             <td><%=entidad.getObjCampania().getNombre() %></td>
             <td><%=e.format(entidad.getFecha_modificacion())%></td>
           
        </tr>
        <%        
        }
       %>
        
        </table>
<%out.print(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre()+" "+fecha.format(new Date())); %>
<%} }%>  
           