<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>

<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entUsuario"%>
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
    int posJ=objSession.getListModulos().get(objSession.getPosicion()).getList().size();
        for(int j=0;j<posJ;j++)
        {
            if(3==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
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
						<div class="span12">
							<div class="row-fluid">
                                                            
                                                                
                                                            
								<div class="span4" id="user-list">
                                                                     <h3 class="heading">Elegir Usuario</h3>  
							<div class="row-fluid">
								<div class="input-prepend">
									<span class="add-on ad-on-icon"><i class="icon-user"></i></span><input type="text" class="user-list-search search" placeholder="Buscar usuario" />
								</div>
								<ul class="nav nav-pills line_sep">                                                                   
									<li class="dropdown">
										<a class="dropdown-toggle" data-toggle="dropdown" href="#">Ordenar por <b class="caret"></b></a>
										<ul class="dropdown-menu sort-by">
											<li><a href="javascript:void(0)" class="sort" data-sort="sl_name">por nombre</a></li>
											<li><a href="javascript:void(0)" class="sort" data-sort="sl_status">por usuario</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a class="dropdown-toggle" data-toggle="dropdown" href="#">Mostrar <b class="caret"></b></a>
										<ul class="dropdown-menu filter">
											<li class="active"><a href="javascript:void(0)" id="filter-none">Todos</a></li>
											<li><a href="javascript:void(0)" id="filter-online">Activos</a></li>
											<li><a href="javascript:void(0)" id="filter-offline">Inactivos</a></li>
										</ul>
									</li>
                                                                        
								</ul>
							</div>
							<ul class="list user_list">
                                                                <%
                                                                  List<entUsuario> list=clsGestor.ListarUsuario(false);
                                                                  if(list!=null)
                                                                  for(entUsuario entidad :list)
                                                                 {
                                                                %>
								<li>
                                                                     <%
                                                                        if(entidad.getEstado())
                                                                        out.print("<span class='label label-success pull-right sl_status'>Activado</span>");
                                                                        else
                                                                            out.print("<span class='label label-important pull-right sl_status'>Desactivado</span>");
                                                                     %>									
                                                                        
                                                                     <a href="#" onclick="getUsuario(<%=entidad.getId_usuario()%>,'<%=entidad.getNombre()%> <%=entidad.getApellido()%>','<%=entidad.getLogin()%>')" class="sl_name"><%=entidad.getNombre()%> <%=entidad.getApellido()%></a><br />
									<small class="s_color sl_email"><%=entidad.getLogin()%></small>
								</li>
                                                                 <%
                                                                    }
                                                                 %>
							</ul>
							<div class="pagination"><ul class="paging bottomPaging"></ul></div>
                        </div>
                                                            
								<div class="span4">
                                                                    
                                                                    <h3 class="heading">Agregar Formularios</h3>  
                                                                    
                                                                     <div class="row-fluid" id="g-map-top">
										<div class="span12">
                                                                                              <div class="location_add_form well">
												<div class="formSep">
                                                                                                        <div class="input-prepend">
                                                                                                            <di id='Formulario'>
                                                                                                                  <blockquote ><p>Nombre</p><blockquote><p>Usuario</p></blockquote></blockquote>
                                                                                                            </di>
                                                                                                        </div>
                                                                                                        <div class="input-prepend">
                                                                                                        <label>Módulo</label>
                                                                                                        <select id="cbModulo" name="cbModulo" title="Por favor selecione un Modulo!" required>
                                                                                                            <option value="">Selecione una Opción</option>                                                                                                           
                                                                                                        </select>
                                                                                                        </div> 
                                                                                                        <div class="input-prepend">
                                                                                                        <label>Cabecera</label>
                                                                                                        <select id="cbFormulario" name="cbFormulario" title="Por favor selecione un Cabecera!" required>
                                                                                                            <option value="">Selecione una Opción</option>                                                                                                           
                                                                                                        </select>
                                                                                                        </div> 
                                                                                                        <div class="input-prepend">
                                                                                                        <label>Formularios</label>
                                                                                                            <div id="getModulo"></div>
                                                                                                        </div> 
                                                                                                    
												</div>
                                                                                                <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
											</div>
                                                                                    
										</div>
									</div>
                                                                    
                                                                    

                                                                       
								</div>

                                                                <div class="span4">
                                                                  <h3 class="heading">Quitar Formularios</h3>                                                                   

                                                                          <div id="tabla"></div>
                                                                      
								</div>
                                                               
							</div>
						</div>
                        </div>
                   <!-- Modal Cargando -->	
       
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
                        
                         <!-- sortable/filterable list -->
            <script src="lib/list_js/list.min.js"></script>
            <script src="lib/list_js/plugins/paging/list.paging.min.js"></script>
            <!-- dashboard functions -->
            
			<script>
 var IdUsuario=0;
 var IdModulo=0;
 var Nombre="";
 var Usuario="";
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
function lista()
{
     $.ajax({
        url: 'operaciones/modulo/list_modulos_usuario.jsp',
        type: 'POST',
        success: function (data) {    
                 $('#tabla').html(data);
                 
        },
        contentType: false,
        processData: false
    });          
 };

function comboModulo()
{
     $.ajax({
        url: 'operaciones/modulo/list_combo_sesion.jsp?cbModulo=cbModulo',
        type: 'POST',
        success: function (data) {     
                 $('#cbModulo').html(data);
        },
        contentType: false,
        processData: false
    });    
    
 };

 
function getUsuario(id,nombre,usuario)
{
    $("#myModal").modal('show'); 
   $.ajax({
            url: 'operaciones/modulo/get_modulo_usuario.jsp?id='+id,
            type: 'POST',
            success: function () {  
                $('#Formulario').html("<di id='Formulario'><blockquote id='Formulario'><p>"+nombre+"</p><blockquote><p>"+usuario+"</p></blockquote></blockquote></div>");
                IdUsuario=id;
                Nombre=nombre;
                Usuario=usuario;
                 comboModulo();
                lista();
                $("select#cbModulo").val('0'); 
                $('#cbFormulario').html('<select id="cbFormulario" name="cbFormulario" title="Por favor selecione una Cabecera!" required><option value="">Selecione una Opción</option></select>');
                $('#getModulo').html('<div id="getModulo"></div>');
                $('#myModal').modal('hide');
            },
            contentType: false,
            processData: false
        });
     

};
function addFormulario(id,padre,etiqueta,tipo)
{
    var titulo='Quitar '+etiqueta+' a '+Nombre;
        if(tipo.toLowerCase()=="true")
            titulo='Agregar '+etiqueta+' a '+Nombre;
    
    smoke.confirm(titulo,function(e){
                if (e){
                     $("#myModal").modal('show'); 
                        var url = "operaciones/formulario_usuario/insert.jsp?idusuario="
                                +IdUsuario+"&idFormulario="+id+"&idPadre="+padre+"&tipo="+tipo; 

                        $.ajax({
                               type: "POST",
                               url: url,
                               success: function(data)
                               {
                                   if(data==-1)
                                     $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                    else if(data==0)
                                    {
                                        lista();
                                        $("#cbFormulario").change();
                                        $.sticky("Se Elimino Correctamente.", {autoclose : 5000, position: "top-center" });
                                       
                                   }
                                    else if(data>0)
                                    {
                                       lista();
                                       $("#cbFormulario").change();
                                       $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  
                                       
                                    }
                                    $('#myModal').modal('hide');
                               }
                             }); 
                            
                }
        }, {cancel:"No",ok:"Si"});
};                   
       modulos();                   
                            
				$(document).ready(function() {
					//* show all elements & remove preloader
                                     
                                        gebo_flist.init();
                                        setTimeout('$("html").removeClass("js")',1000);
                                     
                                        $('#cbModulo').on('change', function() {
                                           if(this.value!="" && this.value!=null)
                                           {
                                              IdModulo=this.value;
                                              $.ajax({
                                                    url: 'operaciones/formulario/list_combo_usuario.jsp?cbFormulario=cbFormulario&idModulo='+this.value,
                                                    type: 'POST',
                                                    success: function (data) {     
                                                             $('#cbFormulario').html(data);
                                                    },
                                                    contentType: false,
                                                    processData: false
                                                });      
                                           }
                                           
                                           $('#getModulo').html('<div id="getModulo"></div>');    
                                        });
                                        
                                         $('#cbFormulario').on('change', function() {
                                           if(this.value!="" && this.value!=null)
                                           {
                                              $.ajax({
                                                    url: 'operaciones/formulario/list_usuario.jsp?idModulo='+IdModulo+'&idFormulario='+this.value,
                                                    type: 'POST',
                                                    success: function (data) {     
                                                             $('#getModulo').html(data);
                                                    },
                                                    contentType: false,
                                                    processData: false
                                                });      
                                           }else
                                                $('#getModulo').html('<div id="getModulo"></div>');
                                           
                                               
                                        });

				});
                                    function clear_form() {
                                          $('#cbModulo').html('<select id="cbModulo" name="cbModulo" title="Por favor selecione un Modulo!" required><option value="">Selecione una Opción</option></select>');
                                          $('#Formulario').html("<blockquote ><p>Nombre</p><blockquote><p>Usuario</p></blockquote></blockquote>");
                                          $('#cbFormulario').html('<select id="cbFormulario" name="cbFormulario" title="Por favor selecione una Cabecera!" required><option value="">Selecione una Opción</option></select>');
                                          $('#getModulo').html('<div id="getModulo"></div>');
                                           $('#tabla').html('<div id="tabla"></div>');
                                            IdUsuario=0;
                                            IdModulo=0;
                                            Nombre="";
                                            Usuario="";
                                         
                                      };
                                       
                                       
                                      
//* filterable list
	gebo_flist = {
		init: function(){
			//*typeahead
			var list_source = [];
			$('.user_list li').each(function(){
				var search_name = $(this).find('.sl_name').text();
				//var search_email = $(this).find('.sl_email').text();
				list_source.push(search_name);
			});
			$('.user-list-search').typeahead({source: list_source, items:5});
			
			var pagingOptions = {};
			var options = {
				valueNames: [ 'sl_name', 'sl_status', 'sl_email' ],
				page: 10,
				plugins: [
					[ 'paging', {
						pagingClass	: "bottomPaging",
						innerWindow	: 1,
						left		: 1,
						right		: 1
					} ]
				]
			};
			var userList = new List('user-list', options);
			
			$('#filter-online').on('click',function() {
				$('ul.filter li').removeClass('active');
				$(this).parent('li').addClass('active');
				userList.filter(function(item) {
					if (item.values().sl_status == "Activado") {
						return true;
					} else {
						return false;
					}
				});
				return false;
			});
			$('#filter-offline').on('click',function() {
				$('ul.filter li').removeClass('active');
				$(this).parent('li').addClass('active');
				userList.filter(function(item) {
					if (item.values().sl_status == "Desactivado") {
						return true;
					} else {
						return false;
					}
				});
				return false;
			});
			$('#filter-none').on('click',function() {
				$('ul.filter li').removeClass('active');
				$(this).parent('li').addClass('active');
				userList.filter();
				return false;
			});
			
			$('#user-list').on('click','.sort',function(){
					$('.sort').parent('li').removeClass('active');
					if($(this).parent('li').hasClass('active')) {
						$(this).parent('li').removeClass('active');
					} else {
						$(this).parent('li').addClass('active');
					}
				}
			);
		} 
	};
			</script>
		
		</div>
	</body>
</html>
<%}}else  
    response.sendRedirect("index.jsp");%> 