<%@page import="Entidades.entRecepcion"%>
<%@page import="Entidades.entParihuela"%>
<%@page import="Entidades.entCategoria"%>
<%@page import="Entidades.entJaba"%>
<%@page import="Com.Operaciones"%>
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entDetalleBrotacion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
if(request.getParameter("id") != null && request.getParameter("id") != "" )
{
  if(objSession.getObjRecepcion()==null)
  {
        entRecepcion objRecepcion = new entRecepcion();
        List<entJaba> listJaba=clsGestor.ListarJaba(true);
        List<entCategoria> listCategoria=clsGestor.ListarCategoria(true);
        List<entParihuela> listParihuela=clsGestor.ListarParihuela(true);

        
        if(!request.getParameter("id").equals("0"))
        {
            
        }
        
        objRecepcion.setListaCategoria(listCategoria);
        objRecepcion.setListaJaba(listJaba);
        objRecepcion.setListaParihuela(listParihuela);
        
        objSession.setObjRecepcion(objRecepcion);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession);
        sesion.setMaxInactiveInterval(-1);
  }

  
%>
<div id="frame">

                    <div class="row-fluid">
                            <div class="span12">
                                <form  method="get" id="reg_form">
                                    <div class="row-fluid">
                                            <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                      
                                                                          <div class="location_add_form well">                                                                             
                                                                                    <div class="input-prepend">
                                                                                    <label>Chofer
                                                                                        <a data-toggle='modal' data-backdrop='static' href='#ModalChofer'><i class='splashy-zoom'></i></a>
                                                                                    </label>
                                                                                        <div id="chofer"><blockquote>Chofer<blockquote>Empresa Tramsportista</blockquote></blockquote></div>
                                                                                        <input type="text" class="span10" id="IdChofer" name="IdChofer" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Dirección de Llegada
                                                                                        <a data-toggle='modal' data-backdrop='static' href='#ModalDireccion'><i class='splashy-zoom'></i></a>
                                                                                    </label>
                                                                                        <blockquote><div id="direccion">Dirección de Llegada</div></blockquote>
                                                                                        <input type="text" class="span10" id="IdDireccion" name="IdDireccion" />
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
                                                                                    <label>Guia de Recepción N°</label>
                                                                                    <input type="text" class="span10" id="txtGuia" name="txtGuia" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Placa</label>
                                                                                    <input type="text" class="span10" id="txtPlaca" name="txtPlaca" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Modelo</label>
                                                                                    <input type="text" class="span10" id="txtModelo"  name="txtModelo" />
                                                                                     </div>                                                                                   
                                                                                  
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
                                                                                    <label>Fecha</label>
                                                                                    <input type="text" class="span10" id="txtFecha"  name="txtFecha" />
                                                                                     </div>  
                                                                                     <div class="input-prepend">
                                                                                    <label>Estado</label>
                                                                                    <label class="radio inline">
                                                                                    <input type="radio" value="1"  id="rbEstado" name="rbEstado" />
                                                                                        Activo
                                                                                    </label>
                                                                                    <label class="radio inline">
                                                                                            <input type="radio" value="0" id="rbEstado" name="rbEstado" />
                                                                                            Desactivado
                                                                                    </label>
                                                                                     </div>
                                                                                <input type="hidden" id="IdVivero"  name="IdVivero" value="0" />

                                                                            </div>
                                                                            <button class="btn btn-invert" type="submit">Grabar</button>

                                                                            <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
                                                                    </div>


                                                              
                                                            </div>
                                                    </div>
                                               
                                            </div>
                                    </div>
                                  </form>
                            </div>
                        </div>
    
                         <div class="row-fluid">
                             <div class="span12">
                                  <div id="tabla"></div>
                             </div>
                        </div>

</div>

  <!-- Modal Chofer -->	
<div class="modal hide fade" id="ModalChofer" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3 id="TituloChofer">Buscar Chofer</h3>
    </div>
    <div class="modal-body">      
        <center>
             <div id="tablaChofer"></div>
        </center>
       
    </div>
    <div class="modal-footer">
        <a id="btnAddChofer" href="javascript:void(0)" onclick="addChofer()" class="btn">Agregar</a> 
        <a data-dismiss="modal" href="javascript:void(0)" id="CerrarChofer" class="btn">Cerrar</a>
    </div>
</div>     
 
  <!-- Modal Direccion -->	
<div class="modal hide fade" id="ModalDireccion" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3 id="TituloDireccion">Buscar Dirección de Llegada</h3>
    </div>
    <div class="modal-body">      
        <div id="tablaDireccion"></div>
    </div>
    <div class="modal-footer">
        <a id="btnAddDireccion" href="javascript:void(0)" onclick="addDireccion()" class="btn">Agregar</a> 
        <a data-dismiss="modal" href="javascript:void(0)" id="CerrarDireccion" class="btn">Cerrar</a>
    </div>
</div>                
<script>
    var estadoChofer=true;
    var estadoDireccion=true;
