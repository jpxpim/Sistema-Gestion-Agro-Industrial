 <%@page import="Entidades.entParihuela"%>
<%@page import="Entidades.entJaba"%>
<%@page import="Entidades.entLote"%>
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

    
SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
List<entRecepcion> list=clsGestor.ListarRecepcion(false);
if(list!=null)
{%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
                            <div class="span12">
                                    <div class="row-fluid">
                                            <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                                 <div class="input-prepend">
                                                                                        <label>Lote</label>

                                                                                                <span class='label label-info span9'><h4 id='Lote'>Selecione una Opcción</h4></span>
                                                                                                <span class="add-on">
                                                                                                    <a data-toggle="modal" data-backdrop="static" href="#ModalLote"><i class="splashy-zoom"></i></a>
                                                                                                </span>   
                                                                                                <input type="text" id="cbLote"  name="cbLote" />
                                                                                    </div>  
                                                                                    <div class="input-prepend">
                                                                                      <label>Jabas</label>
                                                                                        <select id="cbJaba" name="cbJaba" title="Por favor selecione un Jaba!" required>
                                                                                             <option value="">Selecione una Opción</option>
                                                                                             <% 
                                                                                              List<entJaba> listJaba=clsGestor.ListarJaba(true);
                                                                                              if(listJaba!=null)
                                                                                                  for(entJaba entidad : listJaba)
                                                                                                      out.print("<option value='"+entidad.getId_jaba()+"'>"+entidad.getNombre()+"</option>");
                                                                                             %>
                                                                                         </select>
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                     <label>Paraihuela</label>
                                                                                    <select id="cbParihuela" name="cbParihuela" title="Por favor selecione una Paraihuela!" required>
                                                                                        <option value="">Selecione una Opción</option>
                                                                                        <% 
                                                                                         List<entParihuela> listParihuela=clsGestor.ListarParihuela(true);
                                                                                         if(listParihuela!=null)
                                                                                             for(entParihuela entidad : listParihuela)
                                                                                                 out.print("<option value='"+entidad.getId_parihuela()+"'>"+entidad.getNombre()+"</option>");
                                                                                        %>
                                                                                    </select>
                                                                                    </div>                                                                                    
                                                                                </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                                              <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                            
                                                                                    <div class="input-prepend">
                                                                                    <label>Número de Jabas</label>
                                                                                    <input type="text" class="span10" id="txtNJabas" name="txtNJabas" />
                                                                                    </div>
                                                                                    <br><br>
                                                                                    <div class="input-prepend">
                                                                                    <label>Peso Bruto</label>
                                                                                    <input type="text" class="span10" id="txtPBruto"  name="txtPBruto" />
                                                                                     
                                                                                     </div> 
                                                                                     <br>
                                                                                   
                                                                               
                                                                            </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                                              <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                            <div class="formSep">
                                                                                     <div class="input-prepend">
                                                                                    <label>Racimo</label>
                                                                                    <label class="radio inline">
                                                                                    <input type="radio" value="1"  id="rbRacimo" name="rbRacimo" />
                                                                                        Es Racimo
                                                                                    </label>
                                                                                    <label class="radio inline">
                                                                                            <input type="radio" value="0" id="rbRacimo" name="rbRacimo" />
                                                                                            No es Racimo
                                                                                    </label>
                                                                                     </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Campo</label>
                                                                                    <label class="radio inline">
                                                                                    <input type="radio" value="1"  id="rbCampo" name="rbCampo" />
                                                                                        Es Campo
                                                                                    </label>
                                                                                    <label class="radio inline">
                                                                                            <input type="radio" value="0" id="rbCampo" name="rbCampo" />
                                                                                            No es Campo
                                                                                    </label>
                                                                                     </div>
                                                                                <input type="hidden" id="IdDescarte"  name="IdDescarte" value="0" />

                                                                            </div>
                                                                            <button class="btn btn-invert" type="submit">Grabar</button>

                                                                            <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
                                                                          </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                                    </div>
                        </div>
              </form>
 </div>
 

<div class="row-fluid">
    <div class="span12">
         <div id="tabla"> </div>
    </div>
</div>
                                                                                    
                                                                                    
    <!-- Modal Lote -->	
                <div class="modal hide fade" id="ModalLote"  style="width: 50%;">
                    
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h3>Buscar Lote</h3>
                    </div>
                    <div class="modal-body">
                       <table id="tablaLote" class="table table-striped location_table">
                            <thead>
                                    <tr>
                                            <th>Nombre</th>
                                            <th>Cod. Control</th>
                                            <th>Centro de Costo</th>
                                            <th>Productor</th>
                                            <th>Tipo Cultivo</th>
                                            <th> Edad Cultivo</th>
                                            <th>Variedad</th>
                                            <th>Acciones</th>
                                    </tr>
                            </thead> 
                           <tbody>    
                            <%
                            List<entLote> listLote=clsGestor.ListarLote(false);
                            if(list!=null)
                            for(entLote entidad : listLote)
                            {
                            %>
                                                                                                        
                            <tr>
                                <td><%=entidad.getNombre()%></td>
                                <td><%=entidad.getCodigo_control()%></td>
                                <td><%=entidad.getCentro_costo()%></td>
                                <td><%=entidad.getObjProductor().getNombre()%></td>
                                <td><%=entidad.getObjTipoCultivo().getNombre()%></td>
                                <td><%=entidad.getObjEdadCultivo().getNombre()%></td>
                                <td><%=entidad.getObjVariedad().getNombre()%></td>
                                <td>
                                    <a href="javascript:void(0)" data-dismiss="modal" onclick="selectLote(<%=entidad.getId_lote()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Selecionar</a>

                                </td>
                            </tr>                                                       
                            <%
                            }
                            %>
                            </tbody>
                        </table>
            
                    </div>
                    <div class="modal-footer">
                        <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
                    </div>
                </div>     
<script type="text/javascript">
function selectLote(id,nombre) {
   $('#Lote').html("<h4 id='Lote'>"+nombre+"</h4>");                                           
   $('#cbLote').val(id);
};
function tabla()
{
     $.ajax({
        url: 'operaciones/producto_terminado/list_tabla.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
$(function () { 
    
$( "#cbLote" ).hide();
$('#tablaLote').dataTable({
   "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",

    "bDestroy": true,
    "bDeferRender": true
});

$('#reg_form').validate({
lang: 'es',
onkeyup: false,
errorClass: 'error',
validClass: 'valid',
ignore: ".ignore",
    submitHandler: function() {       
               $("#abrirCarga").click();
            var url = "operaciones/producto_terminado/insert.jsp"; 

            $.ajax({
                   type: "POST",
                   url: url,
                   data: $("#reg_form").serialize(), 
                   success: function(data)
                   {
                       if(data==-1)
                         $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                        else if(data==0)
                        {
                            tabla();
                            clear_form();
                           $.sticky("Se Actualizo Correctamente.", {autoclose : 5000, position: "top-center" });

                       }
                        else if(data>0)
                        {
                           tabla();
                           clear_form();
                           $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  

                        }
                         $("#cerrarCarga").trigger("click");
                   }
                 });    
    },
rules: {
        txtNJabas: { required: true, number: true },
        txtPBruto: { required: true, number: true },
        rbRacimo: { required: true },
        rbCampo: { required: true },
        cbLote: { required: true }
},
highlight: function(element) {
        $(element).closest('div').addClass("f_error");
},
unhighlight: function(element) {
        $(element).closest('div').removeClass("f_error");
},
errorPlacement: function(error, element) {
        $(element).closest('div').append(error);
}
});



});
var comboIdJaba=0
var comboIdParihuela=0;
function clear_form() {
    
    if(comboIdJaba>0)
        $("#cbJaba option[value='"+comboIdJaba+"']").remove();
    $("select#cbJaba").val(0); 
    
    if(comboIdParihuela>0)
        $("#cbParihuela option[value='"+comboIdParihuela+"']").remove();
    $("select#cbParihuela").val(0); 
    
    $('input:radio[name=rbCampo]').attr('checked',false);
    $('input:radio[name=rbRacimo]').attr('checked',false);
    $('#txtNJabas').val("");
    $('#txtCodigo').val("");
    $('#txtPBruto').val("");

    $("#IdDescarte").val("0");  
    $('#cbLote').val("");
    $('#Lote').html("<h4 id='Lote'>Selecione una Opcción</h4>");

};
function edit_form(id,idJaba,nJaba,idParihuela,nParihuela,idLote,nLote,nJabas,pBruto,campo,racimo) {
    if(comboIdJaba>0)
       $("#cbJaba option[value='"+comboIdJaba+"']").remove();
    if(comboIdParihuela>0)
       $("#cbParihuela option[value='"+comboIdParihuela+"']").remove();
   
    $('#txtNJabas').val(nJabas);
    $('#txtPBruto').val(pBruto);
    $('#IdDescarte').val(id);
     $('#Lote').html("<h4 id='Lote'>"+nLote+"</h4>");
     $('#cbLote').val(idLote);
    if(campo.toLowerCase()=="true")
     $('input:radio[name=rbCampo]')[0].checked = true;
    else
      $('input:radio[name=rbCampo]')[1].checked = true;
  
    if(racimo.toLowerCase()=="true")
     $('input:radio[name=rbRacimo]')[0].checked = true;
    else
      $('input:radio[name=rbRacimo]')[1].checked = true;


    if(buscaComboJaba(idJaba))
       $("select#cbJaba").val(idJaba); 
    else
    {
        comboIdJaba=idJaba;
        $("#cbJaba").append('<option value='+idJaba+'>'+nJaba+'</option>');
        $("select#cbJaba").val(idJaba); 
    }
    if(buscaComboParihuela(idParihuela))
       $("select#cbParihuela").val(idParihuela); 
    else
    {
        comboIdParihuela=idParihuela;
        $("#cbParihuela").append('<option value='+idParihuela+'>'+nParihuela+'</option>');
        $("select#cbParihuela").val(idParihuela); 
    }
};
function buscaComboJaba(valor) {
var estado=false;
$("#cbJaba option").each(function(){
    if($(this).attr('value')==valor)
    {
        estado=true;
    }

 });
 return estado;
};
function buscaComboParihuela(valor) {
   var estado=false;
    $("#cbParihuela option").each(function(){
        if($(this).attr('value')==valor)
        {
            estado=true;
        }

     });
     return estado;
};
tabla();

</script>
  </div>
<%}
}}%>  
                                                                        
                                                                       
                                                                            