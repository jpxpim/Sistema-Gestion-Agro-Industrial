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
                                                                                    <input type="text" id="txtGrados" name="txtGrados" class="span10" value="1.00"/>

                                                                                   
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
                          
<script type="text/javascript">
tablaTunel();
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

function selectTunel(id,nombre,total)
{   
    $.ajax({
        url: 'operaciones/carga_tunel/descarga/list_detalle_carga_tunel_temp.jsp?id='id,
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
                                                                        
                                                                       
                                                                            