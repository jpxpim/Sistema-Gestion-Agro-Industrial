<%@page import="Entidades.entCalibre"%>
<%@page import="Com.Operaciones"%>
<%@page import="Entidades.entReporte"%>
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
    

if(request.getParameter("operacion") != null && request.getParameter("operacion") != "")
{
    int operacion=Integer.parseInt(request.getParameter("operacion"));
    String inicio="";
    String fin="";
    String nombre="";
    if(request.getParameter("inicio") != null && request.getParameter("inicio") != "")
        inicio=request.getParameter("inicio");
    if(request.getParameter("fin") != null && request.getParameter("fin") != "")
        fin=request.getParameter("fin");
   if(operacion==1)
        nombre="REPORTE CAJAS SELECIONADAS POR FECHAS DEL "+inicio+" AL "+fin+"";
    else  if(operacion==2)
        nombre="REPORTE CAJAS SELECIONADAS DE ULTIMO DÍA DE RECEPCIÓN CERRADO";
    else  if(operacion==3)
        nombre="REPORTE CAJAS SELECIONADAS DE ULTIMO DÍA DE RECEPCIÓN ABIERTO";
    else  if(operacion==4)
        nombre="REPORTE CAJAS SELECIONADAS DE TODOS LOS DÍAS DE RECEPCIÓN CERRADOS";
    else  if(operacion==5)
        nombre="REPORTE CAJAS SELECIONADAS DE TODOS LOS DÍAS DE RECEPCIÓN";
    
    response.setHeader("Content-Disposition", "attachment; filename=\"REPORTE "+nombre+" "+e.format(new Date())+".xls\"");
    
    
List<entReporte> list=clsGestor.listarCajasSeleccionadasXTrabajadorReporte(operacion,inicio,fin);
if(list!=null)   
{
 out.println("<center><h1>"+nombre+"</h1></center>"); 
%>

<table border="1">
    
    <tr>
                    <td><center><strong>Nombre</strong></center></td>
                    <td><center><strong>Apellidos</strong></center></td>
                    <td><center><strong>Envase</strong></center></td>
                    <td><center><strong>Cajas Seleccionadas</strong></center></td>
                   
    </tr>
    <%                 
    for(entReporte entidad : list)
    {
    %>
        <tr>
            <td><%=entidad.getParametro_1()%></td>
            <td><%=entidad.getParametro_2()%></td>
            <td><%=entidad.getParametro_3()%></td>
            <td><%=entidad.getParametro_4()%></td>          
        </tr>
    <%
    }
    %>
        
        </table>
<%out.print(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre()+" "+fecha.format(new Date())); %>
<%}} }%>  
           