<%@page import="Entidades.entContenedor"%>
<%@page import="Entidades.entDepartamento"%>
<%@page import="Entidades.entOperadorLogistico"%>
<%@page import="Entidades.entChofer"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCliente"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
int size=0;
objSession.setObjPaleta(new entPaleta());
 List<entCliente> listCliente=clsGestor.ListarCliente(true);
%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
             <div class="span3">
                <div class="row-fluid" id="g-map-top">
                    <div class="span12">
                        <div class="location_add_form well">
                            <div class="formSep">
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalClienteClienteFacturable'><i class='splashy-zoom'></i></a></span> Cliente Facturable </label>
                                    <di id='nClienteFacturable'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idClienteFacturable"  name="idClienteFacturable"/>
                                </div>
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalExportador'><i class='splashy-zoom'></i></a></span> Exportador </label>
                                    <di id='nExportador'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idExportador"  name="idExportador" value="" />
                                </div>
                                 <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalConsignatario'><i class='splashy-zoom'></i></a></span> Consignatario </label>
                                    <di id='nConsignatario'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idConsignatario"  name="idConsignatario" value="" />
                                </div>
                            </div>
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalChofer'><i class='splashy-zoom'></i></a></span> Chofer </label>
                                    <di id='nChofer'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idChofer"  name="idChofer" value="" />
                                </div>
                                 <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalOperadorLogistico'><i class='splashy-zoom'></i></a></span> Operador Logistico </label>
                                    <di id='nOperadorLogistico'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idOperadorLogistico"  name="idOperadorLogistico" value="" />
                                </div>
                            
                         </div>
                    </div>
                </div>
            </div>
          
            <div class="span3">
                <div class="row-fluid" id="g-map-top">
                    <div class="span12">
                        <div class="location_add_form well">
                               <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalUbigeo'><i class='splashy-zoom'></i></a></span> Distrito </label>
                                    <di id='nDistrito'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idDistrito"  name="idDistrito" value="" />
                                </div>
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalContenedor'><i class='splashy-zoom'></i></a></span> Contenedor </label>
                                    <di id='nContenedor'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="XContenedor"  name="XContenedor" value="" />
                                        <input type="hidden" id="YContenedor"  name="YContenedor" value="" />
                                        <input type="hidden" id="idContenedor"  name="idContenedor" value="" />
                                </div>
                        </div>
                    </div>
                </div>
            </div>
          
            <div class="span3">
                <div class="row-fluid" id="g-map-top">
                    <div class="span12">
                        <div class="location_add_form well">
                                <div class="input-prepend">
                                    <label>Estado <span class='add-on'><a  data-toggle='modal' data-backdrop='static' href='#ModalCliente'><i class='splashy-zoom'></i></a></span> </label>
                                    <di id='CampaniaLote'>
                                    <blockquote >
                                    <p>Cliente</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idCliente"  name="idCliente" value="" />
                                </div>
                        </div>
                    </div>
                </div>
            </div>
           <div class="span3">
                <div class="row-fluid" id="g-map-top">
                    <div class="span12">
                        <div class="location_add_form well">
                            <div class="formSep">
                                <div class="input-prepend">
                                    <label>Codigo de Control</label>
                                    <input type="text" class="span12" id="txtCodigo"  name="txtCodigo" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Codigo de Control</label>
                                    <input type="text" class="span12" id="txtCodigo"  name="txtCodigo" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Codigo de Control</label>
                                    <input type="text" class="span12" id="txtCodigo"  name="txtCodigo" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Codigo de Control</label>
                                    <input type="text" class="span12" id="txtCodigo"  name="txtCodigo" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Codigo de Control</label>
                                    <input type="text" class="span12" id="txtCodigo"  name="txtCodigo" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Codigo de Control</label>
                                    <input type="text" class="span12" id="txtCodigo"  name="txtCodigo" />
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
                                <button id="btnGrabar" class="btn btn-invert" onclick="grabar_data()" type="button">Grabar</button>
                                <button class="btn btn-invert" id="prueba"  type="button">Limpiar Lista</button>
                        </div>
                    </div>
                </div>
            </div>
              </form>

           <div id="ContenedorFilas"></div>                                                                               
 </div>
    
    
    
 <!-- Modal ClienteFacturable -->	
