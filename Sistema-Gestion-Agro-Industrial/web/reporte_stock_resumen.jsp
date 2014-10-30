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
    int posJ=objSession.getListModulos().get(objSession.getPosicion()).getList().size();
        for(int j=0;j<posJ;j++)
        {
            if(85==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
            {
                formHijo=objSession.getListModulos().get(objSession.getPosicion()).getList().get(j);
                formHijo.setObjModulo(objSession.getListModulos().get(objSession.getPosicion()));
                j=posJ;
            }
        }
if(formHijo==null)
    response.sendRedirect("intranet.jsp");
else{
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
                                    <a href="<%=formHijo.getObjModulo().getUrl()%>"><%=formHijo.getObjModulo().getEtiqueta()%></a>
                                </li>
                                <li><%=formHijo.getEtiqueta()%></li>
                            </ul>
                        </div>
                    </nav>
                
                    <div class="row-fluid">
                        <div class="span2"></div>
                            <div class="span8">
                                <table class="table table-striped table_vam" >
                                <tr>
                                    <td >
                                         <select id="cbPosicion" name="cbPosicion" required>
                                            <option value="0">Paletas(Paletizado,Tunel y Camara)</option>
                                            <option value="1">Paletas en Paletizado</option>
                                            <option value="2">Paletas en Tunel</option>
                                            <option value="3">Paletas en Camara</option>
                                       </select>
                                    </td>
                                    <td >
                                         <select id="cbEstado" name="cbEstado" required>
                                            <option value="0">Paletas(Completas e Incompletas)</option>
                                            <option value="1">Paletas Completas</option>
                                            <option value="2">Paletas Incompletas</option>
                                       </select>
                                    </td>
                                    <td >
                                         <select id="cbLote" name="cbLote" required>
                                            <option value="0"></option>
                                       </select>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td >
                                       <select id="cbVariedad" name="cbVariedad" required>
                                           <option value="0"></option>
                                       </select>
                                    </td>
                                    <td >
                                         <select id="cbEnvase" name="cbEnvase" required>
                                             <option value="0"></option>
                                       </select>
                                    </td>
                                    <td >
                                         <select id="cbCalibre" name="cbCalibre" required>
                                           <option value="0"></option>
                                       </select>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td >
                                         <select id="cbCliente" name="cbCliente" required>
                                             <option value="0"></option>
                                       </select>
                                    </td>
                                    <td >
                                         <select id="cbCategoria" name="cbCategoria" required>
                                             <option value="0"></option>
                                       </select>
                                    </td>
                                    <td >
                                         <select id="cbProductor" name="cbProductor" required>
                                           <option value="0"></option>
                                       </select>
                                    </td>
                                </tr>
                            </table>
                                                                           
                            </div>
                         <div class="span2"></div>
                    </div>
                    <div class="row-fluid">
                            <div class="span12">
                                <div id="tabla"></div>
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
comboLote();
 function comboLote()
{
     $.ajax({
        url: 'operaciones/lote/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbLote').html(data);
                 $('#cbLote option[value=]').text('Todas los Lotes');
                 $('#cbLote option[value=]').val(0);
                 
        },
        contentType: false,
        processData: false
    });          
 };
 comboVariedad();
  function comboVariedad()
{
     $.ajax({
        url: 'operaciones/variedad/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbVariedad').html(data);
                 $('#cbVariedad option[value=]').text('Todas las Variedades');
                 $('#cbVariedad option[value=]').val(0);
        },
        contentType: false,
        processData: false
    });          
 };
comboEnvase();
function comboEnvase()
{
     $.ajax({
        url: 'operaciones/envase/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbEnvase').html(data);
                 $('#cbEnvase option[value=]').text('Todos los Envases');
                 $('#cbEnvase option[value=]').val(0);
        },
        contentType: false,
        processData: false
    });          
 };
 comboCalibre();
function comboCalibre()
{
     $.ajax({
        url: 'operaciones/calibre/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbCalibre').html(data);
                 $('#cbCalibre option[value=]').text('Todos los Calibres');
                 $('#cbCalibre option[value=]').val(0);
        },
        contentType: false,
        processData: false
    });          
 };
  comboCliente();
function comboCliente()
{
     $.ajax({
        url: 'operaciones/cliente/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbCliente').html(data);
                 $('#cbCliente option[value=]').text('Todos los Clientes');
                 $('#cbCliente option[value=]').val(0);
        },
        contentType: false,
        processData: false
    });          
 };
   comboCategoria();
function comboCategoria()
{
     $.ajax({
        url: 'operaciones/categoria/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbCategoria').html(data);
                 $('#cbCategoria option[value=]').text('Todas las Categorias');
                 $('#cbCategoria option[value=]').val(0);
        },
        contentType: false,
        processData: false
    });          
 };
   comboProductor();
function comboProductor()
{
     $.ajax({
        url: 'operaciones/productor/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbProductor').html(data);
                 $('#cbProductor option[value=]').text('Todos los Productores');
                 $('#cbProductor option[value=]').val(0);
        },
        contentType: false,
        processData: false
    });          
 };
function tabla()
{
    $('#tabla').html('<center id="tabla"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>');
   
     $.ajax({
       url: 'operaciones/reporte/stock_resumen.jsp?cbPosicion='+$("select#cbPosicion").val()
                +'&cbEstado='+$("select#cbEstado").val()+'&cbLote='+$("select#cbLote").val()
                +'&cbVariedad='+$("select#cbVariedad").val()+'&cbEnvase='+$("select#cbEnvase").val()
                +'&cbCalibre='+$("select#cbCalibre").val()+'&cbCliente='+$("select#cbCliente").val()
                +'&cbCategoria='+$("select#cbCategoria").val()+'&cbProductor='+$("select#cbProductor").val(),
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
                                        
                               
                                $('#cbPosicion').on('change', function() {
                                        tabla();
                                });
                                $('#cbEstado').on('change', function() {
                                        tabla();
                                });
                                $('#cbLote').on('change', function() {
                                        tabla();
                                });
                                $('#cbVariedad').on('change', function() {
                                        tabla();
                                });
                                $('#cbEnvase').on('change', function() {
                                        tabla();
                                });
                                $('#cbCalibre').on('change', function() {
                                        tabla();
                                });
                                $('#cbCliente').on('change', function() {
                                        tabla();
                                });
                                $('#cbCategoria').on('change', function() {
                                        tabla();
                                });
                                $('#cbProductor').on('change', function() {
                                        tabla();
                                });
                                   
                                        
				});
			</script>
		
		</div>
	</body>
</html>
<%}}else  
    response.sendRedirect("index.jsp");%> 