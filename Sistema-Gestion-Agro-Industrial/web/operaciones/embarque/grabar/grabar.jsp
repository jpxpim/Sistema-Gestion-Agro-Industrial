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
                                    <label>Estado <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalCliente'><i class='splashy-zoom'></i></a></span> </label>
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
                                <div class="input-prepend">
                                    <label>Estado <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalCliente'><i class='splashy-zoom'></i></a></span> </label>
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
                                <div class="input-prepend">
                                    <label>Estado <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalCliente'><i class='splashy-zoom'></i></a></span> </label>
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
                                <button class="btn btn-invert" onclick="clear_list()" type="button">Limpiar Lista</button>
                        </div>
                    </div>
                </div>
            </div>
              </form>

                                                                                        
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
      <table id="listaChofer" class="table table-striped location_table">
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
                <a data-dismiss="modal"  href="javascript:void(0)" onclick="seleccionChofer(<%=entidad.getId_chofer()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-primary btn-mini">Seleccionar</a>

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
          
            
      
<script type="text/javascript">
var size='0';   

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
    
});

</script>
  </div>
<%
}%>  