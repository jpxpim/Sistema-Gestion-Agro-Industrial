
<%@page import="Entidades.entSesion"%>
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
                                              <form  method="get" id="reg_form_direccion">
                                                  <div class="location_add_form well">
                                                    <div class="formSep">
                                                            <div class="input-prepend">
                                                            <label>Nombre</label>
                                                            <textarea cols="30" rows="4" class="span10" id="txtDireccion" name="txtDireccion" />
                                                            </div>
                                                              
                                                        <input type="hidden" id="IdDireccionLlegada"  name="IdDireccionLlegada" value="0" />
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
                                $('#reg_form_direccion').validate({
                                        lang: 'es',
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',                                        
                                            submitHandler: function() {   
                                                 $('#form').hide();
                                                 $('#cargando').show();  
                                                    var url = "operaciones/direccion_llegada/insert.jsp";                                                     
                                                    $.ajax({
                                                           type: "POST",
                                                           url: url,
                                                           data: $("#reg_form_direccion").serialize(), 
                                                           success: function(data)
                                                           {
                                                               if(data<=0)
                                                                 $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                                                else if(data>0)
                                                                {
                                                                    
                                                                   $('#direccion').html('<div id="direccion">'+$('#txtDireccion').val()+'</div>');
                                                                    
                                                                   $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });
                                                                   setEstadoDireccion(data); 
                                                               }
                                                           }
                                                         });    
                                            },
					rules: {
						txtDireccion: { required: true, minlength: 3 }
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
                                          $('#txtDireccion').val("");
                                           
                                      };
</script>

<%}%>  
                                                                        
                                                                       
                                                                            