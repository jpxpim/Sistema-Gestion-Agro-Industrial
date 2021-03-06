<%@page import="Entidades.entSubSector"%>
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

List<entSubSector> list=clsGestor.ListarSubSector(false);
if(list!=null)
{%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Sub-Sector "+e.format(new Date())+".xls\"");%>
<center><h1>REPORTE SUB-SECTOR </h1></center>
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
             <center> <strong>Sector</strong> </center>
        </td>
        <td>
             <center> <strong>Grower SENASA</strong> </center>
        </td>
         <td>
             <center> <strong>Fecha Registro</strong> </center>
        </td>
         <td>
        <center> <strong>Estado</strong> </center>
        </td>
    </tr>
    <%
         
        
     
         for(entSubSector entidad : list)
        {
        %>
       
             <tr>
        <td><%=entidad.getId_sub_sector()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getDescripcion()%></td>
             <td><%=entidad.getCodigo_control()%></td>
             <td><%=entidad.getObjSector().getNombre()%></td>
             <td><%=entidad.getGrower_senasa()%></td>
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
           