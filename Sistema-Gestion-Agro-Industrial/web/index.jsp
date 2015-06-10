<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>

<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession==null)
{
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
        <!-- theme color-->
            <link rel="stylesheet" href="css/blue.css" />
        <!-- tooltip -->    
			<link rel="stylesheet" href="lib/qtip2/jquery.qtip.min.css" />
        <!-- main styles -->
            <link rel="stylesheet" href="css/style.css" />
    
        <!-- Favicons and the like (avoid using transparent .png) -->
            <link rel="shortcut icon" href="favicon.ico" />
            <link rel="apple-touch-icon-precomposed" href="icon.png" />
    
        <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
        <!-- smoke_js -->
            <link rel="stylesheet" href="lib/smoke/themes/gebo.css" />
        <!--[if lte IE 8]>
            <script src="js/ie/html5.js"></script>
			<script src="js/ie/respond.min.js"></script>
        <![endif]-->
		
    <!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  --></head>
    <body class="login_page">
		
		<div class="login_box">
			
			<form id="login_form">
				<div class="top_b">Sistema Gestión Agrícola</div>    
				<div class="alert alert-info alert-login">
					Ingrese usuario y la contraseña.
				</div>
				<div class="cnt_b">
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span><input type="text" id="username" name="username" placeholder="Usuario" />
						</div>
					</div>
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span><input type="password" id="password" name="password" placeholder="Contraseña" />
						</div>
					</div>					
				</div>
				<div class="btm_b clearfix">
					<button class="btn btn-inverse pull-right" type="submit">Ingresar</button>
				</div>  
			</form>
				<!-- Modal Cargando -->	
     	
			
               <div id="myModal" class="modal hide fade" style="width:260px; height:70; margin: 0;position: absolute;top: 10%;left: 40%;"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-body">
                        <div class="row-fluid">
                            <center><h4><img width="60" height="60" src="img/ajax-loader.gif" alt=""/> Espere un Momento..<span class="semi-bold">...</span></h4></center>
                        </div>
                    </div>
                </div>                
                                
                                
		</div>
		

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.actual.min.js"></script>
        <script src="lib/validation/jquery.validate.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- smoke_js -->
			<script src="lib/smoke/smoke.js"></script>
		<!-- sticky messages -->
        <script>
            $(document).ready(function(){
                

				//* validation
				$('#login_form').validate({
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
					rules: {
						username: { required: true},
						password: { required: true }
					},
                                        submitHandler: function() {                                        
                                              $("#myModal").modal('show');           
                                            var url = "operaciones/sesion/login.jsp"; 

                                            $.ajax({
                                                   type: "POST",
                                                   url: url,
                                                   data: $("#login_form").serialize(), 
                                                   success: function(data)
                                                   {
                                                        $('#myModal').modal('hide');
                                                       if(data==2)
                                                       {
                                                            window.location='intranet.jsp'; 

                                                       }else if(data==1)
                                                       {
                                                           smoke.alert("Usuario Desactivado.");
                                                           e.preventDefault();
                                                       }else if(data==0)
                                                       {
                                                           smoke.alert("Error de Credenciales.");
                                                           e.preventDefault();
                                                       }else if(data==-1)
                                                       {
                                                           smoke.alert("Problemas con el Sevidor intentelo mas tarde.");
                                                           e.preventDefault();
                                                       }


                                                   }
                                                 });    
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
        </script>
    </body>
</html>
<%}else  
    response.sendRedirect("intranet.jsp");%>   