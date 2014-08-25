<%@page import="Entidades.entLote"%>
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

List<entLote> list=clsGestor.ListarLote(false);
if(list!=null)
{%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Lote "+e.format(new Date())+".xls\"");%>
<center><h1>REPORTE LOTE </h1></center>
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
             <center> <strong>N° Hectareas</strong> </center>
        </td>
                 <td>
             <center> <strong>Centro de Costo</strong> </center>
        </td>
                 <td>
             <center> <strong>Año de Siembra</strong> </center>
        </td>
                 <td>
             <center> <strong>Productor</strong> </center>
        </td>
        <td>
             <center> <strong>Sub Sector</strong> </center>
        </td>
         <td>
             <center> <strong>Tipo Cultivo</strong> </center>
        </td>
          <td>
             <center> <strong>Edad Cultivo</strong> </center>
        </td>
           <td>
             <center> <strong>Variedad</strong> </center>
        </td>
         <td>
             <center> <strong>Fecha Registro</strong> </center>
        </td>
         <td>
        <center> <strong>Estado</strong> </center>
        </td>
    </tr>
    <%
         
        
     
         for(entLote entidad : list)
        {
        %>
       
             <tr>
        <td><%=entidad.getId_lote()%></td>
            <td><%=entidad.getNombre()%></td>            
             <td><%=entidad.getCodigo_control()%></td>
             <td><%=entidad.getHectareas()%></td>
             <td><%=entidad.getCentro_costo()%></td>
             <td><%=entidad.getAnio_siembra()%></td>
             <td><%=entidad.getObjProductor().getNombre()%></td>
             <td><%=entidad.getObjSubSector().getNombre() %></td>
             <td><%=entidad.getObjTipoCultivo().getNombre()%></td>
             <td><%=entidad.getObjEdadCultivo().getNombre()%></td>
             <td><%=entidad.getObjVariedad().getNombre()%></td>
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
           