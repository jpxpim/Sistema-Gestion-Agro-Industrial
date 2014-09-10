<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>
<%@page import="Entidades.entUsuario"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entProductor"%>
<%@page import="java.util.List"%>
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
            if(46==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
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
                                         <form  method="get" id="reg_form">
                                            <div class="span4">
                                                <h3 class="heading">Sistema</h3>  
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">   
                                                                                    <div class="input-prepend">
                                                                                        <p class="sepH_a">Tiempo de Alerta (1m+): <strong class="alerta_val"></strong></p>
                                                                                        <br>
                                                                                        <div class="alerta"></div>
                                                                                        <input type="hidden" name="txtAlerta" id="txtAlerta"/>                                                                                  
                                                                                    </div> 
                                                                                     <br><br>
                                                                                    <div class="input-prepend">
                                                                                        <p class="sepH_a">Sincronización de Control Maestro (1m+): <strong class="sincronizacion_val"></strong></p>
                                                                                        <br>
                                                                                        <div class="sincronizacion"></div>
                                                                                        <input type="hidden" name="txtSincronizacion" id="txtSincronizacion"/>                                                                             
                                                                                    </div> 
                                                                                      <br><br>
                                                                                    <div class="input-prepend">
                                                                                            <p class="sepH_a">Tiempo Agrupacion de Producción (1m+): <strong class="intervalo_val"></strong></p>
                                                                                            <br>
                                                                                            <div class="intervalo"></div>
                                                                                            <input type="hidden" name="txtIntervalo" id="txtIntervalo"/>

                                                                                    </div>
                                                                                      <br><br>
                                                                                     <div class="input-prepend">
                                                                                    <label>Clave por Defecto de Usuarios</label>
                                                                                    <input type="text" class="span10" id="txtClave" name="txtClave" value='<%=objSession.getObjConfiguracion().getUsuario_clave()%>' />
                                                                                    </div>
                                                                          </div>


                                                               
                                                            </div>
                                                    </div>
                                            </div>
                                             <div class="span4">
                                                 <h3 class="heading">Conexion</h3>  
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                            <div class="formSep">  
                                                                                    <div class="input-prepend">
                                                                                    <label>Nombre de BD ERP Externa</label>
                                                                                    <input type="text" class="span10" id="txtNombreBD" name="txtNombreBD" value='<%=objSession.getObjConfiguracion().getNom_bd_erp_ext()%>'/>
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>IP de BD ERP Externa</label>
                                                                                    <input type="text" class="span10" id="txtIPBD"  name="txtIPBD" value='<%=objSession.getObjConfiguracion().getIp_bd_erp_ext()%>'/>
                                                                                     </div> 
                                                                                    <div class="input-prepend">
                                                                                    <label>Puerto ERP Externa</label>
                                                                                    <input type="text" class="span10" id="txtPuertoBD"  name="txtPuertoBD" value='<%=objSession.getObjConfiguracion().getPuerto_erp_ext()%>'/>
                                                                                     </div> 
                                                                                    <div class="input-prepend">
                                                                                    <label>Usuario de BD ERP Externa</label>
                                                                                    <input type="text" class="span10" id="txtUsuarioBD"  name="txtUsuarioBD" value='<%=objSession.getObjConfiguracion().getUsuario_bd_erp_ext()%>'/>
                                                                                     </div> 
                                                                                    <div class="input-prepend">
                                                                                    <label>Contraseña de BD ERP Externa</label>
                                                                                    <input type="text" class="span10" id="txtContraseniaBD"  name="txtContraseniaBD" value='<%=objSession.getObjConfiguracion().getContra_bd_erp_ext()%>'/>
                                                                                     </div> 
                                                                            </div>
                                                                            <button class="btn btn-invert" type="submit">Guardar Todo</button>

                                                                          </div>


                                                               
                                                            </div>
                                                    </div>
                                            </div>
                                             <div class="span4">
                                                 <h3 class="heading">Empresa</h3>  
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                <div class="location_add_form well">
                                                                     <div class="input-prepend">
                                                                        <label>Empresa Productora</label>
                                                                        <select id="cbEmpresa" name="cbEmpresa" title="Por favor selecione una Empresa!" required data-placeholder="selecione una Empresa...">
									<option value=""></option> 
                                                                        <%   
                                                                            List<entProductor> list=clsGestor.ListarProductor(true);
                                                                            if(list!=null)for(entProductor entidad : list)
                                                                                if(objSession.getObjConfiguracion().getProductor_empresa()==entidad.getId_productor())
                                                                                    out.print("<option value='"+entidad.getId_productor()+"' selected>"+entidad.getNombre()+"</option>");
                                                                                else
                                                                                    out.print("<option value='"+entidad.getId_productor()+"'>"+entidad.getNombre()+"</option>");
                                                                        %>
                                                                        </select>
                                                                     </div>  
                                                                    <div class="input-prepend">
                                                                        <label>Usuario Principal Inicio y Cierre (Día de Producción)</label>
                                                                        <select id="cbUsuario1" name="cbUsuario1" title="Por favor selecione Usuario Principal!" required data-placeholder="selecione Usuario Principal...">
									<option value=""></option> 
                                                                            <%   
                                                                            List<entUsuario> listUsuario=clsGestor.ListarUsuario(true);
                                                                            if(listUsuario!=null)for(entUsuario entidad : listUsuario)
                                                                                if(objSession.getObjConfiguracion().getUsuario_cierre_recepcion_1()==entidad.getId_usuario())
                                                                                    out.print("<option value='"+entidad.getId_usuario()+"' selected>"+entidad.getApellido()+"c"+entidad.getNombre()+"</option>");
                                                                                else
                                                                                    out.print("<option value='"+entidad.getId_usuario()+"'>"+entidad.getApellido()+"c"+entidad.getNombre()+"</option>");
                                                                            %>
                                                                        </select>
                                                                        
                                                                     </div>  
                                                                        <div class="input-prepend">
                                                                        <label>Usuario Secundario 1 Inicio y Cierre (Día de Producción)</label>
                                                                        <select id="cbUsuario2" name="cbUsuario2" data-placeholder="selecione Usuario Secundario...">
									<option value=""></option> 
                                                                            <%   
                                                                            if(listUsuario!=null)for(entUsuario entidad : listUsuario)
                                                                                if(objSession.getObjConfiguracion().getUsuario_cierre_recepcion_2()==entidad.getId_usuario())
                                                                                    out.print("<option value='"+entidad.getId_usuario()+"' selected>"+entidad.getApellido()+"c"+entidad.getNombre()+"</option>");
                                                                                else
                                                                                    out.print("<option value='"+entidad.getId_usuario()+"'>"+entidad.getApellido()+"c"+entidad.getNombre()+"</option>");
                                                                            %>
                                                                        </select>
                                                                        
                                                                     </div>  
                                                                        <div class="input-prepend">
                                                                        <label>Usuario Secundario 2 Inicio y Cierre (Día de Producción)</label>
                                                                        <select id="cbUsuario3" name="cbUsuario3" data-placeholder="selecione Usuario Secundario...">
									<option value=""></option> 
                                                                            <%   
                                                                            if(listUsuario!=null)for(entUsuario entidad : listUsuario)
                                                                                if(objSession.getObjConfiguracion().getUsuario_cierre_recepcion_3()==entidad.getId_usuario())
                                                                                    out.print("<option value='"+entidad.getId_usuario()+"' selected>"+entidad.getApellido()+"c"+entidad.getNombre()+"</option>");
                                                                                else
                                                                                    out.print("<option value='"+entidad.getId_usuario()+"'>"+entidad.getApellido()+"c"+entidad.getNombre()+"</option>");
                                                                            %>
                                                                        </select>
                                                                        
                                                                     </div>  
                                                                    
                                                                   
                                                                </div>
                                                            </div>
                                                    </div>
                                            </div>
                                             
                                             
                                         </form>
                                           
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

                            <script src="js/gebo_common.js"></script>
                           <script src="lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
                           
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
            success: function () {     
                     modulos();
            },
            contentType: false,
            processData: false
        });
};                           

                        
                           modulos(); 
                           
				$(document).ready(function() {
					//* show all elements & remove preloader
                                        
                                        setTimeout('$("html").removeClass("js")',1000);
                                        
                                         $("#cbEmpresa").chosen({
                                            allow_single_deselect: true
                                            });
                                            
                                            $("#cbUsuario1").chosen({
                                            allow_single_deselect: true
                                            });
                                            
                                            $("#cbUsuario2").chosen({
                                            allow_single_deselect: true
                                            });
                                            
                                            $("#cbUsuario3").chosen({
                                            allow_single_deselect: true
                                            });
                                            
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
                                        //slider sincronizacion
                                        $( ".sincronizacion" ).slider({
                                                value:<%=objSession.getObjConfiguracion().getSincro_dash()%>,
                                                min: 1,
                                                max: 15,
                                                step: 1,
                                                slide: function( event, ui ) {
                                                        $( ".sincronizacion_val" ).text(ui.value );
                                                        $( "#txtSincronizacion" ).val( ui.value );
                                                }
                                        });
                                        $( ".sincronizacion_val" ).text( $( ".sincronizacion" ).slider( "value" ) );
                                        $( "#txtSincronizacion" ).val($( ".sincronizacion" ).slider( "value" ) );
                                        //slider alerta
                                       $( ".alerta" ).slider({
                                                value:<%=objSession.getObjConfiguracion().getTiempo_alerta()%>,
                                                min: 1,
                                                max: 15,
                                                step: 1,
                                                slide: function( event, ui ) {
                                                        $( ".alerta_val" ).text( ui.value );
                                                        $( "#txtAlerta" ).val(  ui.value );
                                                }
                                        });
                                        $( ".alerta_val" ).text(  $( ".alerta" ).slider( "value" ) );
                                        $( "#txtAlerta" ).val(  $( ".alerta" ).slider( "value" ) );
                                    
                        
                        
                        
                                        
                                      $('#reg_form').validate({
                                        lang: 'es',
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
                                        ignore: ":hidden:not(select)",
                                            submitHandler: function() {       
                                                       $("#abrirCarga").click();
                                                    var url = "operaciones/configuracion/insert.jsp"; 

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
                                                               
                                                                 $("#cerrarCarga").trigger("click");
                                                           }
                                                         });    
                                            },
					rules: {
						txtNombreBD: { required: true, minlength: 3 },
                                                txtIPBD: { required: true, minlength: 3 },
                                                txtClave: { required: true, minlength: 6 },
                                                txtContraseniaBD: { required: true, minlength: 4 },
                                                txtUsuarioBD: { required: true, minlength: 2 },
                                                txtPuertoBD: { required: true, minlength: 1, digits: true }
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
                                          $('#txtNombreBD').val("");
                                          $('#txtPuertoBD').val("");
                                            $('#txtIPBD').val("");
                                        
                                          $("#IdVivero").val("0");  
                                     
                                           
                                      };
                                       function edit_form(id,nombre,descripcion,codigo,estado) {
                                            $('#txtNombreBD').val(nombre);
                                            $('#txtIPBD').val(descripcion);
                                            $('#IdVivero').val(id);
                                             $('#txtPuertoBD').val(codigo);
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