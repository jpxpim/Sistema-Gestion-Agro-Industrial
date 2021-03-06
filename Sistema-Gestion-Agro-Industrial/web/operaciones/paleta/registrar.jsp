
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entCliente"%>
<%@page import="Entidades.entProductoTerminado"%>
<%@page import="Entidades.entLineaProduccion"%>
<%@page import="Entidades.entEmpleado"%>
<%@page import="Entidades.entLote"%>
<%@page import="Entidades.entColor"%>
<%@page import="Entidades.entCategoria"%>
<%@page import="Entidades.entCalibre"%>
<%@page import="Entidades.entEnvase"%>
<%@page import="java.util.List"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
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
            <h3 class="heading">Iniciar Nuevo d�a de Producci�n</h3>  
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
            <h3 class="heading">Espere que el ecargado inicie un nuevo d�a de Producci�n</h3> 
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
            <h3 class="heading">D�a de Producci�n Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
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
            <h3 class="heading">D�a de Producci�n Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
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

objSession.setObjPaleta(new entPaleta());

    
%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
             <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                           
                                                                            <div class="formSep">
                                                                                     <div class="input-prepend">
                                                                                        <di id='CampaniaLote'>
                                                                                                <blockquote >
                                                                                                    <p>Cliente
                                                                                                          <span class='add-on'>
                                                                                                              <a data-toggle='modal' data-backdrop='static' href='#ModalCliente'><i class='splashy-zoom'></i></a>
                                                                                                          </span> 
                                                                                                    </p>
                                                                                                </blockquote>
                                                                                          </di>
                                                                                        <input type="hidden" id="idCliente"  name="idCliente" value="" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Estado</label>
                                                                                    <label class="radio inline">
                                                                                    <input type="radio" value="1"  id="rbEstado" name="rbEstado" />
                                                                                        Completa
                                                                                    </label>
                                                                                    <label class="radio inline">
                                                                                            <input type="radio" value="2" id="rbEstado" name="rbEstado" />
                                                                                            Incompleta
                                                                                    </label>
                                                                                     </div>
                                                                                    <br>
                                                                                    <div class="input-prepend">
                                                                                    <label>Codigo (15 digitos)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtCodigo" name="txtCodigo" /><span id="validCodigo" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <di id="contador" >digitos = <span class="label label-warning">0</span></di>
                                                                                    </div>                                                                                   

                                                                            </div>
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="grabar_data()" type="button">Grabar</button>
                                                                            
                                                                            <button class="btn btn-invert" onclick="clear_list()" type="button">Limpiar Lista</button>
                                                                            <a id="buscar" data-toggle='modal' data-backdrop='static' class="btn" href='#ModalProductoTerminado'>Buscar Origen</a>
                                                                          </div>
                                                                          <div id="paleta"></div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                            <div class="span8">
                                        <div id="tabla"> </div>
                                   </div>
              </form>

                                                                                        
 </div>
    
   
    
 <!-- Modal Cliente -->	
