<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entProductoTerminadoTemp"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
    if(request.getParameter("codigo") != null && request.getParameter("codigo") != "")           
    {
        SimpleDateFormat fecha=new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat hora=new SimpleDateFormat("HH:mm a");
        entProductoTerminadoTemp entidad = clsGestor.buscarOrigenProductoTerminado(request.getParameter("codigo"));
        if(entidad!=null)
        {
        %>
<div id="origen">

<table  class="table table-striped location_table">
    <thead>
        <%if(entidad.getFecha_produccion_paleta()!=null){%>        
        <tr>
            <th colspan="2">Código Paleta</th>
            <td colspan="2"><%=entidad.getCodigo_control_paleta()%></td>
        </tr>
        <tr>
            <th>Fecha Creación Paleta</th>
            <td><%=fecha.format(entidad.getFecha_produccion_paleta())%></td>
            <th>Hora Creación Paleta</th>
           <td><%=hora.format(entidad.getFecha_produccion_paleta())%></td>
        </tr>
        <%}%>
        <tr>
            <th>Id Producto</th>
            <td><%=entidad.getId_producto_terminado()%></td>
            <th>Código Control</th>
            <td><%=entidad.getCodigo_control()%></td>
        </tr>
        <tr>
            <th>DNI Embalador</th>
            <td><%=entidad.getEmbalador()%></td>
            <th>DNI Seleccionador</th>
            <td><%=entidad.getSeleccionador()%></td>
        </tr>
        <tr>
            <th>Cod. Lote</th>
            <td><%=entidad.getCodigo_control_lote()%></td>
            <th>N.Linea P.</th>
            <td><%=entidad.getNombre_linea_produccion()%></td>
        </tr>
         <tr>
            <th>Envase</th>
            <td><%=entidad.getNombre_envase()%></td>
            <th>Calibre</th>
            <td><%=entidad.getNombre_calibre()%></td>
        </tr>
        <tr>
            <th>Fecha Producción</th>
            <td><%=fecha.format(entidad.getFecha_produccion())%></td>
            <th>Hora Producción</th>
           <td><%=hora.format(entidad.getFecha_produccion())%></td>
        </tr>
      
    </thead> 
</table> 
    
</div>

<%}else{
%>
<div id="origen">
    <center><h3>Producto no encontrado</h3></center>
</div>

<%}}}%>