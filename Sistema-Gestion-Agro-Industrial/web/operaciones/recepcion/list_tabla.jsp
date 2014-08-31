 <%@page import="Entidades.entDiaRecepcion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entRecepcion"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
if(!objSession.isDia_recepcion())
{
    SimpleDateFormat e=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");
    if(objSession.getObjDiaRecepcion()==null)
    {
        objSession.setObjDiaRecepcion(clsGestor.verificarDiaRecepcion());
    }

     if(objSession.getObjDiaRecepcion()==null)
     {
          if(objSession.getObjUsuario().isEs_administrador()||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_1() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_2() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_3())
         {
%>
<div id="frame">
    <div class="row-fluid">
        <div class="span4">
            <h3 class="heading">Iniciar Nuevo día de Producción</h3>  
            <center>
                <button class="btn btn-invert" onclick="SetRecepccion(0)" type="button">Iniciar</button>
            </center>
        </div>
    </div>
</div>
<% 
         }
         else
         {
%>

<div id="frame">
    <div class="row-fluid">
        <div class="6">
            <h3 class="heading">Espere que el ecargado inicie un nuevo día de Producción</h3> 
        </div>
    </div>
</div>
<%      
         }
  
     }
     else
     {
        if(objSession.getObjUsuario().isEs_administrador()||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_1() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_2() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_3())
         {
%>
<div id="frame">
    <div class="row-fluid">
        <div class="span5">
            <h3 class="heading">Día de Producción Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
            <center>
                <button class="btn btn-invert" onclick="SetRecepccion(1)" type="button">Cerrar</button>
                <button class="btn btn-invert" onclick="SetRecepccion(2)" type="button">Continuar</button>
            </center>
        </div>
    </div>
</div>
<% 
         }
         else
         {
%>
<div id="frame">
    <div class="row-fluid">
        <div class="span5">
            <h3 class="heading">Día de Producción Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
            <center>
                <button class="btn btn-invert" onclick="SetRecepccion(2)" type="button">Continuar</button>
            </center>
        </div>
    </div>
</div>
<%      
         }
     }
 
    
    
//final
}
else
{
if(objSession.getObjRecepcion()!=null)   
    out.print("<script type='text/javascript'>getRecepcion(0);</script>");
else
{  
    
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
List<entRecepcion> list=clsGestor.ListarPorDiaRecepcionRecepcion(objSession.getObjDiaRecepcion().getId_dia_recepcion());
if(list!=null)
{%>
<div id="frame">
 <button class="btn btn-invert" onclick="getRecepcion(0)" type="button">Agregar Recepcion</button>
<div class="row-fluid">
    
<div class="span12">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>D. LLegada</th>
                    <th>Chofer</th>
                    <th>N° Guia</th>
                    <th>Placa</th>
                    <th>Modelo</th>
                    <th>Precinto</th>
                    <th>F. Recepcción</th>
                    <th>Estado</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entRecepcion entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_recepcion()%></td>
            <td><%=entidad.getObjDireccionLlegada().getNombre()%></td>
            <td><%=entidad.getObjChofer().getNombre()%></td>
            <td><%=entidad.getNum_guia()%></td>
            <td><%=entidad.getPlaca()%></td>
            <td><%=entidad.getModelo()%></td>
            <td><%=entidad.getPrecinto()%></td>
            <td><%=fecha.format(entidad.getFecha_recepcion())%></td>
            <td>
                 <%
                   if(entidad.getEstado()==1)
                   out.print(" <span class='label label-success'>Activado</span>");
                   else
                       out.print(" <span class='label label-important'>Inactivado</span>");
                %>


            </td>
            <td>
                <a href="javascript:void(0)" onclick="getRecepcion(<%=entidad.getId_recepcion()%>)" class="comp_edit btn btn-primary btn-mini">Editar</a>
            </td>
        </tr>


    <%
    }
    %>
     </tbody>
    </table>
</div>
</div>
<script type="text/javascript">

$(function () { 

   $('#lista').dataTable({
       "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
        "sScrollY": "320px",
        "bDestroy": true,
        "bDeferRender": true
    }); 
 
});

</script>

<%}
else{
%>
<div id="frame">
 <button class="btn btn-invert" onclick="getRecepcion(0)" type="button">Agregar Recepcion</button>
</div>
<%
}
}}}%>  
                                                                        
                                                                       
                                                                            