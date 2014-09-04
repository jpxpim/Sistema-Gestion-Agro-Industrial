<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>

<%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entEvaluador"%>
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
    entFormulario formPadre=null;
    boolean pagina=false;

        int posJ=objSession.getListModulos().get(objSession.getPosicion()).getList().size();
        for(int j=0;j<posJ;j++)
        {
            if(22==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
            {
                formHijo=objSession.getListModulos().get(objSession.getPosicion()).getList().get(j);
                formHijo.setObjModulo(objSession.getListModulos().get(objSession.getPosicion()));
                pagina=true;
                j=posJ;
            }
        }
        if(formHijo!=null)
        for(entFormulario padre : formHijo.getObjModulo().getList())
        {
            if(padre.getId_formulario()==formHijo.getPadre())
            formPadre=padre;
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
	<!-- datepicker -->
            <link rel="stylesheet" href="lib/datepicker/datepicker.css" />
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
                                                            
                                                                <div class="span1"></div>
                                                            
								<div class="span4" id="user-list">
                                                                     <h3 class="heading">Elegir Evaluador</h3>  
							<div class="row-fluid">
								<div class="input-prepend">
									<span class="add-on ad-on-icon"><i class="icon-user"></i></span><input type="text" class="user-list-search search" placeholder="Buscar evaluador" />
								</div>
								<ul class="nav nav-pills line_sep">                                                                   
									<li class="dropdown">
										<a class="dropdown-toggle" data-toggle="dropdown" href="#">Ordenar por <b class="caret"></b></a>
										<ul class="dropdown-menu sort-by">
											<li><a href="javascript:void(0)" class="sort" data-sort="sl_name">por nombre</a></li>
											<li><a href="javascript:void(0)" class="sort" data-sort="sl_status">por código ERP</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<ul class="list user_list">
                                                                <%
                                                                 List<entEvaluador> list=clsGestor.ListarEvaluador(false);
                                                                  if(list!=null)
                                                                  for(entEvaluador entidad :list)
                                                                 {
                                                                %>
								<li>								
                                                                        
                                                                     <a href="#" onclick="getUsuario(<%=entidad.getId_evaluador()%>,'<%=entidad.getNombre()%> <%=entidad.getApellido()%>','<%=entidad.getCodigo_erp()%>')" class="sl_name"><%=entidad.getNombre()%> <%=entidad.getApellido()%></a><br />
									<small class="s_color sl_email"><%=entidad.getCodigo_erp()%></small>
								</li>
                                                                 <%
                                                                    }
                                                                 %>
							</ul>
							<div class="pagination"><ul class="paging bottomPaging"></ul></div>
                        </div>
                                                            
								<div class="span4">
                                                                 <h3 class="heading">Ingreso de Datos</h3>  
                                                                     <div class="row-fluid" id="g-map-top">
                                                                            <div class="span12">
											  <form  method="get" id="reg_form">
                                                                                              <div class="location_add_form well">
												<div class="formSep">
                                                                                                        <div class="input-prepend">
                                                                                                            <di id='Formulario'>
                                                                                                                  <blockquote ><p>Nombre</p><blockquote><p>Código ERP</p></blockquote></blockquote>
                                                                                                            </di>
                                                                                                            <input type="text" id="idEvaluador"  name="idEvaluador" />
                                                                                                        </div>
                                                                                                        <div class="input-prepend">
                                                                                                            <label>Campaña Lote</label>
                                                                                                                
                                                                                                                    <span class='label label-info span9'><h4 id='Lote'>Selecione una Opcción</h4></span>
                                                                                                                    <span class="add-on">
                                                                                                                        <a data-toggle="modal" data-backdrop="static" href="#ModalCampaniaLote"><i class="splashy-zoom"></i></a>
                                                                                                                    </span>   
                                                                                                                    <input type="text" id="idCampaniaLote"  name="idCampaniaLote" />
                                                                                                        </div> 
                                                                                                        <div class="input-prepend">
													<label>Feminelas</label>
                                                                                                        <input type="text" class="span10" id="txtFeminelas" name="txtFeminelas" />
                                                                                                        </div>
                                                                                                        <div class="input-prepend">
													<label>Fertilidad</label>
													<input type="text" class="span10" id="txtFertilidad"  name="txtFertilidad" />
                                                                                                         </div>      
                                                                                                        <div class="input-prepend">
													<label>Fecha de Muestra</label>
													<input type="text" class="span10" id="txtFecha"  name="txtFecha" />
                                                                                                         </div> 
                                                                                                          <div class="input-prepend">
													<label>Estado</label>
													<label class="radio inline">
                                                                                                        <input type="radio" value="1"  id="rbEstado" name="rbEstado" />
                                                                                                            Activo
                                                                                                        </label>
                                                                                                        <label class="radio inline">
                                                                                                                <input type="radio" value="0" id="rbEstado" name="rbEstado" />
                                                                                                                Desactivado
                                                                                                        </label>
                                                                                                         </div>
                                                                                                    <input type="hidden" id="IdAnalasisYemas"  name="IdAnalasisYemas" value="0" />
                                                                                                        
												</div>
                                                                                                <button class="btn btn-invert" type="submit">Grabar</button>
                                                                                                
                                                                                                <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
											</div>
                                                                                    
                                                                                    
                                                                                    </form>
										</div>
                                                                         
									</div>
                                                                    
                                                                    

                                                                       
								</div>

                                                               
                                                               
							</div>
						</div>
                        </div>
                      <div class="row-fluid">
                        
                        <div class="span12">
                            <div id="tabla"></div>
                        </div>
                        
                    </div>                                   
                           <!-- Modal Camapaña -->	
                <div class="modal hide fade" id="ModalCampaniaLote">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h3>Buscar Camapaña</h3>
                    </div>
                    <div class="modal-body">
                        <table id="tablaCapania" class="table table-striped location_table">
                            <thead>
                                    <tr>
                                            <th>Id</th>
                                            <th>Número de Plantas</th>
                                            <th>Fecha de Poda</th>
                                            <th>Lote</th>
                                            <th>Campaña</th>
                                            <th>Acciones</th>
                                    </tr>
                            </thead> 
                            <tbody>    
                            <%
                            SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
                            List<entCampaniaLote> listCapamiaLote=clsGestor.ListarCampaniaLote();
                            if(listCapamiaLote!=null)
                            for(entCampaniaLote entidad : listCapamiaLote)
                            {
                            %>
                                                                                                        
                               <tr>
                                   <td><%=entidad.getId_campania_lote()%></td>
                                    <td><%=entidad.getNumero_plantas()%></td>
                                    <td><%=fecha.format(entidad.getFechaPodaFormacion())%></td>
                                    <td><%=entidad.getObjLote().getNombre()%></td>
                                    <td><%=entidad.getObjCampania().getNombre()%></td>
                                    <td>
                                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectCampaniaLote(<%=entidad.getId_campania_lote()%>,'<%=entidad.getObjLote().getNombre()%> - <%=entidad.getObjCampania().getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

                                    </td>
                                </tr>                                                            
                            <%
                            }
                            %>
                            </tbody>
                        </table>
            
                    </div>
                    <div class="modal-footer">
                        <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
                    </div>
                </div>     
                  
                 <!-- Modal Camapaña -->	
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
                          <!-- datepicker -->
                        <script src="lib/datepicker/bootstrap-datepicker.js"></script>

			<!-- maps functions -->
                        <script src="lib/validation/jquery.validate.min.js"></script>
                         <!-- smoke_js -->
			<script src="lib/smoke/smoke.js"></script>
                        
                         <!-- sortable/filterable list -->
            <script src="lib/list_js/list.min.js"></script>
            <script src="lib/list_js/plugins/paging/list.paging.min.js"></script>
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
function tabla()
{
     $.ajax({
        url: 'operaciones/analisis_yemas/list_tabla.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
 
function getUsuario(id,nombre,usuario)
{
    $('#idEvaluador').val(id);  
                                                
 $('#Formulario').html("<di id='Formulario'><blockquote id='Formulario'><p>"+nombre+"</p><blockquote><p>"+usuario+"</p></blockquote></blockquote></div>");  
};
function selectCampaniaLote(id,nombre)
{
    $('#idCampaniaLote').val(id);  
       $('#Lote').html("<h4 id='Lote'>"+nombre+"</h4>");                                         
};              
                        
                            
				$(document).ready(function() {
					//* show all elements & remove preloader
                                        
                                        
                                        $('#tablaCapania').dataTable({
                                          "sPaginationType": "bootstrap",
                                            "sScrollY": "200px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    });
                                        $('#txtFecha').datepicker();
                                        
                                        
                                        $( "#idCampaniaLote" ).hide();
                                        $( "#idEvaluador" ).hide();
                                        
                                        gebo_flist.init();
                                        setTimeout('$("html").removeClass("js")',1000);
                                           $('#reg_form').validate({
                                        lang: 'es',
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
                                        ignore: ".ignore",
                                            submitHandler: function() {       
                                                     $("#abrirCarga").click();
                                                    var url = "operaciones/analisis_yemas/insert.jsp"; 

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
                                                txtFeminelas: { required: true, number: true},
                                                txtFertilidad: { required: true, number: true},
                                                txtFecha: { required: true},
                                                idCampaniaLote: { required: true},
                                                idEvaluador: { required: true},
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
                                          $('#Formulario').html("<di id='Formulario'><blockquote><p>Nombre</p><blockquote><p>Código ERP</p></blockquote></blockquote></div>");  
                                          $('#Lote').html("<h4 id='Lote'>Selecione una Opcción</h4>");   
                                          $('#IdAnalasisYemas').val("0");
                                          $('#idEvaluador').val("");
                                          $('#idCampaniaLote').val("");
                                          $('#txtFecha').val("");
                                          $('#txtFertilidad').val("");
                                          $('#txtFeminelas').val("");
                                          $('input:radio[name=rbEstado]').attr('checked',false);
                                    };
                                    function edit_form(id,idEvaluador,idCampaniaLote,nEvaluador,cEvaluador,nCampaniaLote,feminelas,fertilidad,fecha,estado) {
                                            $('#Formulario').html("<di id='Formulario'><blockquote><p>"+nEvaluador+"</p><blockquote><p>"+cEvaluador+"</p></blockquote></blockquote></div>");  
                                            $('#Lote').html("<h4 id='Lote'>"+nCampaniaLote+"</h4>");   
                                            $('#IdAnalasisYemas').val(id);
                                            $('#idEvaluador').val(idEvaluador);
                                            $('#idCampaniaLote').val(idCampaniaLote);
                                            $('#txtFecha').val(fecha);
                                            $('#txtFertilidad').val(fertilidad);
                                            $('#txtFeminelas').val(feminelas);
                                            
                                            if(estado.toLowerCase()=="true")
                                             $('input:radio[name=rbEstado]')[0].checked = true;
                                            else
                                              $('input:radio[name=rbEstado]')[1].checked = true;
                                      };
                                        modulos(); 
                                       tabla();
                                      
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
<%}else  
    response.sendRedirect("index.jsp");%> 