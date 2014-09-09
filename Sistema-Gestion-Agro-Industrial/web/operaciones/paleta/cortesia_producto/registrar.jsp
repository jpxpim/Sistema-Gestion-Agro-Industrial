<%@page import="Entidades.entDetallePaleta"%>
<%@page import="Entidades.entLote"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCliente"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entSesion"%>
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
             <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                           
                                                                            <div class="formSep">                                                                                   
                                                                                    <br>
                                                                                    <div class="input-prepend">
                                                                                    <label>Codigo (15 digitos)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtCodigo" name="txtCodigo" /><span id="validCodigo" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <di id="contador" >digitos = <span class="label label-warning">0</span></di>
                                                                                    </div>                                                                                   

                                                                            </div>
                                                                            
                                                                            <button id="limpiar" class="btn btn-invert" type="button">Limpiar</button>
                                                                          </div>
                                                                            

                                                                
                                                            </div>
                                                    </div>
                                            </div>
            <div class="span8">
                        <div id="origen"> </div>
                        <center> <button id="grabar" class="btn btn-success"  type="button">Cortesia</button></center>
                   </div>
              </form>

                                                                                        
 </div>
           
   
 <form  method="get" id="detalle_form">
    <input type="hidden" id="IdProductoTerminado"  name="IdProductoTerminado"/>
     <input type="hidden" id="IdDetPaleta"  name="IdDetPaleta"/>
    <input type="hidden" id="IdPaleta"  name="IdPaleta"/>
    <input type="hidden" id="EPaleta"  name="EPaleta"/>
</form>                                                                           
<div id="detalle_palete"></div>                          
<script type="text/javascript">
var size='0';   

$('#grabar').hide();

var lote= {
     'entidad': [ 
    <%
    List<entLote> listLote = clsGestor.ListarLote(false);
    if(listLote!=null)
    {
      size=listLote.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_lote': "+listLote.get(i).getId_lote()+",'variedad': '"+listLote.get(i).getObjVariedad().getNombre()+"','codigo_control': '"+listLote.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_lote': "+listLote.get(i).getId_lote()+",'variedad': '"+listLote.get(i).getObjVariedad().getNombre()+"','codigo_control': '"+listLote.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};

var producto= {
     'entidad': [ 
    <%
    List<entDetallePaleta> listProductoTerminado = clsGestor.ListarPorProductoTerminadoMovimientosPaleta(true);
    if(listProductoTerminado!=null)
    {
      size=listProductoTerminado.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjProductoTerminado().getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjProductoTerminado().getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getObjProductoTerminado().getCodigo_control()+"','id_det_paleta': "+listProductoTerminado.get(i).getId_det_paleta()+",'id_paleta': "+listProductoTerminado.get(i).getId_paleta()+",'estado_paleta': "+listProductoTerminado.get(i).getId_paleta_origen()+"}");
        }else
        {
            out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjProductoTerminado().getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjProductoTerminado().getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getObjProductoTerminado().getCodigo_control()+"','id_det_paleta': "+listProductoTerminado.get(i).getId_det_paleta()+",'id_paleta': "+listProductoTerminado.get(i).getId_paleta()+",'estado_paleta': "+listProductoTerminado.get(i).getId_paleta_origen()+"},");
        }
    }%>
     ]
};
$(document).ready(function() {  
$('#grabar').click(function(){
    if($('input#IdProductoTerminado').val()!='' || $('input#IdProductoTerminado').val()!=null){
         smoke.confirm('Desea dar el poroducto como cortesia',function(e){
            if (e){
                var url = "operaciones/paleta/cortesia_producto/insert.jsp"; 
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
                                    url: 'operaciones/paleta/data_detalle_palete.jsp?completo=1',
                                    type: 'POST',
                                    success: function (data) {     
                                             $('#detalle_palete').html(data);
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
   if(15>$(this).val().length)
   {
       
       $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">'+$(this).val().length+'</span></di>');
      $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
   }
   if(15==$(this).val().length)
   {
        $('#contador').html(' <di id="contador" >digitos = <span class="label label-success">'+$(this).val().length+'</span></di>');
        if(compruebaData($(this).val()))          
           $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
       else
            otraBusqueda($(this).val());
           
   }
   else if(15<$(this).val().length)
   {
      $('#contador').html(' <di id="contador" >digitos = <span class="label label-important">'+$(this).val().length+'</span></di>');
     $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
   }
       
     
});


});

function otraBusqueda(codigo)
{
    $.ajax({
            url: 'operaciones/paleta/data_detalle_palete.jsp?completo=1',
            type: 'POST',
            success: function (data) {     
                     $('#detalle_palete').html(data);
                      if(!compruebaData(codigo))
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
   var maxI =producto.entidad.length-1;
   for (i = 0; i <=maxI; i++) { 
        if(producto.entidad[i].codigo_control.toUpperCase()==data.toUpperCase())
        {
            var maxJ =lote.entidad.length-1;
            for (j = 0; j <=maxJ; j++) { 
                if(lote.entidad[j].id_lote==producto.entidad[i].id_lote)
                {
                    $("#IdProductoTerminado").val(producto.entidad[i].id_producto_terminado); 
                    $("#EPaleta").val(producto.entidad[i].estado_paleta); 
                    $("#IdDetPaleta").val(producto.entidad[i].id_det_paleta);
                    $("#IdPaleta").val(producto.entidad[i].id_paleta);   
                    
                    $('#origen').html('<center><h3 id="frame"><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>');
                    $.ajax({
                        url: 'operaciones/producto_terminado/buscar_origen.jsp?codigo='+producto.entidad[i].codigo_control,
                        type: 'POST',
                        success: function (data) {     
                               $('#origen').html(data);  
                               $('#grabar').show();
                               $('#txtCodigo').attr('disabled', true);
                        },
                        contentType: false,
                        processData: false
                    }); 
                    i=maxI;
                    j=maxJ;
                    valida=true;
                }   
            }
        }   
    }
    return valida;
}; 

function clear()
{
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
                                                                        
                                                                       
                                                                            