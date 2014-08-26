<%@page import="Entidades.entLote"%>
<%@page import="Entidades.entParihuela"%>
<%@page import="Entidades.entCategoria"%>
<%@page import="Entidades.entJaba"%>
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
    double tara1=0;
    double tara2=0;
    double pesoBruto=0;
if(request.getParameter("posicion") != null && request.getParameter("posicion") != "" )
{
List<entJaba> listJaba=objSession.getObjRecepcion().getListaJaba();
List<entCategoria> listCategoria=objSession.getObjRecepcion().getListaCategoria();
List<entParihuela> listParihuela=objSession.getObjRecepcion().getListaParihuela();

int pos = Integer.parseInt(request.getParameter("posicion"))-1;    
%>
<div id="frameDetalle">


    
			
<form  method="get" id="reg_form_tabla">   
    
<table id="lista" class="table table-bordered table-striped table_vam">
<thead>
<tr>
        <th>N°</th>
        <th>LOTE</th>
        <th>CATEGORIA</th>
        <th>JABA</th>
        <th>N° JABAS</th>
        <th>TARA 1</th>
        <th>PARIHUELA</th>
        <th>TARA 2</th>        
        <th>PESO BRUTO</th>    
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
<td>
    <select id="cbLote" name="cbLote" style="width: 70px;" title="Por favor selecione una Lote!" required>
    <option value=""></option>

    <%  
    List<entLote> listLote=clsGestor.ListarLote(true);
    if(listLote!=null)

    for(entLote entidad : listLote)
        if(entidad.getId_lote()==objSession.getObjRecepcion().getLista().get(i).getObjLote().getId_lote())
        out.print("<option value='"+entidad.getId_lote()+"' selected>"+entidad.getCodigo_control()+"</option>");
        else
            out.print("<option value='"+entidad.getId_lote()+"'>"+entidad.getCodigo_control()+"</option>");
    %>
    </select>

</td>
<td>
    <select id="cbCategoria" name="cbCategoria" class="span10" title="Por favor selecione una Categoria!" required>
    <option value="">Selecione una Opción</option>

    <%  
    
    if(listCategoria!=null)

    for(entCategoria entidad : listCategoria)
         if(entidad.getId_categoria()==objSession.getObjRecepcion().getLista().get(i).getObjCategoria().getId_categoria())
        out.print("<option value='"+entidad.getId_categoria()+"' selected>"+entidad.getNombre()+"</option>");
        else
              out.print("<option value='"+entidad.getId_categoria()+"'>"+entidad.getNombre()+"</option>");
    %>
    </select>
</td>
<td>
    <select id="cbJaba" name="cbJaba" class="span10" title="Por favor selecione una Jaba!" required>
    <option value="">Selecione una Opción</option>

    <%  
    
    if(listJaba!=null)

    for(entJaba entidad : listJaba)
         if(entidad.getId_jaba()==objSession.getObjRecepcion().getLista().get(i).getObjJaba().getId_jaba())
            out.print("<option value='"+entidad.getId_jaba()+"'selected>"+entidad.getNombre()+"</option>");
            else
            out.print("<option value='"+entidad.getId_jaba()+"'>"+entidad.getNombre()+"</option>");
    %>
    </select>
</td>
<td><input type="text" style="width:40px;"  id="txtNJabas" name="txtNJabas" value="<%=objSession.getObjRecepcion().getLista().get(i).getNum_jabas()%>" /></td>
<td></td>
<td>
    <select id="cbParihuela" name="cbParihuela" class="span10" title="Por favor selecione una Parihuela!" required>
    <option value="">Selecione una Opción</option>

    <%  
    
    if(listParihuela!=null)

    for(entParihuela entidad : listParihuela)
        if(entidad.getId_parihuela()==objSession.getObjRecepcion().getLista().get(i).getObjParihuela().getId_parihuela())
        out.print("<option value='"+entidad.getId_parihuela()+"' selected>"+entidad.getNombre()+"</option>");
        else
            out.print("<option value='"+entidad.getId_parihuela()+"'>"+entidad.getNombre()+"</option>");
    %>
    </select>
</td>
<td></td>
<td><input type="text" style="width:60px;"  id="txtPBruto" name="txtPBruto" value="<%=objSession.getObjRecepcion().getLista().get(i).getPeso_bruto()%>" /></td>
<td></td>
<td>

<button class="comp_edit btn btn-primary btn-mini" type="submit">Grabar</button><br><br>

<button class="comp_edit btn btn-success btn-mini" onclick="tabla(0)" type="button">Cancelar</button>
</td>

</tr>
<%
}else
{
tara1=objSession.getObjRecepcion().getLista().get(i).getNum_jabas()*objSession.getObjRecepcion().getLista().get(i).getObjJaba().getPeso();
tara2=objSession.getObjRecepcion().getLista().get(i).getObjParihuela().getPeso();
pesoBruto=objSession.getObjRecepcion().getLista().get(i).getPeso_bruto()-tara1-tara2;
%> 

<tr>
<td><%=(i+1)%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjLote().getNombre()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjCategoria().getNombre()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjJaba().getNombre()%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getNum_jabas()%></td>
<td><%=Operaciones.Redondear(tara1, 2)%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getObjParihuela().getId_parihuela()%></td>
<td><%=Operaciones.Redondear(tara2, 2)%></td>
<td><%=objSession.getObjRecepcion().getLista().get(i).getPeso_bruto()%></td>
<td><%=Operaciones.Redondear(pesoBruto, 2)%></td>
<td>
<button class="comp_edit btn btn-warning btn-mini" onclick="tabla(<%=(i+1)%>)" type="button">Editar</button>
</td>

</tr> 
<%
}

}
if(pos==-1){
%>  
    
    
<tr>
<td></td>
<td>
    <select id="cbLote" name="cbLote" style="width: 70px;" title="Por favor selecione una Lote!" required>
    <option value=""></option>

    <%  
    List<entLote> listLote=clsGestor.ListarLote(true);
    if(listLote!=null)

    for(entLote entidad : listLote)
        out.print("<option value='"+entidad.getId_lote()+"'>"+entidad.getCodigo_control()+"</option>");
    %>
    </select>

</td>
<td>
    <select id="cbCategoria" name="cbCategoria" class="span10" title="Por favor selecione una Categoria!" required>
    <option value="">Selecione una Opción</option>

    <%  
    
    if(listCategoria!=null)

    for(entCategoria entidad : listCategoria)
        out.print("<option value='"+entidad.getId_categoria()+"'>"+entidad.getNombre()+"</option>");
    %>
    </select>
</td>
<td>
    <select id="cbJaba" name="cbJaba" class="span10" title="Por favor selecione una Jaba!" required>
    <option value="">Selecione una Opción</option>

    <%  
    
    if(listJaba!=null)

    for(entJaba entidad : listJaba)
        out.print("<option value='"+entidad.getId_jaba()+"'>"+entidad.getNombre()+"</option>");
    %>
    </select>
</td>
<td><input type="text" style="width:40px;"  id="txtNJabas" name="txtNJabas" /></td>
<td></td>
<td>
    <select id="cbParihuela" name="cbParihuela" class="span10" title="Por favor selecione una Parihuela!" required>
    <option value="">Selecione una Opción</option>

    <%  
    
    if(listParihuela!=null)

    for(entParihuela entidad : listParihuela)
        out.print("<option value='"+entidad.getId_parihuela()+"'>"+entidad.getNombre()+"</option>");
    %>
    </select>
</td>
<td></td>
<td><input type="text" style="width:60px;"  id="txtPBruto" name="txtPBruto" /></td>
<td></td>
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
<input type="hidden" id="txtNLote"  name="txtNLote" />
</form>





</div>

    
<script type="text/javascript">
$(function () { 
  $("#cbLote").chosen({
				allow_single_deselect: true
			});
  $('#reg_form_tabla').validate({
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
        highlight: function(element) {
                $(element).closest('div').addClass("f_error");
        },
        unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
        },
        submitHandler: function() {      
            
            if($("#cbLote :selected").text()=="")
                $.sticky("Por favor selecione una Lote!", {autoclose : 5000, position: "top-center", type: "st-error" });
            else
            {
                $('#txtNLote').val($("#cbLote :selected").text());
                var url = "operaciones/recepcion/add_list_tabla_temp.jsp"; 

                $.ajax({
                       type: "POST",
                       url: url,
                       data: $("#reg_form_tabla").serialize(), 
                       success: function()
                       {
                           tabla(0);
                       }
                     }); 
            }
           
               
        },
    rules: {
            txtNJabas: { required: true, number: true },
            txtPBruto: { required: true, number: true }

    },
    invalidHandler: function(form, validator) {
    $.sticky("Hay algunos errores. Por favor corrijalos e intente de nuevo.", {autoclose : 5000, position: "top-right", type: "st-error" });
},
errorPlacement: function(error, element) {
    // Set positioning based on the elements position in the form
    var elem = $(element);

    // Check we have a valid error message
    if(!error.is(':empty')) {
            if( (elem.is(':checkbox')) || (elem.is(':radio')) ) {
                    // Apply the tooltip only if it isn't valid
                    elem.filter(':not(.valid)').parent('label').parent('div').find('.error_placement').qtip({
                            overwrite: false,
                            content: error,
                            position: {
                                    my: 'left bottom',
                                    at: 'center right',
                                    viewport: $(window),
                                    adjust: {
                                            x: 6
                                    }
                            },
                            show: {
                                    event: false,
                                    ready: true
                            },
                            hide: false,
                            style: {
                                    classes: 'ui-tooltip-red ui-tooltip-rounded' // Make it red... the classic error colour!
                            }
                    })
                    // If we have a tooltip on this element already, just update its content
                    .qtip('option', 'content.text', error);
            } else {
                    // Apply the tooltip only if it isn't valid
                    elem.filter(':not(.valid)').qtip({
                            overwrite: false,
                            content: error,
                            position: {
                                    my: 'bottom left',
                                    at: 'top right',
                                    viewport: $(window),
adjust: { x: -8, y: 6 }
                            },
                            show: {
                                    event: false,
                                    ready: true
                            },
                            hide: false,
                            style: {
                                    classes: 'ui-tooltip-red ui-tooltip-rounded' // Make it red... the classic error colour!
                            }
                    })
                    // If we have a tooltip on this element already, just update its content
                    .qtip('option', 'content.text', error);
            };

    }
    // If the error is empty, remove the qTip
    else {
            if( (elem.is(':checkbox')) || (elem.is(':radio')) ) {
                    elem.parent('label').parent('div').find('.error_placement').qtip('destroy');
            } else {
                    elem.qtip('destroy');
            }
    }
},
success: $.noop // Odd workaround for errorPlacement not firing!
});
                       
});
</script>

<%}}%>  
           