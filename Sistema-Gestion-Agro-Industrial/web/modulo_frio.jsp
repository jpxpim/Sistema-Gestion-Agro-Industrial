<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>
<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(objSession.getListModulos()==null)
        response.sendRedirect("intranet.jsp");
    

    int posJ=objSession.getListModulos().size();
    int pos=-1;
        for(int j=0;j<posJ;j++)
        {
            if(8==objSession.getListModulos().get(j).getId_modulo())
            {
                pos=j;
                j=posJ;
            }
        }
if(pos==-1)
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
                                <li><%=objSession.getListModulos().get(pos).getEtiqueta()%></li>
                            </ul>
                        </div>
                    </nav>
                 <div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span6">
									<h3 class="heading">Número de Hectáreas por Año de Siembra</h3>  
                                                               <div id="barras_hectareas_anio"></div>
								</div>	
								<div class="span6">
                                                              <h3 class="heading">Porcentaje de Hectáreas por Variedad</h3>  
                                                              <div id="pie_hectareas_variedad"></div>
                                                              
								</div>
							</div>
						</div>
                        </div>
                    
                     <div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span6">
									

                                                                        <div id="prueba"></div>

								</div>	
								
							</div>
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
                     
                     <!-- charts -->
			<script src="lib/flot/jquery.flot.min.js"></script>
			<script src="lib/flot/jquery.flot.resize.min.js"></script>
			<script src="lib/flot/jquery.flot.pie.min.js"></script>
			<script src="lib/flot/jquery.flot.curvedLines.min.js"></script>
			<script src="lib/flot/jquery.flot.orderBars.min.js"></script>
			<script src="lib/flot/jquery.flot.multihighlight.min.js"></script>
			<script src="lib/flot/jquery.flot.pyramid.min.js"></script>
                     <script src="lib/flot/jquery.flot.axislabels.js"></script>
			<script src="lib/moment_js/moment.min.js"></script>
			<!-- charts functions -->
                        
	
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
    $.ajax({
            url: 'operaciones/graficos/barras_hectarias_anio.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#barras_hectareas_anio').html(data);
            },
            contentType: false,
            processData: false
        });
        $.ajax({
            url: 'operaciones/graficos/pie_hectareas_variedad.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#pie_hectareas_variedad').html(data);
            },
            contentType: false,
            processData: false
        });
        
        $.ajax({
            url: 'operaciones/graficos/prueba.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#prueba').html(data);
            },
            contentType: false,
            processData: false
        });
        
        
        
        
		
		
 
});
 modulos();                               
</script>
		
		</div>
	</body>
</html>
<%}}else  
    response.sendRedirect("index.jsp");%>     