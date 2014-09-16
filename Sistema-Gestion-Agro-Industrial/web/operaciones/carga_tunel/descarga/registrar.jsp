<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entCargaTunel"%>
<%@page import="Entidades.entSesion"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    int size=0;

    if(objSession.getObjCargaTunel()==null)
        objSession.setObjCargaTunel(new entCargaTunel());
    else if(objSession.getObjCargaTunel().getId_carga_tunel()>0)        
        objSession.setObjCargaTunel(new entCargaTunel());
    
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
                                                                                     <label for="txtFechaInicio" class="col-md-2 control-label">Inicio de Descarga</label>
                                                                                    <div class="input-group date form_datetime_inicio col-md-5"  data-link-field="txtFechaInicio">
                                                                                        <input class="form-control span10" size="16" type="text" id="textFInicio" name="textFInicio" value="" readonly>
                                                                                        <span class="input-group-addon"></span>
                                                                                                            <span class="input-group-addon add-on"><span class="glyphicon-th splashy-calendar_day_down"></span></span>
                                                                                    </div>
                                                                                                <input type="hidden" id="txtFechaInicio" name="txtFechaInicio" value="" /><br/>
                                                                                    
                                                                                     </div> 
                                                                                    <div class="input-prepend">
                                                                                     <label for="txtFechaFin" class="col-md-2 control-label">Fin de Descarga</label>
                                                                                    <div class="input-group date form_datetime_fin col-md-5"  data-link-field="txtFechaFin">
                                                                                        <input class="form-control span10" size="16" type="text" id="textFFin" name="textFFin" value="" readonly>
                                                                                        <span class="input-group-addon"></span>
                                                                                                            <span class="input-group-addon add-on"><span class="glyphicon-th splashy-calendar_day_down"></span></span>
                                                                                    </div>
                                                                                                <input type="hidden" id="txtFechaFin" name="txtFechaFin" value="" /><br/>
                                                                                    
                                                                                     </div> 
                                                                                    
                                                                                    <div class="input-prepend">
                                                                                    <label>Temperatura de Descarga</label>
                                                                                    <input type="text" id="txtGrados" name="txtGrados" class="span10" value="2.00"/>

                                                                                   
                                                                                     </div> 
                                                                                    <br>                                                                                                                                                               

                                                                            </div>
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="grabar_data()" type="button">Grabar</button>
                                                                            
                                                                            <button class="btn btn-invert" onclick="clear_all()" type="button">Limpiar Todo</button>
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



                                                                        
<div id="data_paleta"></div>                          
<script type="text/javascript">
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
    max: 5,
    min: -5
});



});

function selectTunel(id,nombre,total)
{   
    $('#tabla').html('<center id="tabla"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>'); 
    $.ajax({
        url: 'operaciones/carga_tunel/descarga/list_detalle_carga_tunel_temp.jsp?id='+id,
        type: 'POST',
        success: function (data) {     
                $('#tabla').html(data);
                $('#idTunel').val(id);  
                $('#cTunel').val(total);                                             
                $('#Tunel').html("<di id='Tunel'><blockquote><p>"+nombre+"  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a></span></p><blockquote><p>Capacidad: "+total+"</p></blockquote></blockquote></di>");  

        },
        contentType: false,
        processData: false
    });        
};

 function tablaTunel()
{
     $.ajax({
        url: 'operaciones/tunel/list_tabla_select.jsp?estado=1',
        type: 'POST',
        success: function (data) {     
                 $('#tablaTunel').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
function grabar_data()
{
    if($('input#idTunel').val()!=null && $('input#idTunel').val()!="")
    {
        var inicio = new Date( $('input#textFInicio').val());
        var fin = new Date( $('input#textFFin').val());

         if(inicio<fin)
         {
             $('input#txtFechaInicio').val(inicio.getTime());
             $('input#txtFechaFin').val(fin.getTime());                 
             smoke.confirm('Desea Grabar Paleta',function(e){
                if (e){
                    var url = "operaciones/carga_tunel/descarga/insert.jsp"; 
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
          $.sticky("<center><h1>La fecha de Inicio debe ser menor a la fecha de Fin</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
    }
    else
        $.sticky("<center><h1>Seleccione un Tunel</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
};
function clear_all()
{
    $.ajax({
        url: 'operaciones/carga_tunel/descarga/list_detalle_carga_tunel_temp.jsp?id='+0,
        type: 'POST',
        success: function (data) {     
                $('#tabla').html(data);
                $('input#idTunel').val("");
                $('input#textFInicio').val("");
                $('input#textFFin').val("");
                $('input#txtFechaInicio').val("");
                $('input#txtFechaFin').val("");  
                $('#cTunel').val("");                                             
                $('#Tunel').html("<di id='Tunel'><blockquote><p>Tunel  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a></span></p><blockquote><p>Capacidad</p></blockquote></blockquote></di>");  
                $('input#txtGrados').val("2.00");
        },
        contentType: false,
        processData: false
    });        
    
};
 tablaTunel();
$("#reg_form").submit(function(){
  return false;
});

</script>
  </div>
<%
}%>  
                                                                        
                                                                       
                                                                            