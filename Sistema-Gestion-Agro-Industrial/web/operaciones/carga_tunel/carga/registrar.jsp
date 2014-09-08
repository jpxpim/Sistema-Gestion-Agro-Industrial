

<%@page import="Entidades.entPaleta"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entCargaTunel"%>
<%@page import="java.util.Date"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    int size=0;
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

    if(objSession.getObjCargaTunel()==null)
        objSession.setObjCargaTunel(new entCargaTunel());
    else if(objSession.getObjCargaTunel().getId_carga_tunel()>0)        
        objSession.setObjCargaTunel(new entCargaTunel());
    
  SimpleDateFormat e=new SimpleDateFormat("MM-dd-yyyy");  
  String fecha=e.format(new Date());
%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
             <div class="span3">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                           
                                                                            <div class="formSep">
                                                                                     <div class="input-prepend">
                                                                                        <di id='Tunel'>
                                                                                                <blockquote >
                                                                                                    <p>Tunel
                                                                                                          <span class='add-on'>
                                                                                                              <a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a>
                                                                                                          </span> 
                                                                                                    </p> <blockquote><p>Capacidad</p></blockquote>
                                                                                                </blockquote>
                                                                                          </di>
                                                                                        <input type="hidden" id="idTunel"  name="idTunel"/>
                                                                                        <input type="hidden" id="cTunel"  name="cTunel" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                     <label for="txtFechaInicio" class="col-md-2 control-label">Inicio de Carga</label>
                                                                                    <div class="input-group date form_datetime_inicio col-md-5"  data-link-field="txtFechaInicio">
                                                                                        <input class="form-control span10" size="16" type="text" id="textFInicio" name="textFInicio" value="" readonly>
                                                                                        <span class="input-group-addon"></span>
                                                                                                            <span class="input-group-addon add-on"><span class="glyphicon-th splashy-calendar_day_down"></span></span>
                                                                                    </div>
                                                                                                <input type="hidden" id="txtFechaInicio" name="txtFechaInicio" value="" /><br/>
                                                                                    
                                                                                     </div> 
                                                                                    <div class="input-prepend">
                                                                                     <label for="txtFechaFin" class="col-md-2 control-label">Fin de Carga</label>
                                                                                    <div class="input-group date form_datetime_fin col-md-5"  data-link-field="txtFechaFin">
                                                                                        <input class="form-control span10" size="16" type="text" id="textFFin" name="textFFin" value="" readonly>
                                                                                        <span class="input-group-addon"></span>
                                                                                                            <span class="input-group-addon add-on"><span class="glyphicon-th splashy-calendar_day_down"></span></span>
                                                                                    </div>
                                                                                                <input type="hidden" id="txtFechaFin" name="txtFechaFin" value="" /><br/>
                                                                                    
                                                                                     </div> 
                                                                                    
                                                                                    <div class="input-prepend">
                                                                                    <label>Temperatura de Carga</label>
                                                                                    <input type="text" id="txtGrados" name="txtGrados" class="span10" value="18.00"/>

                                                                                   
                                                                                     </div> 
                                                                                    <br>
                                                                                    <div class="input-prepend">
                                                                                    <label>Codigo (13 digitos)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input  type="text" id="txtCodigo" class="span10"  name="txtCodigo" disabled/><span id="validCodigo" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <di id="contador" >digitos = <span class="label label-warning">0</span></di>
                                                                                    </div>                                                                                   

                                                                            </div>
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="grabar_data()" type="button">Grabar</button>
                                                                            
                                                                            <button class="btn btn-invert" onclick="confir_lear_list()" type="button">Limpiar Lista</button>
                                                                          </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                            <div class="span9">
                                        <div id="tabla"> </div>
                                   </div>
              </form>

                                                                                        
 </div>
    
   
 <!-- Modal Tunel -->	
<div class="modal hide fade" id="ModalTunel" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Selecionar Tunel</h3>
    </div>
    <div class="modal-body">
        <div id="tablaTunel"></div>

    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
    </div>
</div>                 



 <form  method="get" id="detalle_form">
    <input type="hidden" id="IdPaleta"  name="IdPaleta"/>
    <input type="hidden" id="Codigo"  name="Codigo"/>
    <input type="hidden" id="FProduccion"  name="FProduccion"/>
    <input type="hidden" id="Estado"  name="Estado"/>
    <input type="hidden" id="Posicicion"  name="Posicicion"/>
    <input type="hidden" id="Cliente"  name="Cliente"/>
</form>                                                                           
<div id="data_paleta"></div>                          
<script type="text/javascript">
var size='0';   