<div class="modal hide fade" id="ModalCliente" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">�</button>
        <h3>Buscar Cliente</h3>
    </div>
    <div class="modal-body">
        <table id="tablaCliente" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>RUC</th>
                           <th>Direcci�n</th>                         
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
             List<entCliente> listCliente=clsGestor.ListarCliente(true);
            if(listCliente!=null)
            for(entCliente entidad : listCliente)
            {
            %>

                <tr>
                    <td><%=entidad.getId_cliente()%></td>
                    <td><%=entidad.getNombre()%></td>
                    <td><%=entidad.getRuc()%></td>
                    <td><%=entidad.getDireccion()%></td>                 
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectCampaniaLote(<%=entidad.getId_cliente()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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

 <!-- Modal Producto Terminado -->	
<div class="modal hide fade" id="ModalProductoTerminado" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">�</button>
        <h3>Buscar Origen de Producto</h3>
    </div>
    <div class="modal-body">
        <div id="origen"></div>
    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
        
    </div>
</div>                 
   
 <form  method="get" id="detalle_form">
    <input type="hidden" id="IdProductoTerminado"  name="IdProductoTerminado"/>
    <input type="hidden" id="Codigo"  name="Codigo"/>
    <input type="hidden" id="nCalibre"  name="nCalibre"/>
    <input type="hidden" id="nVariedad"  name="nVariedad"/>
    <input type="hidden" id="nCajas"  name="nCajas"/>
    <input type="hidden" id="cLote"  name="cLote"/>
</form>                                                                           
<div id="producto_terminado"></div>                          
<script type="text/javascript">
var size='0';   
$('#buscar').hide();
function grabar_data()
{
   


     if($('input#idCliente').val()=='' || $('input#idCliente').val()==null)        
     $.sticky("<center><h1>Seleccione un Cliente</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
    else
    {
        if($('input:radio[name=rbEstado]')[0].checked==false && $('input:radio[name=rbEstado]')[1].checked==false)
         $.sticky("<center><h1>Seleccione un Estado</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
        else
        {
            if(size==0)
                $.sticky("<center><h1>Ingrese al menos un Items</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
            else
            {
                smoke.confirm('Desea Grabar Paleta',function(e){
                    if (e){
                        var url = "operaciones/paleta/insert.jsp"; 
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
        }
        
    }



};
function selectCampaniaLote(id,nombre)
{
  $('#idCliente').val(id);  
                                            
 $('#CampaniaLote').html("<di id='CampaniaLote'><blockquote><p>"+nombre+"  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalCliente'><i class='splashy-zoom'></i></a></span></p></blockquote></di>");  
};
function tabla()
{
     $.ajax({
        url: 'operaciones/paleta/list_detalle_paleta_temp.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
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
                        url: 'operaciones/paleta/delete_item_list_detalle_paleta_temp.jsp?pos='+pos,
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

var validGrabaDetalle=true;
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
    List<entProductoTerminado> listProductoTerminado = clsGestor.ListarPorDiaRecepccionProductoTerminado(objSession.getObjDiaRecepcion().getId_dia_recepcion());
    if(listProductoTerminado!=null)
    {
      size=listProductoTerminado.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};

$(document).ready(function() {  
$('#tablaCliente').dataTable({
    "sPaginationType": "bootstrap",
    "bDestroy": true,
    "bDeferRender": true
}); 
$('#buscar').click(function(){
    $('#origen').html('<center><h3 id="frame"><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>');
                       
    $.ajax({
        url: 'operaciones/producto_terminado/buscar_origen.jsp?codigo='+$("#txtCodigo").val(),
        type: 'POST',
        success: function (data) {     
               $('#origen').html(data);  
        },
        contentType: false,
        processData: false
    }); 
});
$("#txtCodigo").keyup(function(){   
    $('#buscar').hide();
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
   else if(15<$(this).val().length)
   {
      $('#contador').html(' <di id="contador" >digitos = <span class="label label-important">'+$(this).val().length+'</span></di>');
     $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
   }
       
     
});


});

function clear_list()
{
    smoke.confirm('Desea Limpiar la Lista',function(e){
                if (e){
                     $.ajax({
                        url: 'operaciones/paleta/delete_list_detalle_paleta_temp.jsp',
                        type: 'POST',
                        success: function () {   
                                $('#paleta').html('<div id="paleta"></div>');
                                tabla();
                        },
                        contentType: false,
                        processData: false
                    });
                }
        }, {cancel:"No",ok:"Si"});
};
function otraBusqueda(codigo)
{
    $.ajax({
            url: 'operaciones/producto_terminado/data_producto_terminado.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#producto_terminado').html(data);
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
                          $('#buscar').show();
                           $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
                           $.sticky("<center><h1>C�digo no encontrado</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
           
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
                    $("#Codigo").val(producto.entidad[i].codigo_control); 
                    $("#nCalibre").val(producto.entidad[i].n_calibre); 
                    $("#nVariedad").val(lote.entidad[j].variedad); 
                    $("#cLote").val(lote.entidad[j].codigo_control); 
                    $("#nCajas").val(producto.entidad[i].numero_cajas);
                    
                    i=maxI;
                    j=maxJ;
                    valida=true;
                }   
            }
        }   
    }
    return valida;
}; 

function grabarDetalle(){  
  var url = "operaciones/paleta/add_list_detalle_paleta_temp.jsp"; 
    $.ajax({
    type: "POST",
    url: url,
    data: $("#detalle_form").serialize(), 
        success: function(data)
        {
            if(data==-2)
            {
                 tabla();
                $("#txtCodigo").val(""); 
                $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
                $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
                clear_detalle();
                $.sticky("<center><h1>Paleta Mixta</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" }); 
                $('#paleta').html('<div id="paleta"><span class="label label-important">Paleta Mixta</span></div>');
               
            }   
            else if(data==-1)
            {
                clear_detalle();
                $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
                $.sticky("<center><h1>C�digo Repetido</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
            }            
            else if(data==0)
            {
                $("#txtCodigo").val(""); 
                $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
                $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
                $('#paleta').html('<div id="paleta"></div>');
               
                clear_detalle();
                tabla();
            }
            else if(data>0)
            {
                $("#txtCodigo").val(""); 
                $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
                $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
                clear_detalle();
                $.sticky("<center><h1>El Maximo de items permitods es"+data+"</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" }); 
                $('#paleta').html('<div id="paleta"><span class="label label-success">Paleta Cerrada</span></div>');
               
            }
            
           
        }
    }); 
};
function clear_detalle()
{
    $('#buscar').hide();
    $("#IdProductoTerminado").val(""); 
    $("#Codigo").val(""); 
    $("#nCalibre").val(""); 
    $("#nVariedad").val(""); 
    $("#cLote").val(""); 
    $("#nCajas").val(""); 
    
    
    validGrabaDetalle=true;
};
function clear_all()
{
     $.ajax({
        url: 'operaciones/paleta/delete_list_detalle_paleta_temp.jsp',
        type: 'POST',
        success: function () {   
                $('#paleta').html('<div id="paleta"></div>');
                 $.ajax({
                            url: 'operaciones/producto_terminado/data_producto_terminado.jsp',
                            type: 'POST',
                            success: function (data) {     
                                     $('#producto_terminado').html(data);         
                            },
                            contentType: false,
                            processData: false
                    });
                tabla();
                $("#txtCodigo").val(""); 
               $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
               $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');    
               clear_detalle();
        },
        contentType: false,
        processData: false
    });
    
};
tabla();

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
                                                                        
                                                                       
                                                                            