function setEstadoChofer(id)
{
    $('#IdChofer').val(id);
   estadoChofer=true; 
   $('#TituloChofer').html('<h3 id="TituloChofer">Agregar Chofer</h3>')
   $("#btnAddChofer").text('Agregar');
   tablaChofer();
    $("#CerrarChofer").trigger("click");
};
 function addChofer()
 {
      $('#tablaChofer').html('<h3 id="tablaChofer"><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3>');
     if(estadoChofer)
     {
         
         $('#TituloChofer').html('<h3 id="TituloChofer">Agregar Chofer</h3>')
         estadoChofer=false;
         $("#btnAddChofer").text('Listar');
         tablaChofer();
     }
     else{
         estadoChofer=true;
         $('#TituloChofer').html('<h3 id="TituloChofer">Buscar Chofer</h3>');    
         $("#btnAddChofer").text('Agregar');
         tablaChofer();
     }
     
 };
 function seleccionChofer(id,nombre,empresa)
 {
     $('#IdChofer').val(id);
     $('#chofer').html('<div id="chofer"><blockquote>'+nombre+'<blockquote>'+empresa+'</blockquote></blockquote></div> ');
     
 };


function setEstadoDireccion(id)
{
    $('#IdDireccion').val(id);
   estadoDireccion=true; 
   $('#TituloDireccion').html('<h3 id="TituloDireccion">Agregar Direccion</h3>')
   $("#btnAddDireccion").text('Agregar');
   tablaDireccion();
    $("#CerrarDireccion").trigger("click");
};
 function addDireccion()
 {
      $('#tablaDireccion').html('<h3 id="tablachofer"><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3>');
     if(estadoDireccion)
     {
         
         $('#TituloDireccion').html('<h3 id="TituloDireccion">Agregar Direccion</h3>')
         estadoDireccion=false;
         $("#btnAddDireccion").text('Listar');
         tablaDireccion();
     }
     else{
         estadoDireccion=true;
         $('#TituloDireccion').html('<h3 id="TituloDireccion">Buscar Direccion</h3>');    
         $("#btnAddDireccion").text('Agregar');
         tablaDireccion();
     }
     
 };
  function seleccionDireccionLlegada(id,nombre)
 {
     $('#IdDireccion').val(id);
     $('#direccion').html('<div id="direccion">'+nombre+'</div>');

 };
 
 
function tablaChofer()
{
     if(estadoChofer)
     {
            $.ajax({
            url: 'operaciones/chofer/list_tabla_seleccion.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#tablaChofer').html(data);
            },
            contentType: false,
            processData: false
            });          
     }
     else{
         $.ajax({
            url: 'operaciones/chofer/agregar.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#tablaChofer').html(data);
            },
            contentType: false,
            processData: false
            });              
     }
    
 };
function tablaDireccion()
{
     if(estadoDireccion)
     {
            $.ajax({
                url: 'operaciones/direccion_llegada/list_tabla_seleccion.jsp',
                type: 'POST',
                success: function (data) {     
                         $('#tablaDireccion').html(data);
                },
                contentType: false,
                processData: false
                });          
     }
     else{
         $.ajax({
            url: 'operaciones/direccion_llegada/agregar.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#tablaDireccion').html(data);
            },
            contentType: false,
            processData: false
            });              
     }
     
 };      
 function tabla(pos)
{
    $('#tabla').html('<center><h3 id="tabla"><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>');
     $.ajax({
        url: 'operaciones/recepcion/list_tabla_temp.jsp?posicion='+pos,
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
 tabla(0);
 tablaChofer();
 tablaDireccion();
    		$(document).ready(function() {
                                    $('#IdChofer').hide();
                                    $('#IdDireccion').hide();
                                      $('#reg_form').validate({
                                        lang: 'es',
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
                                        ignore: ".ignore",
                                            submitHandler: function() {       
                                                       $("#abrirCarga").click();
                                                    var url = "operaciones/vivero/insert.jsp"; 

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
						txtModelo: { required: true, minlength: 3 },
                                                txtPlaca: { required: true, minlength: 4 },
                                                txtGuia: { required: true, digits: true },
                                                rbEstado: { required: true },
                                                IdChofer: { required: true },
                                                IdDireccion: { required: true },
                                                txtFecha: { required: true }
                                                
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
                                 function clear_form() {
                                           $('input:radio[name=rbEstado]').attr('checked',false);
                                          $('#txtNombre').val("");
                                          $('#txtCodigo').val("");
                                            $('#txtDescripcion').val("");
                                        
                                          $("#IdVivero").val("0");  
                                     
                                           
                                      };
                                   function edit_form(id,nombre,descripcion,codigo,estado) {
                                        $('#txtNombre').val(nombre);
                                        $('#txtDescripcion').val(descripcion);
                                        $('#IdVivero').val(id);
                                         $('#txtCodigo').val(codigo);
                                        if(estado.toLowerCase()=="true")
                                         $('input:radio[name=rbEstado]')[0].checked = true;
                                        else
                                          $('input:radio[name=rbEstado]')[1].checked = true;


                                      };
</script>
<%}}%>  
           