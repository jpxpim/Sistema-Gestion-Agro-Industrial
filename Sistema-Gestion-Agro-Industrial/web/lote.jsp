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
    int posI=objSession.getListModulos().size();
    for(int i=0;i<posI;i++)
    {
        int posJ=objSession.getListModulos().get(i).getList().size();
        for(int j=0;j<posJ;j++)
        {
            if(17==objSession.getListModulos().get(i).getList().get(j).getControl_form())
            {
                formHijo=objSession.getListModulos().get(i).getList().get(j);
                formHijo.setObjModulo(objSession.getListModulos().get(i));
                pagina=true;
                i=posI;
                j=posJ;
            }
        }
        if(formHijo!=null)
        for(entFormulario padre : formHijo.getObjModulo().getList())
        {
            if(padre.getId_formulario()==formHijo.getPadre())
            formPadre=padre;
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
                                                            <div class="span2"></div>
                                                            <form  method="get" id="reg_form">
                                                            
								<div class="span4">
                                                                      <div class="location_add_form well">
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
                                                                                <label>Número de Hectareas</label>
                                                                                <input type="text" class="span10" id="txtHectareas"  name="txtHectareas" />
                                                                                 </div>  
                                                                                <div class="input-prepend">
                                                                                <label>Centro de Costo</label>
                                                                                <input type="text" class="span10" id="txtCentro"  name="txtCentro" />
                                                                                 </div>  
                                                                                <div class="input-prepend">
                                                                                <label>Año de Siembra</label>
                                                                                <input type="text" class="span10" id="txtAnio"  name="txtAnio" />
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
                                                                          

                                                                      </div>
								</div>	
                                                                <div class="span3">
                                                                          <div class="location_add_form well">
                                                                            <div class="formSep">
                                                                                    <div class="input-prepend">
                                                                                        <label>Productor</label>
                                                                                        <select id="cbProductor" name="cbProductor" title="Por favor selecione un Productor!" required>
                                                                                            <option value="">Selecione una Opción</option>
                                                                                        </select>
                                                                                     </div>   
                                                                                    <div class="input-prepend">
                                                                                        <label>Patrón</label>
                                                                                        <select id="cbPatron" name="cbPatron" title="Por favor selecione un Patrón!" required>
                                                                                            <option value="">Selecione una Opción</option>
                                                                                        </select>
                                                                                     </div>   
                                                                                    <div class="input-prepend">
                                                                                        <label>Vivero</label>
                                                                                        <select id="cbVivero" name="cbVivero" title="Por favor selecione un Vivero!" required>
                                                                                            <option value="">Selecione una Opción</option>
                                                                                        </select>
                                                                                     </div>   
                                                                                    <div class="input-prepend">
                                                                                        <label>Sub Sector</label>
                                                                                        <select id="cbSubSector" name="cbSubSector" title="Por favor selecione un Sub Sector!" required>
                                                                                            <option value="">Selecione una Opción</option>
                                                                                        </select>
                                                                                     </div>   
                                                                                    <div class="input-prepend">
                                                                                        <label>Tipo Cultivo</label>
                                                                                        <select id="cbTipoCultivo" name="cbTipoCultivo" title="Por favor selecione un Tipo Cultivo!" required>
                                                                                            <option value="">Selecione una Opción</option>
                                                                                        </select>
                                                                                     </div>   
                                                                                    <div class="input-prepend">
                                                                                        <label>Edad Cultivo</label>
                                                                                        <select id="cbEdadCultivo" name="cbEdadCultivo" title="Por favor selecione una Edad Cultivo!" required>
                                                                                            <option value="">Selecione una Opción</option>
                                                                                        </select>
                                                                                     </div>   
                                                                                    <div class="input-prepend">
                                                                                        <label>Variedad</label>
                                                                                        <select id="cbVariedad" name="cbVariedad" title="Por favor selecione una Variedad!" required>
                                                                                            <option value="">Selecione una Opción</option>
                                                                                        </select>
                                                                                     </div>   
                                                                                <input type="hidden" id="IdLote"  name="IdLote" value="0" />

                                                                            </div>
                                                                            <button class="btn btn-invert" type="submit">Grabar</button>

                                                                            <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
                                                                    </div>
								</div>	
                                                            </form>
							</div>
						</div>
                        </div>
			<div class="row-fluid">
                            <div class="span12">
                                 <div id="tabla"></div>
                            </div>		
                        </div>
                            
                            <!-- Modal Cargando -->	
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

function tabla()
{
     $.ajax({
        url: 'operaciones/lote/list_tabla.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
 function comboProductor()
{
     $.ajax({
        url: 'operaciones/productor/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbProductor').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
  function comboPatron()
{
     $.ajax({
        url: 'operaciones/patron/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbPatron').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
   function comboVivero()
{
     $.ajax({
        url: 'operaciones/vivero/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbVivero').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
    function comboSubSector()
{
     $.ajax({
        url: 'operaciones/sub_sector/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbSubSector').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
     function comboTipoCultivo()
{
     $.ajax({
        url: 'operaciones/tipo_cultivo/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbTipoCultivo').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
     function comboEdadCultivo()
{
     $.ajax({
        url: 'operaciones/edad_cultivo/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbEdadCultivo').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
      function comboVariedad()
{
     $.ajax({
        url: 'operaciones/variedad/list_combo.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#cbVariedad').html(data);
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
                                                    var url = "operaciones/lote/insert.jsp"; 

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
                                                txtHectareas: { required: true, number: true},
                                                txtCodigo: { required: true, minlength: 3 },
                                                txtDescripcion: { required: true, minlength: 3 },
                                                txtCentro: { required: true, minlength: 3 },       
                                                txtAnio: { required: true,digits:true, minlength: 4 , maxlength: 4 }, 
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
                                    var comboIdProductor=0;
                                    var comboIdPatron=0;
                                    var comboIdVivero=0;
                                    var comboIdSubSector=0;
                                    var comboIdTipoCultivo=0;
                                    var comboIdEdadCultivo=0;
                                    var comboIdVariedad=0;
                                    function clear_form() {
                                            $('input:radio[name=rbEstado]').attr('checked',false);
                                            $('#txtNombre').val("");
                                            $('#txtHectareas').val("");
                                            $('#txtCentro').val("");
                                            $('#txtAnio').val("");
                                            $('#txtDescripcion').val("");
                                            $('#txtHectareas').val("");
                                            $('#txtCodigo').val("");
                                            $("select#cbProductor").val('0'); 
                                            
                                            if(comboIdProductor>0)
                                              $("#cbProductor option[value='"+comboIdProductor+"']").remove();
                                            $("select#cbProductor").val(0);   
                                            
                                            if(comboIdPatron>0)
                                              $("#cbPatron option[value='"+comboIdPatron+"']").remove();
                                            $("select#cbPatron").val(0);
                                            
                                            if(comboIdVivero>0)
                                              $("#cbVivero option[value='"+comboIdVivero+"']").remove();
                                            $("select#cbVivero").val(0);
                                           
                                            if(comboIdSubSector>0)
                                              $("#cbSubSector option[value='"+comboIdSubSector+"']").remove();
                                            $("select#cbSubSector").val(0);
                                            
                                            if(comboIdTipoCultivo>0)
                                              $("#cbTipoCultivo option[value='"+comboIdTipoCultivo+"']").remove();
                                            $("select#cbTipoCultivo").val(0);
                                            
                                            if(comboIdEdadCultivo>0)
                                              $("#cbEdadCultivo option[value='"+comboIdEdadCultivo+"']").remove();
                                            $("select#cbEdadCultivo").val(0);
                                            
                                            if(comboIdVariedad>0)
                                              $("#cbVariedad option[value='"+comboIdVariedad+"']").remove();
                                            $("select#cbVariedad").val(0);
                                            
                                            $("#IdLote").val("0");  
                                           
                                      };
                                       function edit_form(id,nombre,descripcion,codigo,hectareas,centro,annio,estado,idProductor,nProductor,idPatron,nPatron,idVivero,nVivero,idSubSector,nSubSector,idTipoCultivo,nTipoCultivo,idEdadCultivo,nEdadCultivo,idVariedad,nVariedad) {
                                            
                                            if(comboIdProductor>0)
                                              $("#cbProductor option[value='"+comboIdProductor+"']").remove();
                                          
                                            if(comboIdPatron>0)
                                              $("#cbPatron option[value='"+comboIdPatron+"']").remove();
                                          
                                            if(comboIdVivero>0)
                                              $("#cbVivero option[value='"+comboIdVivero+"']").remove();
                                            
                                            if(comboIdSubSector>0)
                                              $("#cbSubSector option[value='"+comboIdSubSector+"']").remove();
                                          
                                            if(comboIdTipoCultivo>0)
                                              $("#cbTipoCultivo option[value='"+comboIdTipoCultivo+"']").remove();
                                          
                                            if(comboIdEdadCultivo>0)
                                              $("#cbEdadCultivo option[value='"+comboIdEdadCultivo+"']").remove();
                                              
                                            if(comboIdVariedad>0)
                                              $("#cbVariedad option[value='"+comboIdVariedad+"']").remove();
                                          
                                            $('#txtCodigo').val(codigo);
                                            $('#txtNombre').val(nombre);
                                            $('#txtHectareas').val(hectareas);
                                            $('#txtDescripcion').val(descripcion);
                                            $('#txtCentro').val(centro);
                                            $('#txtAnio').val(annio);
                                            $('#IdLote').val(id);                                            
                                             
                                             
                                            if(estado.toLowerCase()=="true")
                                             $('input:radio[name=rbEstado]')[0].checked = true;
                                            else
                                              $('input:radio[name=rbEstado]')[1].checked = true;
                                          
                                            if(buscaComboProductor(idProductor))
                                               $("select#cbProductor").val(idProductor); 
                                            else
                                            {
                                                comboIdProductor=idProductor;
                                                $("#cbProductor").append('<option value='+idProductor+'>'+nProductor+'</option>');
                                                $("select#cbProductor").val(idProductor); 
                                            }
                                            
                                            if(buscaComboPatron(idPatron))
                                               $("select#cbPatron").val(idPatron); 
                                            else
                                            {
                                                comboIdProductor=idPatron;
                                                $("#cbPatron").append('<option value='+idPatron+'>'+nPatron+'</option>');
                                                $("select#cbPatron").val(idProductor); 
                                            }
                                            
                                            if(buscaComboVivero(idVivero))
                                               $("select#cbVivero").val(idVivero); 
                                            else
                                            {
                                                comboIdVivero=idVivero;
                                                $("#cbVivero").append('<option value='+idVivero+'>'+nVivero+'</option>');
                                                $("select#cbVivero").val(idVivero); 
                                            }
                                            
                                            if(buscaSubSector(idSubSector))
                                               $("select#cbSubSector").val(idSubSector); 
                                            else
                                            {
                                                comboIdSubSector=idSubSector;
                                                $("#cbSubSector").append('<option value='+idSubSector+'>'+nSubSector+'</option>');
                                                $("select#cbSubSector").val(idSubSector); 
                                            }
                                            
                                            if(buscaTipoCultivo(idTipoCultivo))
                                               $("select#cbTipoCultivo").val(idTipoCultivo); 
                                            else
                                            {
                                                comboIdTipoCultivo=idTipoCultivo;
                                                $("#cbTipoCultivo").append('<option value='+idTipoCultivo+'>'+nTipoCultivo+'</option>');
                                                $("select#cbTipoCultivo").val(idTipoCultivo); 
                                            }
                                                
                                            if(buscaEdadCultivo(idEdadCultivo))
                                               $("select#cbEdadCultivo").val(idEdadCultivo); 
                                            else
                                            {
                                                comboIdEdadCultivo=idEdadCultivo;
                                                $("#cbEdadCultivo").append('<option value='+idEdadCultivo+'>'+nEdadCultivo+'</option>');
                                                $("select#cbEdadCultivo").val(idEdadCultivo); 
                                            }   
                                            
                                            if(buscaVariedad(idVariedad))
                                               $("select#cbVariedad").val(idVariedad); 
                                            else
                                            {
                                                comboIdVariedad=idVariedad;
                                                $("#cbVariedad").append('<option value='+idVariedad+'>'+nVariedad+'</option>');
                                                $("select#cbVariedad").val(idEdadCultivo); 
                                            }   
                                      };
                                      
                                       function buscaComboProductor(valor) {
                                           var estado=false;
                                            $("#cbProductor option").each(function(){
                                                if($(this).attr('value')==valor)
                                                {
                                                    estado=true;
                                                }
                                                    
                                             });
                                             return estado;
                                       };
                                       function buscaComboPatron(valor) {
                                           var estado=false;
                                            $("#cbPatron option").each(function(){
                                                if($(this).attr('value')==valor)
                                                {
                                                    estado=true;
                                                }
                                                    
                                             });
                                             return estado;
                                       };
                                       function buscaComboVivero(valor) {
                                           var estado=false;
                                            $("#cbVivero option").each(function(){
                                                if($(this).attr('value')==valor)
                                                {
                                                    estado=true;
                                                }
                                                    
                                             });
                                             return estado;
                                       };
                                       function buscaSubSector(valor) {
                                           var estado=false;
                                            $("#cbSubSector option").each(function(){
                                                if($(this).attr('value')==valor)
                                                {
                                                    estado=true;
                                                }
                                                    
                                             });
                                             return estado;
                                       };
                                       function buscaTipoCultivo(valor) {
                                           var estado=false;
                                            $("#cbTipoCultivo option").each(function(){
                                                if($(this).attr('value')==valor)
                                                {
                                                    estado=true;
                                                }
                                                    
                                             });
                                             return estado;
                                       };
                                       function buscaEdadCultivo(valor) {
                                           var estado=false;
                                            $("#cbEdadCultivo option").each(function(){
                                                if($(this).attr('value')==valor)
                                                {
                                                    estado=true;
                                                }
                                                    
                                             });
                                             return estado;
                                       };
                                       function buscaVariedad(valor) {
                                           var estado=false;
                                            $("#cbVariedad option").each(function(){
                                                if($(this).attr('value')==valor)
                                                {
                                                    estado=true;
                                                }
                                                    
                                             });
                                             return estado;
                                       };
                                     modulos(); 
                                       tabla();
                                       comboProductor();
                                       comboPatron();
                                       comboVivero();
                                       comboSubSector();
                                       comboTipoCultivo();
                                       comboEdadCultivo();
                                       comboVariedad();
			</script>
		
		</div>
	</body>
</html>
<%}else  
    response.sendRedirect("index.jsp");%> 