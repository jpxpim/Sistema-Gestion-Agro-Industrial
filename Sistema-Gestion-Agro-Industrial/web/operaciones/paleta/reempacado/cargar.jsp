
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    SimpleDateFormat fecha=new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat hora=new SimpleDateFormat("HH:mm a");
    if(request.getParameter("codigo") != null && request.getParameter("codigo") != "")
    {
        
        objSession.setObjPaleta(clsGestor.buscarxCodigoPaleta(request.getParameter("codigo")));   
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);
    }
       if(objSession.getObjPaleta()!=null)
{%>
<div id="tabla">
<table  class="table table-striped location_table">
    <thead> 
           <tr>
            <th>Código Paleta</th>
            <td><%=objSession.getObjPaleta().getCodigo_control()%></td>
            <th>Estado</th>           
             <td>
               <%  if(objSession.getObjPaleta().getEstado_paleta()==1)
                     out.print("Completo");
                else if(objSession.getObjPaleta().getEstado_paleta()==2)
                     out.print("Incompleto");
                else if(objSession.getObjPaleta().getEstado_paleta()==3)
                     out.print("Baja de Frio");
                else if(objSession.getObjPaleta().getEstado_paleta()==4)
                     out.print("Cortesia");
                else if(objSession.getObjPaleta().getEstado_paleta()==5)
                     out.print("Repaletizado");
                else if(objSession.getObjPaleta().getEstado_paleta()==6)
                     out.print("Reempacado");%>
            </td>
        </tr>
        <tr>
            <th>Fecha Creación Paleta</th>
            <td><%=fecha.format(objSession.getObjPaleta().getFecha_produccion())%></td>
            <th>Hora Creación Paleta</th>
           <td><%=hora.format(objSession.getObjPaleta().getFecha_produccion())%></td>
        </tr>
    </thead> 
</table>         
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                <td>N°</td>
                <th>Código Control</th>
                <th>Código Lote</th>
                <th>Calibre</th>
                <th>Variedad</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    for(int i=0;i<objSession.getObjPaleta().getListaDetallePaleta().size();i++)
    {
    %>
                                                                   
        <tr>
            <td><%=(i+1)%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getCodigo_control()%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getObjLote().getCodigo_control()%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getObjCalibre().getNombre()%></td>
            <td><%=objSession.getObjPaleta().getListaDetallePaleta().get(i).getObjProductoTerminado().getObjLote().getObjVariedad().getNombre()%></td>
        </tr>


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
                                            "sScrollY": "280px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
   size='<%=objSession.getObjPaleta().getListaDetallePaleta().size()%>';
 
});
</script>

<%

    }
}
%>                                                                        