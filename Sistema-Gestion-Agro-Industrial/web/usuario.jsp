<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>
<%@page import="Entidades.entFormulario"%>
<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(objSession.getListModulos()==null)
        response.sendRedirect("intranet.jsp");
    
    entFormulario formHijo=null;
    boolean pagina=false;
    int posJ=objSession.getListModulos().get(objSession.getPosicion()).getList().size();
        for(int j=0;j<posJ;j++)
        {
            if(23==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
            {
                formHijo=objSession.getListModulos().get(objSession.getPosicion()).getList().get(j);
                formHijo.setObjModulo(objSession.getListModulos().get(objSession.getPosicion()));
                pagina=true;
                j=posJ;
            }
        }
    if(!pagina)
        response.sendRedirect("intranet.jsp");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sistema Gestión Agrícola</title>
        <meta name="author" content="">
        <meta name="description" content="Sistema Gestión Agrícola">
        <meta name="keywords" content="Sistema Agricola">
    
        <!-- Bootstrap framework -->
            <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
            <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
        <!-- gebo blue theme-->
            <link rel="stylesheet" href="css/blue.css" id="link_theme" />
        <!-- breadcrumbs-->
            <link rel="stylesheet" href="lib/jBreadcrumbs/css/BreadCrumb.css" />
        <!-- tooltips-->
            <link rel="stylesheet" href="lib/qtip2/jquery.qtip.min.css" />
        <!-- notifications -->
            <link rel="stylesheet" href="lib/sticky/sticky.css" />    
        <!-- splashy icons -->
            <link rel="stylesheet" href="img/splashy/splashy.css" />
        <!-- wizard -->
            <link rel="stylesheet" href="lib/stepy/css/jquery.stepy.css" />
		<!-- colorbox -->
            <link rel="stylesheet" href="lib/colorbox/colorbox.css" />	
			
        <!-- main styles -->
            <link rel="stylesheet" href="css/style.css" />
	<!-- datepicker -->
            <link rel="stylesheet" href="lib/datepicker/datepicker.css" />

            <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=PT+Sans" />
		<!-- smoke_js -->
            <link rel="stylesheet" href="lib/smoke/themes/gebo.css" />
        <!-- Favicon -->
            <link rel="shortcut icon" href="favicon.ico" />
		
        <!--[if lte IE 8]>
            <link rel="stylesheet" href="css/ie.css" />
            <script src="js/ie/html5.js"></script>
			<script src="js/ie/respond.min.js"></script>
        <![endif]-->
		
		<script>
			//* hide all elements & show preloader
			document.documentElement.className += 'js';
		</script>
    <!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  --></head>
    <body>
		<div id="loading_layer" style="display:none"><img src="img/ajax_loader.gif" alt="" /></div>
		
		
		<div id="maincontainer" class="clearfix">
			<!-- header -->
                         <header id="header">

                        </header>
            
            <!-- main content -->
            <div id="contentwrapper">
                <div class="main_content">
                    <nav>
                        <div id="jCrumbs" class="breadCrumb module">
                              <ul>
                                <li>
                                    <a href="intranet.jsp"><i class="icon-home"></i></a>
                                </li>                                
                                 <li>
                                    <a href="<%=formHijo.getObjModulo().getUrl()%>"><%=formHijo.getObjModulo().getEtiqueta()%></a>
                                </li>
                                <li><%=formHijo.getEtiqueta()%></li>
                            </ul>
                        </div>
                    </nav>
                    
					<div class="row-fluid">
						<div class="span12">							
							<div class="row-fluid">
								<div class="span2"></div>
								<div class="span8">
									<form id="validate_wizard" class="stepy-wizzard form-horizontal">
                                                                            
										<fieldset title="Información Personal">
											<legend class="hide">Datos de personales del usuario.</legend>
											<div class="formSep control-group">
												<label for="txtNombres" class="control-label">Nombres:</label>
												<div class="controls">
													<input type="text" name="txtNombres" id="txtNombres" />
												</div>
											</div>
                                                                                        <div class="formSep control-group">
												<label for="txtApellidos" class="control-label">Apellidos:</label>
												<div class="controls">
													<input type="text" name="txtApellidos" id="txtApellidos" />
												</div>
											</div>
                                                                                        <div class="formSep control-group">
												<label for="txtEmail" class="control-label">Correo Electronico:</label>
												<div class="controls">
													<input type="text" name="txtEmail" id="txtEmail" />
												</div>
											</div>
                                                                                        <div class="formSep control-group">
												<label for="txtTelefono" class="control-label">Telefono:</label>
												<div class="controls">
													<input type="text" name="txtTelefono" id="txtTelefono" />
												</div>
											</div>
											<div class="formSep control-group">
												<label for="txtCelular" class="control-label">Celular:</label>
												<div class="controls">
													<input type="text" name="txtCelular" id="txtCelular" />
												</div>
											</div>
                                                                                        <div class="formSep control-group">
												<label for="txtFNacimiento" class="control-label">Fecha Nacimiento:</label>
												<div class="controls">
													<input type="text" name="txtFNacimiento" id="txtFNacimiento" />
												</div>
											</div>
											<div class="control-group">
												<label for="txtFoto" class="control-label">Imagen: </label>
                                                                                                   
                                                                                                <div class="controls">                                                                                                    
                                                                                                    <div id="foto"></div>    
                                                                                                    <span class="btn btn-file"><span class="fileupload-new">Seleccionar</span><input type="file" name="archivo" id="archivo" /></span>
                                                                                                    <a id="Remover" data-dismiss="fileupload" class="btn fileupload-exists" href="#">Remover</a>
                                                                                                </div>
											</div>
                                                                                        <div class="control-group">
												<div class="controls">
                                                                                                    <input type="text" name="txtFoto" id="txtFoto"/> 
                                                                                                </div>
											</div>
                                                                                        
										</fieldset>
                                                                                
                                                                                <fieldset title="Información Empresarial">
											<legend class="hide">Datos importantes para el registro.</legend>
											<div class="formSep control-group">
												<label for="txtLogin" class="control-label">Usuario:</label>
												<div class="controls">
                                                                                                        <input type="text" name="txtLogin" id="txtLogin" />
												</div>
											</div>
                                                                                        <div class="formSep control-group">
												<label for="txtCodigoERP" class="control-label">Código ERP:</label>
												<div class="controls">
													 <input type="text" name="txtCodigoERP" id="txtCodigoERP" />
												</div>
											</div>                                                                                 
											<div class="control-group">
												<label class="control-label">Estado:</label>
												<div class="controls">
													<label class="radio inline" for="rbEstado_Activado">
														<input type="radio" value="1" id="newsletter_yes" id="rbEstado" name="rbEstado"> Activo
													</label>
													<label class="radio inline" for="rbEstado_Desactivado">
														<input type="radio" value="0" id="newsletter_no" id="rbEstado" name="rbEstado"> Inactivo
													</label>
												</div>
											</div>
										</fieldset>
                                                                                 <input type="hidden" id="idUsuario"  name="idUsuario" value="0" />
										<button type="button" class="finish btn btn-primary"><i class="icon-ok icon-white"></i> Aceptar</button>
									</form>
                                                                        <button class="btn btn-success" onclick="clear_form()" type="button">Limpiar</button>
								</div>
							</div>
						</div>
					</div>
                    
                    
                    <div class="row-fluid">
                        
                        <div class="span12">
                            <div id="tabla"></div>
                        </div>
                        
                    </div>
                      <!-- Modal Cargando -->	
               <div class="modal hide fade" id="ModalCarga" style="width: 310px; height: 100px;position: fixed;top: 50%;left: 50%;">
                
                     <div class="modal-body">

                         <h3><img src="img/ajax-loader.gif" alt="" /> 
                       Espere un Momento ...</h3>
                        <button id="cerrarCarga" style="display: none;" class="close" data-dismiss="modal"/>
                         <a id="abrirCarga" style="display: none;" data-toggle="modal" data-backdrop="static" href="#ModalCarga"/>
                     </div>
                </div>     
   
                </div>
            </div>
            
            <!-- sidebar -->
			<a href="javascript:void(0)" class="sidebar_switch on_switch ttip_r" title="Hide Sidebar">Sidebar switch</a>
             <div class="sidebar"  id="sidebar"></div>           
            
            <script src="js/jquery.min.js"></script>
			<!-- smart resize event -->
			<script src="js/jquery.debouncedresize.min.js"></script>
			<!-- hidden elements width/height -->
			<script src="js/jquery.actual.min.js"></script>
			<!-- js cookie plugin -->
			<script src="js/jquery.cookie.min.js"></script>
			<!-- main bootstrap js -->
			<script src="bootstrap/js/bootstrap.min.js"></script>
			<!-- tooltips -->
			<script src="lib/qtip2/jquery.qtip.min.js"></script>
			<!-- jBreadcrumbs -->
			<script src="lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min.js"></script>
			<!-- fix for ios orientation change -->
			<script src="js/ios-orientationchange-fix.js"></script>
			<!-- scrollbar -->
			<script src="lib/antiscroll/antiscroll.js"></script>
			<script src="lib/antiscroll/jquery-mousewheel.js"></script>
			<!-- lightbox -->
            <script src="lib/colorbox/jquery.colorbox.min.js"></script>
            <!-- common functions -->
			<script src="js/gebo_common.js"></script>
			  <!-- datepicker -->
                        <script src="lib/datepicker/bootstrap-datepicker.min.js"></script>
                        <!-- sticky messages -->
			<script src="lib/sticky/sticky.min.js"></script>
			<!-- validation -->
			<script src="lib/validation/jquery.validate.min.js"></script>
			<!-- wizard -->
			<script src="lib/stepy/js/jquery.stepy.min.js"></script>
			<!-- wizard functions -->
			<script src="js/gebo_wizard.js"></script>
			<!-- smoke_js -->
			<script src="lib/smoke/smoke.js"></script>
                        <!-- datatable -->
			<script src="lib/datatables/jquery.dataTables.min.js"></script>
			<script>
function modulos()
{
     $.ajax({
            url: 'operaciones/sidebar.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#sidebar').html(data);
            },
            contentType: false,
            processData: false
        });

     $.ajax({
            url: 'operaciones/header.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#header').html(data);
            },
            contentType: false,
            processData: false
        });
};
function getMododulos(posicion)
{
    $.ajax({
            url: 'operaciones/modulos.jsp?posicion='+posicion,
            type: 'POST',
            success: function (data) {  
                     window.location=data;
            },
            contentType: false,
            processData: false
        });
};
                              
