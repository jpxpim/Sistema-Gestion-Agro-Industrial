
<%@page import="Entidades.entDetalleReceta"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entDetalleReceta> list = objSession.getListDetalleReceta();
if(list!=null)
{%>
<div id="detalle">
<table class="table table-striped table-bordered table-condensed">
 <thead>
      <tr>
        <th>
           ID 
        </th>
        <th>
           Nombre 
        </th>
        <th>
           Cantida
        </th>
        <th>
           Acción
        </th>
    </tr>
 </thead>
 <tbody>
 <%for(int i=0;i<list.size();i++)
 if(!list.get(i).isEliminado_session()){%>
     <tr>
         <td>
             <%=list.get(i).getObjInsumo().getId_insumo()%>
         </td>
         <td>
            <%=list.get(i).getObjInsumo().getNombre()%>
         </td>
         <td>
             <%=list.get(i).getCantidad()%>
         </td>
          <td>
            <center> <a href="javascript:void(0)" onclick="quitarItem(<%=i%>)" class="comp_edit btn btn-inverse btn-mini">Quitar</a></center>
         </td>
     </tr>            
 <%}%>
 </tbody>    

</table>
</div>
 <script>
     $('#txtTabla').val('<%=list.size()%>');
 </script>
<%} }%>  
                                                                        
                                                                       
                                                                            