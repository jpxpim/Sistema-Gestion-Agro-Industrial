 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    int conEliminados=0;
   SimpleDateFormat fecha=new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat hora=new SimpleDateFormat("HH:mm a"); 
if(objSession.getObjCargaTunel()!=null)
{
%>
<div id="tabla">
     <table class="table table-striped table_vam">
        <thead>
            <tr>
                <th>
                  Temperatura de Carga
                </th>
               <td ><%=objSession.getObjCargaTunel().getTemperatura_carga()%></td>          
               <th>
                    Hora Inicio Carga
                </th>
                <td><%=hora.format(objSession.getObjCargaTunel().getInicio_carga())%></td>
                 <th>
                   Fecha Inicio Carga
                </th>
               <td><%=fecha.format(objSession.getObjCargaTunel().getInicio_carga())%></td>
            </tr>
             <tr>
                 <td ></td>
               <td></td>               
                  <th>
                   Fecha Inicio Carga
                </th>
               <td><%=fecha.format(objSession.getObjCargaTunel().getInicio_carga())%></td>
               <th>
                    Hora Fin Carga
                </th>
                <td><%=hora.format(objSession.getObjCargaTunel().getFin_carga())%></td>
            </tr>
        </thead>
    </table>
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                <td>N°</td>
                <th>Código Control</th>
                <th>Cliente</th>
                <th>Estado</th>
                <th>Localización</th>
                <th>Hora</th>
                <th>Fecha</th>
                <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(int i=0;i<objSession.getObjCargaTunel().getListaDetalleCargaTunel().size();i++)
    {
        if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).isEliminado())
        conEliminados++;
        else{%>                                                             
        <tr>
            <td><%=(i+1)%></td>
            <td><%=objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getCodigo_control()%></td>            
            <td><%=objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getObjCliente().getNombre()%></td>            
            <td>
                <%  if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getEstado_paleta()==1)
                     out.print("Completo");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getEstado_paleta()==2)
                     out.print("Incompleto");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getEstado_paleta()==3)
                     out.print("Baja de Frio");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getEstado_paleta()==4)
                     out.print("Cortesia");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getEstado_paleta()==5)
                     out.print("Repaletizado");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getEstado_paleta()==6)
                     out.print("Reempacado");
                %>
            </td>    
            <td>
                <%  if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getPosicion_paleta()==1)
                     out.print("<span class='label label-success'>Paleteizado</span>");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getPosicion_paleta()==2)
                     out.print("<span class='label label-success'>Tunel</span>");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getPosicion_paleta()==3)
                     out.print("<span class='label label-warning'>Camara</span>");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getPosicion_paleta()==4)
                     out.print("<span class='label label-success'>Exportada</span>");
                else if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getPosicion_paleta()==5)
                     out.print("<span class='label label-important'>Retornada</span>");
                %>
            </td>    
            <td><%=hora.format(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getFecha_produccion())%></td>            
            <td><%=fecha.format(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getFecha_produccion())%></td>
            <td>
               
                   
                
                  <a href="javascript:void(0)" onclick="removerItem(<%=i%>,'<%=objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getCodigo_control()%>')" class="comp_edit btn btn-primary btn-mini">Quitar</a>
            </td>
        </tr>
            <%}%>

    <%
    }
    %>
     </tbody>
    </table>
</div>
<script type="text/javascript">
$(function () { 


   $('#lista').dataTable({
                                           "sPaginationType": "bootstrap",
                                            "sScrollY": "400px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
   size='<%=(objSession.getObjCargaTunel().getListaDetalleCargaTunel().size()-conEliminados)%>';
 
});
</script>

<%} }%>  
                                                                        
                                                                       
                                                                            