var validGrabaDetalle=true;

var paleta= {
     'entidad': [ 
    <%
    List<entPaleta> listPaleta = clsGestor.ListarPackingPaleta();
    if(listPaleta!=null)
    {
      size=listPaleta.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_paleta': "+listPaleta.get(i).getId_paleta()+",'fecha_produccion': "+listPaleta.get(i).getFecha_produccion().getTime()+",'estado_paleta': "+listPaleta.get(i).getEstado_paleta()+",'posicion_paleta': "+listPaleta.get(i).getPosicion_paleta()+",'codigo_control': '"+listPaleta.get(i).getCodigo_control()+"','nombre_cliente': '"+listPaleta.get(i).getObjCliente().getNombre()+"'}");
        }else
        {
             out.print("{'id_paleta': "+listPaleta.get(i).getId_paleta()+",'fecha_produccion': "+listPaleta.get(i).getFecha_produccion().getTime()+",'estado_paleta': "+listPaleta.get(i).getEstado_paleta()+",'posicion_paleta': "+listPaleta.get(i).getPosicion_paleta()+",'codigo_control': '"+listPaleta.get(i).getCodigo_control()+"','nombre_cliente': '"+listPaleta.get(i).getObjCliente().getNombre()+"'},");
        }
    }%>
     ]
};

$(document).ready(function() {  
  $('.form_datetime_inicio').datetimepicker({
        language:  'es',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
         format: 'yyyy-mm-dd hh:ii'
    });
    $('.form_datetime_fin').datetimepicker({
        language:  'es',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
          format: 'yyyy-mm-dd hh:ii'
    });
$("#txtGrados").spinner({
    decimals: 2,
    stepping: 1.00,
    max: 40,
    min: 5
});
$("#txtCodigo").keyup(function(){   

    $(this).val($(this).val().trim().toUpperCase());    
   if(13>$(this).val().length)
   {
      $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">'+$(this).val().length+'</span></di>');
      $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
   }
   if(13==$(this).val().length)
   {
      
        $('#contador').html(' <di id="contador" >digitos = <span class="label label-success">'+$(this).val().length+'</span></di>');
        if(compruebaData($(this).val()))
       {   
          
          
           $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
           if(validGrabaDetalle)
            {
                validGrabaDetalle=false;
                grabarDetalle();
            }
 
           
       }
       else
            otraBusqueda($(this).val());
           
   }
   else if(13<$(this).val().length)
   {
      $('#contador').html(' <di id="contador" >digitos = <span class="label label-important">'+$(this).val().length+'</span></di>');
     $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
   }
       
     
});


});

