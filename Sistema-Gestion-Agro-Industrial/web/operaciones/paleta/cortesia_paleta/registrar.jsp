
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
     
%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
             <div class="span3">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                           
                                                                            <div class="formSep">                                                                                
                                                                                    <br>
                                                                                    <div class="input-prepend">
                                                                                    <label>Codigo (13 digitos)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input  type="text" id="txtCodigo" class="span10"  name="txtCodigo" /><span id="validCodigo" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <di id="contador" >digitos = <span class="label label-warning">0</span></di>
                                                                                    </div>                                                                                   

                                                                            </div>
                                                                            
                                                                            <button class="btn btn-invert" id="limpiar" type="button">Limpiar</button>
                                                                          </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                            <div class="span9">
                                        <div id="tabla"> </div>
                                         <center> <button id="grabar" class="btn btn-success"  type="button">Cortesia</button></center>
                                   </div>
              </form>

                                                                                        
 </div>


 <form  method="get" id="detalle_form">
    <input type="hidden" id="IdPaleta"  name="IdPaleta"/>
    <input type="hidden" id="Codigo"  name="Codigo"/>
</form>                                                                           
<div id="data_paleta"></div>                          
<script type="text/javascript">
var size='0';   
$('#grabar').hide();

var paleta= {
     'entidad': [ 
    <%
    List<entPaleta> listPaleta = clsGestor.ListarPackingPaleta(true);
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
$('#grabar').click(function(){
    if($('input#IdPaleta').val()!='' || $('input#IdPaleta').val()!=null){
         smoke.confirm('Desea dar en cortesia esta Paleta',function(e){
            if (e){
                var url = "operaciones/paleta/cortesia_paleta/insert.jsp"; 
                $.ajax({
                type: "POST",
                url: url,
                data: $("#detalle_form").serialize(), 
                    success: function(data)
                    {
                        if(data==0)
                         $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                        else if(data>0)
                        {
                            $.ajax({
                                    url: 'operaciones/paleta/data_paleta.jsp?cocmpleto=1',
                                    type: 'POST',
                                    success: function (data) {     
                                            $('#data_paleta').html(data);  
                                            clear();
                                            $.sticky("Se Regisro Correctamente.", {autoclose : 5000, position: "top-center" });
                                    },
                                    contentType: false,
                                    processData: false
                            });
                         
                        }

                    }
                }); 
            }
        }, {cancel:"No",ok:"Si"});
    }
});
$('#limpiar').click(function(){
clear();
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
   
           $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
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
            url: 'operaciones/paleta/data_paleta.jsp?cocmpleto=1',
            type: 'POST',
            success: function (data) {     
                    $('#data_paleta').html(data);
                    if(compruebaData(codigo))
                        $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
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
           
            $('#tabla').html('<center id="tabla"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>'); 
            $.ajax({
                url: 'operaciones/paleta/cortesia_paleta/cargar.jsp?codigo='+paleta.entidad[i].codigo_control,
                type: 'POST',
                success: function (data) {   
                        $('#tabla').html(data); 
                        $('#grabar').show();
                        $('#txtCodigo').attr('disabled', true);
                },
                contentType: false,
                processData: false
            });        
            
            i=maxI;
            valida=true;
        }   
    }
    return valida;
}; 
function clear()
{
   
    $('#tabla').html('<div id="tabla"> </div>'); 
    $('#txtCodigo').val("");    
    $('#grabar').hide();
    $('#txtCodigo').removeAttr('disabled');
    $('#origen').html('<div id="origen"> </div>');  
    $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
    $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
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
}%>  
                                                                        
                                                                       
                                                                            