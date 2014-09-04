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
            if(62==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
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
        <!-- jQuery UI theme-->
            <link rel="stylesheet" href="lib/jquery-ui/css/Aristo/Aristo.css" />
        <!-- gebo blue theme-->
            <link rel="stylesheet" href="css/blue.css" id="link_theme" />
        <!-- breadcrumbs-->
            <link rel="stylesheet" href="lib/jBreadcrumbs/css/BreadCrumb.css" />
        <!-- tooltips-->
            <link rel="stylesheet" href="lib/qtip2/jquery.qtip.min.css" />
        <!-- notifications -->
            <link rel="stylesheet" href="lib/sticky/sticky.css" />
        <!-- code prettify -->
            <link rel="stylesheet" href="lib/google-code-prettify/prettify.css" />    
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
	<!-- enhanced select -->
            <link rel="stylesheet" href="lib/chosen/chosen.css" />

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
								<div class="span12">
                                                                    <div class="heading clearfix">
                                                                        <table class="table table-striped table_vam" >
                                                                            <tr>
                                                                                <td >
                                                                                     <select id="cbLineaProduccionProducto" name="cbLineaProduccionProducto" title="Por favor selecione una Linea de Produccion!" required>
                                                                                        <option value="">Selecione una Opción</option>
                                                                                   </select>
                                                                                </td>
                                                                                <td>
                                                                                         <p class="sepH_a">Tiempo Agrupacion de Producción (1+): <strong class="intervalo_val"></strong></p>                                                                                          
                                                                                            <div class="intervalo"></div>
                                                                                            <input type="hidden" name="txtIntervalo" id="txtIntervalo"/>
                                                                                </td>
                                                                                <td>
                                                                                    <span id="totaCajas" class="pull-right label label-info ttip_t" >N Cajas: 0</span>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                           
                                                                                                                                                                  
                                                                       </div>
                                                                        <div id="producto_terminado_linea"></div>

								</div>	
								
							</div>
						</div>
                 </div>
                   <div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span12">
                                                                    <div class="heading clearfix">
                                                                        <table class="table table-striped table_vam" >
                                                                            <tr>
                                                                                <td >
                                                                                     <select id="cbAcumulativoLineaProduccionProducto" name="cbAcumulativoLineaProduccionProducto" title="Por favor selecione una Linea de Produccion!" required>
                                                                                        <option value="">Selecione una Opción</option>
                                                                                   </select>
                                                                                </td>
                                                                                <td>
                                                                                         <p class="sepH_a">Tiempo Agrupacion de Producción (1+): <strong class="intervalo_acumulativo_acumulativo_val"></strong></p>                                                                                          
                                                                                            <div class="intervalo_acumulativo_acumulativo"></div>
                                                                                            <input type="hidden" name="txtIntervaloAcumulativo" id="txtIntervaloAcumulativo"/>
                                                                                </td>
                                                                                <td>
                                                                                    <span id="totaCajasAcumulativas" class="pull-right label label-info ttip_t" >N Cajas: 0</span>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                           
                                                                                                                                                                  
                                                                       </div>
                                                                        <div id="producto_acumulado_terminado_linea"></div>

								</div>	
								
							</div>
						</div>
                 </div>

                </div>
            </div>
            
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
			<!-- bootstrap plugins -->
			<script src="js/bootstrap.plugins.min.js"></script>
			<!-- tooltips -->
			<script src="lib/qtip2/jquery.qtip.min.js"></script>
			<!-- jBreadcrumbs -->
			<script src="lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min.js"></script>
			<!-- sticky messages -->
            <script src="lib/sticky/sticky.min.js"></script>
			<!-- fix for ios orientation change -->
			<script src="js/ios-orientationchange-fix.js"></script>
			<!-- scrollbar -->
			<script src="lib/antiscroll/antiscroll.js"></script>
			<script src="lib/antiscroll/jquery-mousewheel.js"></script>
                        <!-- enhanced select (chosen) -->
                        <script src="lib/chosen/chosen.jquery.min.js"></script>

	  
                           <script src="lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
                           
			<!-- maps functions -->
                        <script src="lib/validation/jquery.validate.min.js"></script>
                         <!-- smoke_js -->
			<script src="lib/smoke/smoke.js"></script>
                        <!-- datatable -->
			<script src="lib/datatables/jquery.dataTables.min.js"></script>
                     
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
var carga=true;
var count_up_val = 0;
	function count_up() {
		count_up_val++;
                if(carga)
                {
                    comboLineaProduccionProducto();
                    comboAcumulativoLineaProduccionProducto(); 
                    carga=false;
                }
                else
                {
                    $.ajax({
                        url: 'operaciones/dia_recepcion/pendiente.jsp',
                        type: 'POST',
                        success: function (data) {     
                                if(data==1)
                                {
                                    comboLineaProduccionProducto();
                                    comboAcumulativoLineaProduccionProducto(); 
                                }
                        },
                        contentType: false,
                        processData: false
                    });
                    
                }
		setTimeout(count_up, (<%=objSession.getObjConfiguracion().getSincro_dash()%>*60000));
	}
	function thread_start(callback) {
		setTimeout(callback, 1);
		return true;
	}
  thread_start(count_up);   
 function comboLineaProduccionProducto()
{
     $.ajax({
        url: 'operaciones/linea_produccion/list_combo_nombre_dinamico.jsp?nombre=LineaProduccionProducto',
        type: 'POST',
        success: function (data) {     
                 $('#cbLineaProduccionProducto').html(data);
                 $('#cbLineaProduccionProducto option[value=]').text('Todas las Lineas de Producción');
                 $('#cbLineaProduccionProducto option[value=]').val(0);
                 $("#cbLineaProduccionProducto").change();
        },
        contentType: false,
        processData: false
    });          
 };

function comboAcumulativoLineaProduccionProducto()
{
     $.ajax({
        url: 'operaciones/linea_produccion/list_combo_nombre_dinamico.jsp?nombre=AcumulativoLineaProduccionProducto',
        type: 'POST',
        success: function (data) {     
                 $('#cbAcumulativoLineaProduccionProducto').html(data);
                 $('#cbAcumulativoLineaProduccionProducto option[value=]').text('Todas las Lineas de Producción');
                 $('#cbAcumulativoLineaProduccionProducto option[value=]').val(0);
                 $("#cbAcumulativoLineaProduccionProducto").change();
        },
        contentType: false,
        processData: false
    });          
 };

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
            success: function () {     
                     modulos();
            },
            contentType: false,
            processData: false
        });
};
   
 function getGraficoCardioProduccion()
{
    
         $('#producto_terminado_linea').html('<center id="producto_terminado_linea"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>');
   
        $.ajax({
            url: 'operaciones/graficos/cardio_producto_terminado_linea.jsp?id='+ $("select#cbLineaProduccionProducto").val()+"&intervalo="+$('input#txtIntervalo').val(),
            type: 'POST',
            success: function (data) {     
                     $('#producto_terminado_linea').html(data);
            },
            contentType: false,
            processData: false
        });
};     
function getGraficoCardioAcumulativoProduccion()
{
    
         $('#producto_acumulado_terminado_linea').html('<center id="producto_acumulado_terminado_linea"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>');
   
        $.ajax({
            url: 'operaciones/graficos/cardio_acumulativo_producto_terminado_linea.jsp?id='+ $("select#cbAcumulativoLineaProduccionProducto").val()+"&intervalo="+$('input#txtIntervaloAcumulativo').val(),
            type: 'POST',
            success: function (data) {     
                     $('#producto_acumulado_terminado_linea').html(data);
            },
            contentType: false,
            processData: false
        });
};   
$(document).ready(function() {
    
  //slider intervalo   
    $( ".intervalo" ).slider({
            value:<%=objSession.getObjConfiguracion().getIntervalo_agrupacion_produccion()%>,
            min: 1,
            max: 60,
            step: 1,
            slide: function( event, ui ) {
                    $( ".intervalo_val" ).text( ui.value );
                    $( "#txtIntervalo" ).val( ui.value );
            }
    });
    $( ".intervalo_val" ).text( $( ".intervalo" ).slider( "value" ) );
    $( "#txtIntervalo" ).val( $( ".intervalo" ).slider( "value" ) );
    
     //slider intervalo_acumulativo_acumulativo   
    $( ".intervalo_acumulativo_acumulativo" ).slider({
            value:<%=objSession.getObjConfiguracion().getIntervalo_agrupacion_produccion()%>,
            min: 1,
            max: 60,
            step: 1,
            slide: function( event, ui ) {
                    $( ".intervalo_acumulativo_acumulativo_val" ).text( ui.value );
                    $( "#txtIntervaloAcumulativo" ).val( ui.value );
            }
    });
    $( ".intervalo_acumulativo_acumulativo_val" ).text( $( ".intervalo_acumulativo_acumulativo" ).slider( "value" ) );
    $( "#txtIntervaloAcumulativo" ).val( $( ".intervalo_acumulativo_acumulativo" ).slider( "value" ) );
    $('#cbLineaProduccionProducto').on('change', function() {
        
            getGraficoCardioProduccion();
           // alert();
    });
        
    $('#cbAcumulativoLineaProduccionProducto').on('change', function() {
        
            getGraficoCardioAcumulativoProduccion();
           // alert();
    });
    
    //* show all elements & remove preloader
    setTimeout('$("html").removeClass("js")',1000);
    
       
        
       
        
        
        
		
		
 
});
 modulos();   

</script>
		
		</div>
	</body>
</html>
<%}else  
    response.sendRedirect("index.jsp");%>     