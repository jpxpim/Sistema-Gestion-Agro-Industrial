<%@page import="Com.Operaciones"%>
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
if(request.getParameter("posicion") != null && request.getParameter("posicion") != "" )
{

int pos = Integer.parseInt(request.getParameter("posicion"))-1;    
%>
<div id="frameDetalle">


    
			
<form  method="get" id="reg_form_tabla">   
<table id="lista" class="table table-bordered table-striped table_vam">
<thead>
<tr>
        <th>N°</th>
        <th>LOTE</th>
        <th>JABA</th>
        <th>PARIHUELA</th>
        <th>CATEGORIA</th>
        <th>N° JABAS</th>
        <th>PESO BRUTO</th>
        <th>TARA</th>
        <th>PESO NETO</th>     
        <th>Acciones</th>

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjRecepcion()!=null)
for(int i=0;i<objSession.getObjRecepcion().getLista().size();i++)
{
if(pos==i)
{
%>    
<tr>
<td><%=(i+1)%></td>
<td><input type="text" style="width:15px;" id="txtIdLote" name="txtIDLote" /></td>
<td><input type="text" style="width:15px;"  id="txtIdJaba" name="txtIdJaba" /></td>
<td><input type="text" style="width:15px;"  id="txtIdParihuela" name="txtIdParihuela" /></td>
<td><input type="text" style="width:15px;"  id="txtIdCategoria" name="txtIdCategoria" /></td>
<td><input type="text" style="width:15px;"  id="txtNJabas" name="txtNJabas" /></td>
<td><input type="text" style="width:15px;"  id="txtPBruto" name="txtPBruto" /></td>
<td><input type="text" style="width:15px;"  id="txtTara" name="txtTara" /></td>
<td><input type="text" style="width:15px;"  id="txtPNeto" name="txtPNeto" /></td>
<td>

<button class="comp_edit btn btn-primary btn-mini" type="submit">Grabar</button><br><br>
<button class="comp_edit btn btn-success btn-mini" onclick="tablaTemp(0)" type="button">Cancelar</button>
</td>

</tr>
<%
}else
{
%> 

<tr>
<td><%=(i+1)%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjLote().getId_lote()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjJaba().getId_jaba()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjParihuela().getId_parihuela()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjCategoria().getId_categoria()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getNum_jabas()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getPeso_bruto()%></td>
<td>tara</td>
<td>peso</td>
<td>
<button class="comp_edit btn btn-warning btn-mini" onclick="tablaTemp(<%=(i+1)%>)" type="button">Editar</button>
</td>

</tr> 
<%
}

}
if(pos==-1){
%>  
    
    
<tr>
<td></td>
<td><input type="text" style="width:15px;" id="txtIdLote" name="txtIDLote" /></td>
<td><input type="text" style="width:15px;"  id="txtIdJaba" name="txtIdJaba" /></td>
<td><input type="text" style="width:15px;"  id="txtIdParihuela" name="txtIdParihuela" /></td>
<td><input type="text" style="width:15px;"  id="txtIdCategoria" name="txtIdCategoria" /></td>
<td><input type="text" style="width:15px;"  id="txtNJabas" name="txtNJabas" /></td>
<td><input type="text" style="width:15px;"  id="txtPBruto" name="txtPBruto" /></td>
<td><input type="text" style="width:15px;"  id="txtTara" name="txtTara" /></td>
<td><input type="text" style="width:15px;"  id="txtPNeto" name="txtPNeto" /></td>
<td>

<button class="comp_edit btn btn-primary btn-mini" type="submit">Grabar</button><br><br>

<button class="comp_edit btn btn-success btn-mini" onclick="tablaTemp(0)" type="button">Cancelar</button>
</td>


</tr>
<%
}
%>


</tbody>

</table>
<input type="hidden" id="posicion"  name="posicion" value="<%=pos%>" />
</form>





</div>

    
<script type="text/javascript">
$(function () { 
  $("#cerrarCarga").trigger("click");
});
</script>

<%}}%>  
           