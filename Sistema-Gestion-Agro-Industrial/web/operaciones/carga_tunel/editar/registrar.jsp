
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entPaleta"%>
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
                                                                                                                                                                             

                                                                            </div>
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="grabar_data()" type="button">Grabar</button>
                                                                            
                                                                            <button class="btn btn-invert" onclick="clear_all()" type="button">Limpiar Todo</button>
                                                                          </div>


                                                                
                                                            </div>
                                                    </div>
                                                     <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                           
                                                                                     <div class="input-prepend">
                                                                                    <label>Codigo (13 digitos)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input  type="text" id="txtCodigo" class="span10"  name="txtCodigo" disabled/><span id="validCodigo" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <di id="contador" >digitos = <span class="label label-warning">0</span></di>
                                                                                    </div>       
                                                                                                                                                                             

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
function tabla()
{
     $.ajax({
        url: 'operaciones/carga_tunel/editar/list_detalle_carga_tunel_temp.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
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
      
      var url = "operaciones/carga_tunel/editar/add_list_detalle_carga_tunel_temp.jsp"; 
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
function selectTunel(id,nombre,total)
{   
    $('#tabla').html('<center id="tabla"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>'); 
    $.ajax({
        url: 'operaciones/carga_tunel/editar/cargar.jsp?id='+id,
        type: 'POST',
        success: function () {     
                    $('#idTunel').val(id);  
                    $('#cTunel').val(total);                                             
                    $('#Tunel').html("<di id='Tunel'><blockquote><p>"+nombre+"  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a></span></p><blockquote><p>Capacidad: "+total+"</p></blockquote></blockquote></di>");  
                    $('#txtCodigo').removeAttr('disabled');
                    tabla();
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
        smoke.confirm('Desea Grabar Paleta',function(e){
            if (e){
                var url = "operaciones/carga_tunel/editar/insert.jsp"; 
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
                           clear_all();
                           $.sticky("Se Regisro Correctamente.", {autoclose : 5000, position: "top-center" });
                        }

                    }
                }); 
        }
        }, {cancel:"No",ok:"Si"});
    }
    else
        $.sticky("<center><h1>Seleccione un Tunel</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
};
function removerItem(pos,codigo)
{
    smoke.confirm('Desea Quitar producto con codigo '+codigo,function(e){
                if (e){
                    $.ajax({
                        url: 'operaciones/carga_tunel/editar/delete_item_list_detalle_carga_tunel_temp.jsp?pos='+pos,
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
 

function clear_all()
{
     $('#tabla').html('<center id="tabla"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>'); 
    $.ajax({
        url: 'operaciones/carga_tunel/editar/cargar.jsp?id=0',
        type: 'POST',
        success: function () {     
            $('input#idTunel').val("");
            $('#cTunel').val("");                                             
            $('#Tunel').html("<di id='Tunel'><blockquote><p>Cliente  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a></span></p><blockquote><p>Capacidad</p></blockquote></blockquote></di>");  
            $('#txtCodigo').attr('disabled', true);
            tabla();
        },
        contentType: false,
        processData: false
    });        
       
    
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
}%>  
                                                                        
                                                                       
                                                                            