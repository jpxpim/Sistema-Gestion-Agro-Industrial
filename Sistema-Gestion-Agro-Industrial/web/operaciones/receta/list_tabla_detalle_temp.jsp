 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
List<entVivero> list=clsGestor.ListarVivero(false);
if(list!=null)
{%>
<div id="detalle">
<table class="table table-striped table-bordered table-condensed">
 <thead>
      <tr>
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
     <tr>
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
 </tbody>    

</table>
</div>

<%} }%>  
                                                                        
                                                                       
                                                                            