function otraBusqueda(codigo)
{
    $.ajax({
            url: 'operaciones/paleta/data_paleta.jsp',
            type: 'POST',
            success: function (data) {     
                    $('#data_paleta').html(data);
                    if(compruebaData(codigo))
                    {
                        $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
                        if(validGrabaDetalle)
                        {
                            validGrabaDetalle=false;
                            grabarDetalle();                            
                        }

                    }
                    else
                    {
                       $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
                       $.sticky("<center><h1>Código no encontrado</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
                    }
                    
                      
            },
            contentType: false,
            processData: false
    });
    
}
function compruebaData(data)
{
   var valida=false;
   var maxI =paleta.entidad.length-1;
   for (i = 0; i <=maxI; i++) { 
        if(paleta.entidad[i].codigo_control.toUpperCase()==data.toUpperCase())
        {
             $('#IdPaleta').val(paleta.entidad[i].id_paleta);
             $('#Codigo').val(paleta.entidad[i].codigo_control);
             $('#FProduccion').val(paleta.entidad[i].fecha_produccion);
             $('#Estado').val(paleta.entidad[i].estado_paleta);
             $('#Posicicion').val(paleta.entidad[i].posicion_paleta);
             $('#Cliente').val(paleta.entidad[i].nombre_cliente);
            
            i=maxI;
            valida=true;
        }   
    }
    return valida;
}; 

function grabarDetalle(){ 

  if(size<$('input#cTunel').val())
  {
      
      var url = "operaciones/carga_tunel/carga/add_list_detalle_carga_tunel_temp.jsp"; 
        $.ajax({
        type: "POST",
        url: url,
        data: $("#detalle_form").serialize(), 
            success: function(data)
            {
                if(data==0)
                {
                     $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
                    $.sticky("<center><h1>Código Repetido</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });

                }   
                else if(data==1)
                {
                    $("#txtCodigo").val(""); 
                    $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
                    $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
                    
                    tabla();
                }            
                clear_detalle();


            }
        }); 
    }
    else
    {
        validGrabaDetalle=true;
        $.sticky("<center><h1>Excedió el Limite de Paletas</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
    }
};
function tabla()
{
     $.ajax({
        url: 'operaciones/carga_tunel/carga/list_detalle_carga_tunel_temp.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
 function tablaTunel()
{
     $.ajax({
        url: 'operaciones/tunel/list_tabla_select.jsp?estado=0',
        type: 'POST',
        success: function (data) {     
                 $('#tablaTunel').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
  function removerItem(pos,codigo)
{
    smoke.confirm('Desea Quitar producto con codigo '+codigo,function(e){
                if (e){
                    $.ajax({
                        url: 'operaciones/carga_tunel/carga/delete_item_list_detalle_carga_tunel_temp.jsp?pos='+pos,
                        type: 'POST',
                        success: function () {     
                                tabla();
                        },
                        contentType: false,
                        processData: false
                    });   
                }
        }, {cancel:"No",ok:"Si"});
                    
 };
 function clear_detalle()
{
    $('#IdPaleta').val("");
    $('#Codigo').val("");
    $('#FProduccion').val("");
    $('#Estado').val("");
    $('#Posicicion').val("");
    $('#Cliente').val("");
    validGrabaDetalle=true;
};
function selectTunel(id,nombre,total)
{  
     
    clear_list();
  $('#idTunel').val(id);  
 $('#cTunel').val(total);                                             
 $('#Tunel').html("<di id='Tunel'><blockquote><p>"+nombre+"  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a></span></p><blockquote><p>Capacidad: "+total+"</p></blockquote></blockquote></di>");  
$('#txtCodigo').removeAttr('disabled');
};
function clear_list()
{
    $.ajax({
    url: 'operaciones/carga_tunel/carga/delete_list_detalle_carga_tunel_temp.jsp',
    type: 'POST',
    success: function () {   
            
            tabla();
    },
    contentType: false,
    processData: false
    });              
};
function confir_lear_list()
{
    smoke.confirm('Desea Limpiar la Lista',function(e){
                if (e){
                     clear_list();
                }
        }, {cancel:"No",ok:"Si"});
};
function grabar_data()
{
    if($('input#idTunel').val()!=null && $('input#idTunel').val()!="")
    {
        var inicio = new Date( $('input#textFInicio').val());
        var fin = new Date( $('input#textFFin').val());

         if(inicio<fin)
         {
             if(size>0)
             {
                 $('input#txtFechaInicio').val(inicio.getTime());
                 $('input#txtFechaFin').val(fin.getTime());                 
                 smoke.confirm('Desea Grabar Paleta',function(e){
                    if (e){
                        var url = "operaciones/carga_tunel/carga/insert.jsp"; 
                        $.ajax({
                        type: "POST",
                        url: url,
                        data: $("#reg_form").serialize(), 
                            success: function(data)
                            {
                                if(data==0)
                                 $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                else if(data>0)
                                {
                                    tablaTunel();
                                    clear_all();
                                   $.sticky("Se Regisro Correctamente.", {autoclose : 5000, position: "top-center" });
                                }

                            }
                        }); 
                    }
                }, {cancel:"No",ok:"Si"});
             }
             else
              $.sticky("<center><h1>Por lo menos Ingrese una Paleta</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
         }
        else
          $.sticky("<center><h1>La fecha de Inicio debe ser menor a la fecha de Fin</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
    }
    else
        $.sticky("<center><h1>Seleccione un Tunel</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
};
function clear_all()
{
    $.ajax({
        url: 'operaciones/paleta/data_paleta.jsp',
        type: 'POST',
        success: function (data) {     
                  $('#data_paleta').html(data);     
                  clear_list();
                  $("#txtCodigo").val(""); 
                  $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
                  $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');  
                  $('input#idTunel').val("");
                  $('input#textFInicio').val("");
                  $('input#textFFin').val("");
                  $('input#txtFechaInicio').val("");
                  $('input#txtFechaFin').val("");  
                  $('#cTunel').val("");                                             
                  $('#Tunel').html("<di id='Tunel'><blockquote><p>Cliente  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a></span></p><blockquote><p>Capacidad</p></blockquote></blockquote></di>");  
                  $('input#txtGrados').val("18.00");
                  $('#txtCodigo').attr('disabled', true);
                 
        },
        contentType: false,
        processData: false
    });
};
 clear_list();
 tablaTunel();
$("#reg_form").submit(function(){
  return false;
});
$("#detalle_form").submit(function(){
  return false;
});
</script>
  </div>
<%
}}%>  
                                                                        
                                                                       
                                                                            