<div class="modal hide fade" id="ModalClienteClienteFacturable" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Cliente Facturable</h3>
    </div>
    <div class="modal-body">
        <table id="tablaClienteClienteFacturable" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>RUC</th>
                           <th>Dirección</th>                         
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            
            if(listCliente!=null)
            for(entCliente entidad : listCliente)
            {
            %>

                <tr>
                    <td><%=entidad.getId_cliente()%></td>
                    <td><%=entidad.getNombre()%></td>
                    <td><%=entidad.getRuc()%></td>
                    <td><%=entidad.getDireccion()%></td>                 
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectClienteFacturable(<%=entidad.getId_cliente()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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

   <!-- Modal Exportador -->	
<div class="modal hide fade" id="ModalExportador" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Exportador</h3>
    </div>
    <div class="modal-body">
        <table id="tablaExportador" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>RUC</th>
                           <th>Dirección</th>                         
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            
            if(listCliente!=null)
            for(entCliente entidad : listCliente)
            {
            %>

                <tr>
                    <td><%=entidad.getId_cliente()%></td>
                    <td><%=entidad.getNombre()%></td>
                    <td><%=entidad.getRuc()%></td>
                    <td><%=entidad.getDireccion()%></td>                 
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectExportador(<%=entidad.getId_cliente()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
   
    <!-- Modal Consignatario -->	
<div class="modal hide fade" id="ModalConsignatario" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Consignatario</h3>
    </div>
    <div class="modal-body">
        <table id="tablaConsignatario" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>RUC</th>
                           <th>Dirección</th>                         
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            
            if(listCliente!=null)
            for(entCliente entidad : listCliente)
            {
            %>

                <tr>
                    <td><%=entidad.getId_cliente()%></td>
                    <td><%=entidad.getNombre()%></td>
                    <td><%=entidad.getRuc()%></td>
                    <td><%=entidad.getDireccion()%></td>                 
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectConsignatario(<%=entidad.getId_cliente()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
   
    <!-- Modal Chofer -->	
<div class="modal hide fade" id="ModalChofer" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Chofer</h3>
    </div>
    <div class="modal-body">
      <table id="tablaChofer" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Brevete</th>
                    <th>Emp. Transportista</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%
    List<entChofer> list=clsGestor.ListarChofer(true);
    if(list!=null)
    for(entChofer entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_chofer()%></td>
            <td><%=entidad.getNombre()%></td>
            <td><%=entidad.getBrevete()%></td>
             <td><%=entidad.getObjTransportista().getRazon_social()%></td>

            <td>
                <a data-dismiss="modal"  href="javascript:void(0)" onclick="selectChofer(<%=entidad.getId_chofer()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
          
  <!-- Modal OperadorLogisticoFacturable -->	
<div class="modal hide fade" id="ModalOperadorLogistico" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Operador Logistico </h3>
    </div>
    <div class="modal-body">
        <table id="tablaOperadorLogistico" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            List<entOperadorLogistico> listOperadorLogistico=clsGestor.ListarOperadorLogistico(true);
            if(listOperadorLogistico!=null)
            for(entOperadorLogistico entidad : listOperadorLogistico)
            {
            %>

                <tr>
                    <td><%=entidad.getId_operador_logistico()%></td>
                    <td><%=entidad.getNombre()%></td>               
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectOperadorLogistico(<%=entidad.getId_operador_logistico()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
 
  
   <!-- Modal Contednedor -->	
<div class="modal hide fade" id="ModalContenedor" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Contenedor </h3>
    </div>
    <div class="modal-body">
        <table id="tablaContenedor" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>Posiciones X</th>
                           <th>Posiciones Y</th>
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            List<entContenedor> listContenedor=clsGestor.ListarContenedor(true);
            if(listContenedor!=null)
            for(entContenedor entidad : listContenedor)
            {
            %>

                <tr>
                    <td><%=entidad.getId_contenedor()%></td>
                    <td><%=entidad.getNombre()%></td>    
                     <td><%=entidad.getPos_x()%></td>  
                      <td><%=entidad.getPos_y()%></td>  
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectContenedor(<%=entidad.getId_contenedor()%>,'<%=entidad.getNombre()%>',<%=entidad.getPos_x()%>,<%=entidad.getPos_y()%>)" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
                        
  <!-- Modal Distrito -->	
<div class="modal hide fade" id="ModalUbigeo" >
    <div class="modal-header">
        <button id="CerraDistrito" class="close" data-dismiss="modal">×</button>
        <h3>Buscar Distrito </h3>
    </div>
    <div class="modal-body">
        <center>
        <table>
            <tr>
                <td>
                    <select id="cbDepartamento" name="cbDepartamento" title="Por favor selecione un Departamento!" required>
                        <option value="">Selecione una Opción</option>
                     <% 
                         List<entDepartamento> listDepartamento=clsGestor.listarDepartamento();
                         if(listDepartamento!=null)
                             for(entDepartamento entidad : listDepartamento)
                                 out.print("<option value='"+entidad.getId_departamento()+"'>"+entidad.getNombre()+"</option>");
                      %>
                    </select>
                </td>
            </tr>
             <tr>
                <td>
                    <select id="cbProvincia" name="cbProvincia" title="Por favor selecione un Provincia!"  required>
                        <option value="">Selecione una Opción</option>
                    </select>
                </td>
            </tr>
             <tr>
                <td>
                     <select id="cbDistrito" name="cbDistrito" title="Por favor selecione un Distrito!"  required>
                        <option value="">Selecione una Opción</option>
                    </select>
                </td>
            </tr>
        </table>
        </center>            
         
        
    </div>
  
</div>   
            
            
<script type="text/javascript">
var size='0';   
var ContenedoresPos = new Array();

function selectPosicion(pos)
{
   ContenedoresPos.push(pos);
};
function selectClienteFacturable(id,nombre)
{
    $('#idClienteFacturable').val(id);                                         
    $('#nClienteFacturable').html("<di id='nClienteFacturable'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectExportador(id,nombre)
{
    $('#idExportador').val(id);                                           
    $('#nExportador').html("<di id='nExportador'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectConsignatario(id,nombre)
{
    $('#idConsignatario').val(id);                                           
    $('#nConsignatario').html("<di id='nConsignatario'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectChofer(id,nombre)
{
    $('#idChofer').val(id);                                           
    $('#nChofer').html("<di id='nChofer'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectOperadorLogistico(id,nombre)
{
    $('#idOperadorLogistico').val(id);                                           
    $('#nOperadorLogistico').html("<di id='nOperadorLogistico'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectContenedor(id,nombre,posX,posY)
{
    $('#idContenedor').val(id);                                           
    $('#nContenedor').html("<di id='nContenedor'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
$(document).ready(function() {  
    $('#tablaClienteClienteFacturable').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    $('#tablaExportador').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    $('#tablaConsignatario').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
     $('#tablaChofer').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    $('#tablaOperadorLogistico').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    $('#tablaContenedor').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    
     $('#cbDepartamento').on('change', function() {
        
        if($(this).val()!="")
        {
             $.ajax({
                url: 'operaciones/ubigeo/list_combo_provincia.jsp?id='+$(this).val(),
                type: 'POST',
                success: function (data) {     
                         $('#cbProvincia').html(data);
                         $('#cbDistrito').html('<select id="cbDistrito" name="cbDistrito" title="Por favor selecione un Distrito!"  required><option value="">Selecione una Opción</option></select>');
                         
                },
                contentType: false,
                processData: false
            });          
        }
            //$("#CerraDistrito").trigger("click");
           // alert();
    });
    
     $('#cbProvincia').on('change', function() {
        
        if($(this).val()!="")
        {
             $.ajax({
                url: 'operaciones/ubigeo/list_combo_distrito.jsp?id='+$(this).val(),
                type: 'POST',
                success: function (data) {     
                         $('#cbDistrito').html(data);
                },
                contentType: false,
                processData: false
            });          
        }
            //$("#CerraDistrito").trigger("click");
           // alert();
    });
    
    $('#cbDistrito').on('change', function() {
        
        if($(this).val()!="")
        {
            $('#idDistrito').val($(this).val());                                           
            $('#nDistrito').html("<di id='nDistrito'><blockquote><p>"+$("#cbDistrito :selected").text()+"</p></blockquote></di>");  
            $("#CerraDistrito").trigger("click");
        }
            
           // 
    });
    $('#prueba').click(function(){
         $.ajax({
                url: 'operaciones/contenedor/contenedor_filas.jsp?XContenedor=10&YContenedor=4',
                type: 'POST',
                success: function (data) {     
                         $('#ContenedorFilas').html(data);
                },
                contentType: false,
                processData: false
            });      
    });
});

</script>
  </div>
<%
}%>  