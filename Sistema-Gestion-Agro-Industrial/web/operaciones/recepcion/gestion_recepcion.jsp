<%@page import="java.util.Date"%>
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
    SimpleDateFormat  e=new SimpleDateFormat("MM/dd/yyyy");
    String chofer="Chofer";
    String transportista="Empresa Tramsportista";
    String direccion="Dirección de Llegada";
    String idChofer="";
    String idDireccion="";
    String precinto="";
    String guia="";
    String placa="";
    String modelo="";
    String fecha=e.format(new Date());
    String activo="";
    String inactivo="";
    String estado="$('input:radio[name=rbEstado]').attr('checked',false);";
  
  if(objSession.getObjRecepcion()==null)
  {
        entRecepcion objRecepcion = new entRecepcion();
        List<entJaba> listJaba=clsGestor.ListarJaba(true);
        List<entCategoria> listCategoria=clsGestor.ListarCategoria(true);
        List<entParihuela> listParihuela=clsGestor.ListarParihuela(true);

        
        if(!request.getParameter("id").equals("0"))
        {
            objRecepcion = clsGestor.BuscarPorIdRecepcion(Integer.parseInt(request.getParameter("id")));
            
        }
        
        objRecepcion.setListaCategoria(listCategoria);
        objRecepcion.setListaJaba(listJaba);
        objRecepcion.setListaParihuela(listParihuela);
        
        objSession.setObjRecepcion(objRecepcion);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession);
        sesion.setMaxInactiveInterval(-1);
  }
  
  
  if(objSession.getObjRecepcion().getId_recepcion()>0)
      {
            chofer=objSession.getObjRecepcion().getObjChofer().getNombre();
            transportista=objSession.getObjRecepcion().getObjChofer().getObjTransportista().getRazon_social();
            direccion=objSession.getObjRecepcion().getObjDireccionLlegada().getNombre();
            idChofer="value='"+objSession.getObjRecepcion().getObjChofer().getId_chofer()+"'";
            idDireccion="value='"+objSession.getObjRecepcion().getObjDireccionLlegada().getId_dir_llegada()+"'";
            precinto="value='"+objSession.getObjRecepcion().getPrecinto()+"'";
            guia="value='"+objSession.getObjRecepcion().getNum_guia()+"'";
            placa="value='"+objSession.getObjRecepcion().getPlaca()+"'";
            modelo="value='"+objSession.getObjRecepcion().getModelo()+"'";
            fecha=e.format(objSession.getObjRecepcion().getFecha_recepcion());
            if(objSession.getObjRecepcion().getEstado()==1)
            {
               activo="checked='true'";
               estado="$('input:radio[name=rbEstado]')[0].checked = true;";
            }
            else if(objSession.getObjRecepcion().getEstado()==2)
            {
                 estado="$('input:radio[name=rbEstado]')[1].checked = true;";
                 inactivo="checked='true'";
            }
      }
  
%>
<div id="frame">
         <div id="ocultar" class="row-fluid">
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
                                                                                        <div id="chofer"><blockquote><%=chofer%><blockquote><%=transportista%></blockquote></blockquote></div>
                                                                                        <input type="text" class="span10" id="IdChofer" name="IdChofer" <%=idChofer%> />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Dirección de Llegada
                                                                                        <a data-toggle='modal' data-backdrop='static' href='#ModalDireccion'><i class='splashy-zoom'></i></a>
                                                                                    </label>
                                                                                        <blockquote><div id="direccion"><%=direccion%></div></blockquote>
                                                                                        <input type="text" class="span10" id="IdDireccion" name="IdDireccion"  <%=idDireccion%>/>
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
                                                                                    <input type="text" class="ttip_r" id="txtPrecinto" name="txtPrecinto" title="Ingrese Precinto"  placeholder="Ingrese Precinto" <%=precinto%> />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <input type="text" id="txtGuia" name="txtGuia" <%=guia%> class="ttip_r"  title="Ingrese Guia de Recepción"  placeholder="Ingrese Guia de Recepción" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <input type="text" id="txtPlaca" name="txtPlaca" <%=placa%>  class="ttip_r"  title="Ingrese Placa"  placeholder="Ingrese Placa"/>
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <input type="text" id="txtModelo"  name="txtModelo" <%=modelo%> class="ttip_r"  title="Ingrese Modelo"  placeholder="Ingrese Modelo"/>
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
                                                                                    <input type="text" id="txtFecha"  name="txtFecha" value="<%=fecha%>"  class="ttip_r"  title="Ingrese Fecha"  placeholder="Ingrese Fecha"/>
                                                                                     </div>  
                                                                                     <div class="input-prepend">
                                                                                    <label>Estado</label>
                                                                                    <label class="radio inline">
                                                                                    <input type="radio" value="1"  id="rbEstado" name="rbEstado" <%=activo%>  />
                                                                                        Activo
                                                                                    </label>
                                                                                    <label class="radio inline">
                                                                                            <input type="radio" value="0" id="rbEstado" name="rbEstado" <%=inactivo%> />
                                                                                            Inactivado
                                                                                    </label>
                                                                                     </div>

                                                                            </div>
                                                                            <button class="btn btn-invert" type="submit">Grabar</button>

                                                                            <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
                                                                             <button class="btn btn-invert" onclick="clear_all()" type="button">Regresar</button>
                                                                             <button class="btn btn-inverse" onclick="getOcultar()" type="button">Ocultar</button>
                                                                          </div>


                                                              
                                                            </div>
                                                    </div>
                                               
                                            </div>
                                    </div>
                                  </form>
                            </div>
                        </div>
     
                        <div class="row-fluid" id="ver" style="display: none">
                             <div class="span12">
                                   <button class="btn btn-gebo" onclick="getOcultar()" type="button">Ver</button>
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
    var ocultar=true;
    var size=<%=objSession.getObjRecepcion().getLista().size()%>;
function getOcultar()
{
    if(ocultar)
    {
         $("#ocultar").hide();   
         $("#ver").show();   
        ocultar=false;
    }else{
         $("#ocultar").show();   
        $("#ver").hide();   
        ocultar=true;
    }
};
function clear_all()
{
    smoke.confirm('Desea Cancelar Todo',function(e){
        if (!e){            
            $.ajax({
            url: 'operaciones/recepcion/limpiar_tabla_temp.jsp',
            type: 'POST',
            success: function () {     
                     lista();
            },
            contentType: false,
            processData: false
            });  
        }
    }, {ok:"No", cancel:"Si"});
           

};
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
                                                
                                                if(0<size)
                                                 {
                                                       $("#abrirCarga").click();
                                                    var url = "operaciones/recepcion/insert.jsp"; 

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
                                                                   $.sticky("Se Actualizo Correctamente.", {autoclose : 5000, position: "top-center" });
                                                                    
                                                               }
                                                                else if(data>0)
                                                                {
                                                                   lista();
                                                                   $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  
                                                                   
                                                                }
                                                                 $("#cerrarCarga").trigger("click");
                                                           }
                                                         });
                                                     }
                                                     else
                                                         $.sticky("Por favor al menos ingrese un datalle.", {autoclose : 5000, position: "top-right", type: "st-error" });
                                              
                                            },
					rules: {
						txtModelo: { required: true, minlength: 3 },
                                                txtPlaca: { required: true, minlength: 4 },
                                                txtGuia: { required: true, digits: true },
                                                rbEstado: { required: true },
                                                IdChofer: { required: true },
                                                IdDireccion: { required: true },
                                                txtFecha: { required: true },
                                                txtPrecinto: { required: true }
                                                
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
                                  
</script>
<%}}%>  
           