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
    entFormulario formPadre=null;
    boolean pagina=false;
    int posJ=objSession.getListModulos().get(objSession.getPosicion()).getList().size();
        for(int j=0;j<posJ;j++)
        {
            if(16==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
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
                                    <a href="#"><%=formHijo.getObjModulo().getEtiqueta()%></a>
                                </li>
                                <%
                                    if(formPadre==null)
                                    {
                                        out.print("<li><a href='#'>"+formHijo.getEtiqueta()+"</a></li>");
                                        
                                    }
                                    else
                                    {
                                        out.print("<li><a href="+formPadre.getUrl()+">"+formPadre.getEtiqueta()+"</a></li>");
                                        out.print("<li>"+formHijo.getEtiqueta()+"</li>");
                                    }
                                %>     
                            </ul>
                        </div>
                    </nav>
                
                    <div class="row-fluid">
                            <div class="span12">
                                    <div class="row-fluid">
                                            <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                      <form  method="get" id="reg_form">
                                                                          <div class="location_add_form well">
                                                                            <div class="formSep">
                                                                                    <div class="input-prepend">
                                                                                    <label>Nombre</label>
                                                                                    <input type="text" class="span10" id="txtNombre" name="txtNombre" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Descripcion</label>
                                                                                    <input type="text" class="span10" id="txtDescripcion"  name="txtDescripcion" />
                                                                                     </div> 
                                                                                    <div class="input-prepend">
                                                                                    <label>Codigo de Control</label>
                                                                                    <input type="text" class="span10" id="txtCodigo"  name="txtCodigo" />
                                                                                     </div>  
                                                                                     <div class="input-prepend">
                                                                                    <label>Estado</label>
                                                                                    <label class="radio inline">
                                                                                    <input type="radio" value="1"  id="rbEstado" name="rbEstado" />
                                                                                        Activo
                                                                                    </label>
                                                                                    <label class="radio inline">
                                                                                            <input type="radio" value="0" id="rbEstado" name="rbEstado" />
                                                                                            Inactivo
                                                                                    </label>
                                                                                     </div>
                                                                                <input type="hidden" id="IdVivero"  name="IdVivero" value="0" />

                                                                            </div>
                                                                            <button class="btn btn-invert" type="submit">Grabar</button>

                                                                            <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
                                                                          </div>


                                                                </form>
                                                            </div>
                                                    </div>
                                            </div>	
                                            <div class="span8">
                                                <div id="tabla">
                                                  
                                                </div>
                                            </div>
                                    </div>
                                            </div>
                            </div>
                        </div>
	
               <!-- Modal Cargando -->	
               <div class="modal hide fade" id="ModalCarga" style="width: 310px; height: 100px;position: fixed;top: 50%;left: 50%;">
                
                     <div class="modal-body">

                         <h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3>
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
        url: 'operaciones/vivero/list_tabla.jsp',
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
     window.location='operaciones/vivero/reporte.jsp';
 };
                              
                           modulos(); 
                                       tabla();
                            
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
						txtNombre: { required: true, minlength: 3 },
                                                txtDescripcion: { required: true, minlength: 3 },
                                                txtCodigo: { required: true, minlength: 2 },
                                                rbEstado: { required: true }
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
		
		</div>
	</body>
</html>
<%}else  
    response.sendRedirect("index.jsp");%> 