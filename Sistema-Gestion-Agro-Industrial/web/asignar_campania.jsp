<%-- 
    Document   : newjsp
    Created on : 22/04/2014, 06:06:51 AM
    Author     : Toditos
--%>

<%@page import="Entidades.entFormulario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entCampania"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entLote"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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
            if(20==objSession.getListModulos().get(objSession.getPosicion()).getList().get(j).getControl_form())
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
                                    <a href="<%=formHijo.getObjModulo().getUrl()%>"><%=formHijo.getObjModulo().getEtiqueta()%></a>
                                </li>
                                <li><%=formHijo.getEtiqueta()%></li>
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
                                                                                                            <label>Lote</label>
                                                                                                                
                                                                                                                    <span class='label label-info span9'><h4 id='Lote'>Selecione una Opcción</h4></span>
                                                                                                                    <span class="add-on">
                                                                                                                        <a data-toggle="modal" data-backdrop="static" href="#ModalLote"><i class="splashy-zoom"></i></a>
                                                                                                                    </span>   
                                                                                                                    <input type="text" id="cbLote"  name="cbLote" />
                                                                                                        </div>  
                                                                                                         
                                                                                                       <div class="input-prepend">
                                                                                                            <label>Campaña</label>
                                                                                                            <select id="cbCampania" name="cbCampania" title="Por favor selecione un Campaña!" required>
                                                                                                                <option value="">Selecione una Opción</option>
                                                                                                            </select>
                                                                                                         </div>   
                                                                                                         <div class="input-prepend">
                                                                                                            <label>Número de Plantas</label>
                                                                                                            <input type="text" class="span10" id="txtNumero"  name="txtNumero" />
                                                                                                         </div> 
                                                                                                        <div class="input-prepend">
                                                                                                            <label>Fecha de Poda</label>
                                                                                                            <input type="text" class="span10" id="txtFecha"  name="txtFecha" />
                                                                                                         </div> 
                                                                                                    <input type="hidden" id="IdCampaniaLote"  name="IdCampaniaLote" value="0" />
                                                                                                        
												</div>
                                                                                                <button class="btn btn-invert" type="submit">Grabar</button>
                                                                                                
                                                                                                <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
											</div>
                                                                                    
                                                                                    
                                                                                    </form>
										</div>
									</div>
								</div>	
								<div class="span8">
                                                                    
                                  

                                                                    
                                                                    <div id="tabla"></div>
								</div>
							</div>
						</div>
                        </div>
		<!-- Modal Lote -->	
                <div class="modal hide fade" id="ModalLote"  style="width: 50%;">
                    
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h3>Buscar Lote</h3>
                    </div>
                    <div class="modal-body">
                       <table id="tablaLote" class="table table-striped location_table">
                            <thead>
                                    <tr>
                                            <th>Nombre</th>
                                            <th>Nº Hectareas</th>
                                            <th>Centro de Costo</th>
                                            <th>Productor</th>
                                            <th>Tipo Cultivo</th>
                                            <th> Edad Cultivo</th>
                                            <th>Variedad</th>
                                            <th>Acciones</th>
                                    </tr>
                            </thead> 
                           <tbody>    
                            <%
                            List<entLote> list=clsGestor.ListarLote(false);
                            if(list!=null)
                            for(entLote entidad : list)
                            {
                            %>
                                                                                                        
                            <tr>
                                <td><%=entidad.getNombre()%></td>
                                <td><%=entidad.getHectareas()%></td>
                                <td><%=entidad.getCentro_costo()%></td>
                                <td><%=entidad.getObjProductor().getNombre()%></td>
                                <td><%=entidad.getObjTipoCultivo().getNombre()%></td>
                                <td><%=entidad.getObjEdadCultivo().getNombre()%></td>
                                <td><%=entidad.getObjVariedad().getNombre()%></td>
                                <td>
                                    <a href="javascript:void(0)" data-dismiss="modal" onclick="selectLote(<%=entidad.getId_lote()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Selecionar</a>

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
                <div class="modal hide fade" id="ModalCampania">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h3>Buscar Camapaña</h3>
                    </div>
                    <div class="modal-body">
                        <table id="tablaCapania" class="table table-striped location_table">
                            <thead>
                                    <tr>
                                            <th>Id</th>
                                            <th>Nombre</th>
                                            <th>Fecha Inicio</th>
                                            <th>Fecha Fin</th>
                                            <th>Acciones</th>
                                    </tr>
                            </thead> 
                            <tbody>    
                            <%
                            SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
                            List<entCampania> listaCampania=clsGestor.ListarCampania(false);
                            if(listaCampania!=null)
                            for(entCampania entidad : listaCampania)
                            {
                            %>
                                                                                                        
                                <tr>
                                    <td><%=entidad.getId_campania()%></td>
                                    <td><%=entidad.getNombre()%></td>
                                    <td><%=fecha.format(entidad.getFecha_inicio())%></td>
                                    <td><%=fecha.format(entidad.getFecha_fin())%></td>
                                    <td>
                                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectCampania(<%=entidad.getId_campania()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
                          <!-- datepicker -->
                        <script src="lib/datepicker/bootstrap-datepicker.js"></script>
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
        url: 'operaciones/campania_lote/list_tabla.jsp',
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
     window.location='operaciones/campania_lote/reporte.jsp';
 }; 
function combo(id,idCampania,nCampania)
{
    $("#myModal").modal('show'); 
     $.ajax({
        url: 'operaciones/campania/list_combo_lote.jsp?id='+id,
        type: 'POST',
        success: function (data) {     
                 $('#cbCampania').html(data);
                 if(idCampania>0){
                     $("#cbCampania").append('<option value='+idCampania+'>'+nCampania+'</option>');
                     $("select#cbCampania").val(idCampania);                     
                 } 
                  $('#myModal').modal('hide');
                 
        },
        contentType: false,
        processData: false
    });          
 };                  
                        
                            
				$(document).ready(function() {
					//* show all elements & remove preloader
                                         $( "#cbLote" ).hide();
                                        setTimeout('$("html").removeClass("js")',1000);


                                        $('#tablaCapania').dataTable({
                                           "sPaginationType": "bootstrap",
                                            "sScrollY": "200px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    });
                                                    
                                           $('#tablaLote').dataTable({
                                           "sPaginationType": "bootstrap",
                                            "sScrollY": "200px",
                                             "sScrollX": "90%",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    });


                                        
                                      $('#reg_form').validate({
                                        lang: 'es',
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
                                        ignore: ".ignore",
                                            submitHandler: function() {       
                                                   $("#myModal").modal('show'); 
                                                    var url = "operaciones/campania_lote/insert.jsp"; 

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
                                                                $('#myModal').modal('hide');
                                                           }
                                                         });    
                                            },
					rules: {
                                                txtNumero: { required: true, digits:true},
                                                txtFecha: { required: true},
                                                cbLote: { required: true}
                                                
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
                          
                                  $('#txtFecha').datepicker();
                                        
				});
                                    function clear_form() {
                                          $('#txtNumero').val("");
                                          $('#txtFecha').val("");
                                         $("select#cbCampania").val("0");   
                                         
                                         $('#IdCampaniaLote').val("0");
                                            $('#cbLote').val("");
                                            $('#Lote').html("<h4 id='Lote'>Selecione una Opcción</h4>");
                                            $('#cbCampania').html('<select id="cbCampania" name="cbCampania" title="Por favor selecione un Campaña!" required><option value="">Selecione una Opción</option></select>');
                                             
                                     
                                           
                                      };
                                       function edit_form(id,numero,fecha,idLote,nLote,idCampania,nCampania) {
                                          combo(idLote,idCampania,nCampania);
                                            $('#txtNumero').val(numero);
                                            $('#IdCampaniaLote').val(id);
                                             $('#txtFecha').val(fecha);
                                             $('#Lote').html("<h4 id='Lote'>"+nLote+"</h4>");
                                              $('#cbLote').val(idLote);
                                               $("select#cbCampania").val(idCampania);   
                                      };                                      
                                       function selectLote(id,nombre) {
                                           $('#Lote').html("<h4 id='Lote'>"+nombre+"</h4>");                                           
                                           $('#cbLote').val(id);
                                           combo(id,0,"");
                                       };
                                       
                                  modulos(); 
                                       tabla();
                                       
			</script>
		
		</div>
	</body>
</html>
<%}}else  
    response.sendRedirect("index.jsp");%> 