function tabla()
{
     $.ajax({
        url: 'operaciones/usuario/list_tabla.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
     function getReporte()
{
     window.location='operaciones/usuario/reporte.jsp';
 };                             
                          
function restablecer(id,nombre)
{
    smoke.confirm('Desea Restablecer contraseña por defecto al usario: '+nombre,function(e){
        if (e){        
            $("#abrirCarga").click();
            $.ajax({
            url: 'operaciones/usuario/restablecer.jsp?id='+id,
            type: 'POST',
            success: function (data) {     
                   
                   if(data==-1)
                     $.sticky("Error al Restaurar.", {autoclose : 5000, position: "top-center" });
                    else if(data==0)
                    {
                        tabla();
                       $.sticky("Se Restablecio Correctamente.", {autoclose : 5000, position: "top-center" });

                   }
                    $('html,body').animate({ scrollTop: $('.main_content').offset().top - 100 }, 'fast');
                     $("#cerrarCarga").trigger("click");
            },
            contentType: false,
            processData: false
            });  
        }
    }, {cancel:"No",ok:"Si"});
};

$(document).ready(function() {
 $( "#Remover" ).hide();
 $( "#txtFoto" ).hide();
 
 $('#archivo').change(function (e) {
    var input=e.target,fr=new FileReader(),
	tipos=/^image\/jpg|image\/jpeg|image\/png|image\/gif$/i;
	if(input.files.length===0)return;
	if(!tipos.test(input.files[0].type)){alert("El archivo selecionado es inválido");return;}
	fr.onload=function(evt){
		var im=evt.target.result;
		redimensionar(im,150,150);
	}
    fr.readAsDataURL(input.files[0]);
});
$( "#Remover" ).click(function() {
    $("#foto").html('<div id="foto"></div>');
    $('#txtFoto').val("");
    $( "#Remover" ).hide();
});

function redimensionar(im,maxWidth,maxHeight){
	var i=new Image();
	i.onload=function(){
		var w=this.width,
		h=this.height,
		scale=Math.min(maxWidth/w,maxHeight/h),
		canvas=document.createElement('canvas'),
		ctx=canvas.getContext('2d');
		canvas.width=w*scale;
		canvas.height=h*scale;
		ctx.drawImage(i,0,0,w*scale,h*scale);
                $("#foto").html('<img class="fileupload-preview thumbnail" src="'+canvas.toDataURL()+'">');
		$('#txtFoto').val(canvas.toDataURL());
                 $( "#Remover" ).show()();
		
	}
	i.src=im;
}
setTimeout('$("html").removeClass("js")',1000);
                                    
$('#txtFNacimiento').datepicker({
 language: 'es'
});
          
});
function clear_form() {
   $('input:radio[name=rbEstado]').attr('checked',false);
    $('#txtNombres').val("");
    $('#txtApellidos').val("");
    $('#txtEmail').val("");
    $('#txtTelefono').val("");
    $('#txtCelular').val("");
    $('#txtFNacimiento').val("");
    $('#txtLogin').val("");
    $('#txtCodigoERP').val("");
    $("#foto").html('<div id="foto"></div>');
    $('#txtFoto').val("");
    $( "#Remover" ).hide();
    $("#idUsuario").val("0");  
    $("#atraz").trigger("click");


};
function edit_form(id,nombres,apellidos,email,telefono,celular,nacimiento,login,codigo,estado) {
    $("#abrirCarga").click();
    $('#txtNombres').val(nombres);
    $('#txtApellidos').val(apellidos);
    $('#txtEmail').val(email);
    $('#txtTelefono').val(telefono);
    $('#txtCelular').val(celular);
    $('#txtFNacimiento').val(nacimiento);
    $('#txtLogin').val(login);
    $('#txtCodigoERP').val(codigo);
    $( "#Remover" ).show();
    $("#idUsuario").val(id);
    if(estado.toLowerCase()=="true")
     $('input:radio[name=rbEstado]')[0].checked = true;
    else
      $('input:radio[name=rbEstado]')[1].checked = true;
      $.ajax({
        url: 'operaciones/usuario/get_foto.jsp?id='+id,
        type: 'POST',
        success: function (data) {     
                 $("#foto").html('<img class="fileupload-preview thumbnail" src="'+data+'">');
                 $('#txtFoto').val(data);
                  $("#cerrarCarga").trigger("click");
        },
        contentType: false,
        processData: false
    });

   
    $('html,body').animate({ scrollTop: $('.main_content').offset().top - 100 }, 'fast');
    $("#atraz").trigger("click");
};
modulos();   
tabla();
                                       

                                       
			</script>
		
		</div>
	</body>
</html>
<%}else  
    response.sendRedirect("index.jsp");%> 