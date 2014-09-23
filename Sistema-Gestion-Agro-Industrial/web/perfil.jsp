<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{    
   SimpleDateFormat e=new SimpleDateFormat("dd/MM/yyyy");
   BASE64Encoder img = new BASE64Encoder();
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
        <!-- colorbox -->
            <link rel="stylesheet" href="lib/colorbox/colorbox.css" />	
		    
        <!-- main styles -->
            <link rel="stylesheet" href="css/style.css" />
			
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
                                    <a href="#">Mi Perfil</a>
                                </li>                               
                               
                            </ul>
                        </div>
                    </nav>
                
                    <div class="row-fluid">
						<div class="span12">
							<h3 class="heading">Perfil de Usuario Id : <%=objSession.getObjUsuario().getId_usuario()%></h3>
							<div class="row-fluid">
								<div class="span12">
									<div class="vcard">
                                                                                 <img  class="thumbnail" style="height:120px;width:120px"  src="data:image/png;base64,<%=img.encodeBuffer(objSession.getObjUsuario().getFoto())%>">
										<ul>
											<li class="v-heading">
												Datos Personales
											</li>
                                                                                        <li>
												<span class="item-key">Codigo</span>
												<div class="vcard-item"><%=objSession.getObjUsuario().getCodigo_erp()%></div>
											</li>
											<li>
												<span class="item-key">Nombres</span>
												<div class="vcard-item"><%=objSession.getObjUsuario().getNombre()%></div>
											</li>
                                                                                        <li>
												<span class="item-key">Apellidos</span>
												<div class="vcard-item"><%=objSession.getObjUsuario().getApellido()%></div>
											</li>
											<li>
												<span class="item-key">Usuario</span>
												<div class="vcard-item"><%=objSession.getObjUsuario().getLogin()%></div>
											</li>
											<li>
												<span class="item-key">Email</span>
												<div class="vcard-item"><%=objSession.getObjUsuario().getEmail()%></div>
											</li>
											<li>
												<span class="item-key">F.Nacimiento</span>
                                                                                                <div class="vcard-item"><%=e.format(objSession.getObjUsuario().getFecha_nacimiento())%></div>
											</li>
											<li>
												<span class="item-key">Telefono</span>
												<div class="vcard-item"><%=objSession.getObjUsuario().getTelefono()%></div>
											</li>
                                                                                        <li>
												<span class="item-key">Celular</span>
												<div class="vcard-item"><%=objSession.getObjUsuario().getCelular()%></div>
											</li>
                                                                                   
										</ul>
									</div>
								</div>
							</div>	
						</div>
                        </div>
					
                        <div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span12">
                                                                    <form  method="get" id="reg_form">
									<div class="vcard">
										<ul>
											<li class="v-heading">
												Cambiar Contraseña      
											</li>
                                                              
                                                                                        <li>
												<span class="item-key">Contraseña Actual</span>
												<div class="vcard-item">
                                                                                                    <input type="password" class="span3" id="txtCActual"  name="txtCActual" />                                                                                    
                                                                                                </div>
											</li>
                                                                                         <li>
												<span class="item-key">Contraseña Nueva</span>
												<div class="vcard-item">
                                                                                                    <input type="password" class="span3" id="txtCNuevo"  name="txtCNuevo" />                                                                                    
                                                                                                </div>
											</li>
                                                                                         <li>
												<span class="item-key">Repe. Contraseña</span>
												<div class="vcard-item">
                                                                                                    <input type="password" class="span3" id="txtCRepetida"  name="txtCRepetida" />                                                                                    
                                                                                                </div>
											</li>
                                                                                        <li>
                                                                                            <span class="item-key"></span>
												<div class="vcard-item"> 
                                                                                                    <button class="btn btn-invert" type="submit">Cambiar Contraseña</button>
                                                                                                </div>
                                                                                            
                                                                                        </li>
                                                                                         
										</ul>
									</div>
                                                                    </form>
                                                                </div>
							</div>	
						</div>
                        </div>                                                                  
                </div>
            </div><!-- Modal Cargando -->	
               <div class="modal hide fade" id="ModalCarga" style="width: 310px; height: 100px;position: fixed;top: 50%;left: 50%;">
                
                     <div class="modal-body">

                         <h3><img src="img/ajax-loader.gif" alt="" /> 
                       Espere un Momento ...</h3>
                        <button id="cerrarCarga" style="display: none;" class="close" data-dismiss="modal"/>
                         <a id="abrirCarga" style="display: none;" data-toggle="modal" data-backdrop="static" href="#ModalCarga"/>
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
			<!-- sticky messages -->
			<script src="lib/sticky/sticky.min.js"></script>
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
	

			<!-- maps functions -->
                        <script src="lib/validation/jquery.validate.min.js"></script>
                         <!-- smoke_js -->
			<script src="lib/smoke/smoke.js"></script>
                        
	
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
   
                            
$(document).ready(function() {
    //* show all elements & remove preloader
    setTimeout('$("html").removeClass("js")',1000);
     $('#reg_form').validate({
                                        lang: 'es',
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
                                            submitHandler: function() {       
                                                       $("#abrirCarga").click();
                                                    var url = "operaciones/usuario/contrasena.jsp"; 

                                                    $.ajax({
                                                           type: "POST",
                                                           url: url,
                                                           data: $("#reg_form").serialize(), 
                                                           success: function(data)
                                                           {
                                                               if(data==-1)
                                                                 $.sticky("Tu Contraseña Actual no Coincide", {autoclose : 5000, position: "top-center" });
                                                                else if(data==0)
                                                                {
                                                                   $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                                                    
                                                               }
                                                                else if(data==1)
                                                                {
                                                                    $('#txtCRepetida').val("");
                                                                    $('#txtCNuevo').val("");
                                                                    $('#txtCActual').val("");
                                                                   $.sticky("Tu nueva Contraseña se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  
                                                                   
                                                                }
                                                                 $("#cerrarCarga").trigger("click");
                                                           }
                                                         });    
                                            },
					rules: {
						txtCActual: { required: true, minlength: 6 },
                                                txtCNuevo: { required: true, minlength: 6 },
                                                txtCRepetida: { required: true, minlength: 6,equalTo: "#txtCNuevo" }
					},
                                         messages: {
                                            'txtCRepetida' : {  equalTo:'Debe coincidir con la contraseña nueva'},
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
 modulos();                               
</script>
		
		</div>
	</body>
</html>
<%}else  
    response.sendRedirect("index.jsp");%>     