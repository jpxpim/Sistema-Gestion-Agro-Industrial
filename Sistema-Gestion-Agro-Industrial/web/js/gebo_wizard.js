/* [ ---- Gebo Admin Panel - wizard ---- ] */

	$(document).ready(function() {
		//* simple wizard
		gebo_wizard.simple();
		//* wizard with validation
		gebo_wizard.validation();
		//* add step numbers to titles
		gebo_wizard.steps_nb();
	});

	gebo_wizard = {
		simple: function(){
                   
			$('#simple_wizard').stepy({
				titleClick	: true,
				nextLabel:      'Siquiente <i class="icon-chevron-right icon-white"></i>',
				backLabel:      '<i id="atraz" class="icon-chevron-left"></i> Atras'
			});
		},
		validation: function(){
			$('#validate_wizard').stepy({
				nextLabel:      'Siguiente <i class="icon-chevron-right icon-white"></i>',
				backLabel:      '<i id="atraz" class="icon-chevron-left"></i> Atras',
				titleClick	: true,
				validate	: true
			});
			stepy_validation = $('#validate_wizard').validate({
				onfocusout: false,
				errorPlacement: function(error, element) {
					error.appendTo( element.closest("div.controls") );
				},
				highlight: function(element) {
					$(element).closest("div.control-group").addClass("error f_error");
					var thisStep = $(element).closest('form').prev('ul').find('.current-step');
					thisStep.addClass('error-image');
				},
				unhighlight: function(element) {
					$(element).closest("div.control-group").removeClass("error f_error");
					if(!$(element).closest('form').find('div.error').length) {
						var thisStep = $(element).closest('form').prev('ul').find('.current-step');
						thisStep.removeClass('error-image');
					};
				},
                                submitHandler: function() {       
                                            $("#myModal").modal('show'); 
                                                    var url = "../operaciones/usuario/insert.jsp"; 

                                                    $.ajax({
                                                           type: "POST",
                                                           url: url,
                                                           data: $("#validate_wizard").serialize(), 
                                                           success: function(data)
                                                           {                                                             
                                                                $('#myModal').modal('hide');
                                                               if(data==-1)
                                                                 $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                                                else if(data==0)
                                                                {
                                                                    clear_form();
                                                                    tabla();
                                                                   $.sticky("Se Actualizo Correctamente.", {autoclose : 5000, position: "top-center" });
                                                                    
                                                               }
                                                                else if(data>0)
                                                                {
                                                                   clear_form();                                                                  
                                                                   tabla();
                                                                   $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  
                                                                   
                                                                }
                                                           }
                                                         });    
                                            },
				rules: {
					'txtNombres'	: {
						required	: true,
						minlength	: 3
					},
                                        'txtApellidos'	: {
						required	: true,
						minlength	: 3
					},
                                        txtTelefono: { 
                                            required: true,
                                            digits:true,
                                            rangelength:[9, 9] 
                                        },
                                        txtCelular: { 
                                            required: true,
                                            digits:true,
                                            rangelength:[9, 9] 
                                        },
					'txtEmail'	: 'email required',
					'txtFNacimiento': 'required',
                                        'rbEstado'	: 'required',
                                        'txtCodigoERP'	: 'required',
                                        'txtLogin'	: 'required',
                                         txtFoto: { 
                                            required: true,
                                            minlength	: 3
                                        },
                                        txtResponsable: { 
                                            required: true,
                                            minlength	: 3
                                        }
				}, messages: {
                                        'txtNombres'	: { required:  'Se requiere el campo Nombres!' },
                                        'txtApellidos'	: { required:  'Se requiere el campo Apellidos!' },
                                        'txtTelefono'	: { required:  'Se requiere el campo Telefono!' },
                                        'txtResponsable': { required:  'Se requiere el campo Responsable!' },
                                        'txtLogin'	: { required:  'Se requiere el campo Login!' },
                                        'txtCodigoERP'	: { required:  'Se requiere el campo Código ERP!' },
                                        'txtCelular'	: { required:  'Se requiere el campo Celular!' },
                                        'txtFoto'	: { required:  'Se requiere selecionar una Imagen!' },
                                        'rbEstado'	: { required:  'Se requiere selecionar un Estado!' },
					'txtFNacimiento': { required:  'Se requiere el campo Fecha de Nacimiento!' },
					'txtEmail'	: { email	:  'Correo Electronico invalido!' },
				},
				ignore				: ':hidden'
			});
		},
		//* add numbers to step titles
		steps_nb: function(){
			$('.stepy-titles').each(function(){
				$(this).children('li').each(function(index){
					var myIndex = index + 1
					$(this).append('<span class="stepNb">'+myIndex+'</span>');
				})
			})
		}
	};