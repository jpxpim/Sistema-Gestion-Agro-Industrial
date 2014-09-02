
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
           N 
        </th>
        <th>
           Nombre 
        </th>
        <th>
           Codigo
        </th>
        <th>
           Acción
        </th>
    </tr>
 </thead>
 <tbody>
 <%for(int i=0;i<list.size();i++){%>
     <tr>
         <td>
             asd
         </td>
         <td>
             asd
         </td>
         <td>
             as
         </td>
          <td>
            <center> <a href="javascript:void(0)" onclick="edit_form()" class="comp_edit btn btn-inverse btn-mini">Quitar</a></center>
         </td>
     </tr>            
 <%}%>
 </tbody>    

</table>
</div>

<%} }%>  
                                                                        
                                                                       
                                                                            