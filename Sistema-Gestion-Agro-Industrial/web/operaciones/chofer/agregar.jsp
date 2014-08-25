 <%@page import="Entidades.entTransportista"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entChofer"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
%>
<div id="tablaEvaluador">
 <div class="row-fluid" id="form">
    <div class="span12">
            <div class="row-fluid">
                    <div class="span8">
                            <div class="row-fluid" id="g-map-top">
                                    <div class="span12">
                                              <form  method="get" id="reg_form_chofer">
                                                  <div class="location_add_form well">
                                                    <div class="formSep">
                                                            <div class="input-prepend">
                                                            <label>Nombre</label>
                                                            <input type="text" class="span10" id="txtNombres" name="txtNombres" />
                                                            </div>
                                                            <div class="input-prepend">
                                                            <label>Brevete</label>
                                                            <input type="text" class="span10" id="txtBrevete"  name="txtBrevete" />
                                                             </div>  
                                                            <div class="input-prepend">
                                                                <label>Empresa Transportista</label>
                                                                <select id="cbTransportista" name="cbTransportista" title="Por favor selecione una Empresa Transportista!" required>
                                                                    <option value="">Selecione una Opción</option>
                                                                    <%
                                                                        List<entTransportista> list=clsGestor.ListarTransportista(true);
                                                                      if(list!=null)

                                                                          for(entTransportista entidad : list)
                                                                              out.print("<option value='"+entidad.getId_transportista()+"'>"+entidad.getRazon_social()+"</option>");
                                                                    %>
                                                                </select>
                                                             </div>   
                                                        <input type="hidden" id="IdChofer"  name="IdChofer" value="0" />
                                                <input type="hidden" id="rbEstado"  name="rbEstado" value="1" />
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
  <h3 id="cargando"><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3>                                                              
                                                                
</div>
<script type="text/javascript">
  
$(function () { 
$('#cargando').hide();  
                                $('#reg_form_chofer').validate({
                                        lang: 'es',
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',                                        
                                            submitHandler: function() {   
                                                 $('#form').hide();
                                                 $('#cargando').show();  
                                                    var url = "operaciones/chofer/insert.jsp";                                                     
                                                    $.ajax({
                                                           type: "POST",
                                                           url: url,
                                                           data: $("#reg_form_chofer").serialize(), 
                                                           success: function(data)
                                                           {
                                                               if(data<=0)
                                                                 $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                                                else if(data>0)
                                                                {
                                                                    
                                                                   $('#chofer').html('<div id="chofer"><blockquote>'+$('#txtNombres').val()+'<blockquote>'+$("#cbTransportista :selected").text()+'</blockquote></blockquote></div> ');
     
                                                                    
                                                                   $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });
                                                                   setEstadoChofer(data); 
                                                               }
                                                           }
                                                         });    
                                            },
					rules: {
						txtNombres: { required: true, minlength: 3 },
                                                txtBrevete: { required: true, minlength: 4 }
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
                                          $('#txtNombres').val("");
                                          $('#txtBrevete').val("");
                                          $("select#cbTransportista").val(0);    
                                           
                                      };
</script>

<%}%>  
                                                                        
                                                                       
                                                                            