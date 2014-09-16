<%@page import="Entidades.entEmbarque"%>
<%@page import="Entidades.entPuerto"%>
<%@page import="Entidades.entLineaNaviera"%>
<%@page import="Entidades.entViaEmbarque"%>
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


objSession.setObjEmbarque(new entEmbarque());

 List<entCliente> listCliente=clsGestor.ListarCliente(true);
 List<entPuerto> listPuerto=clsGestor.ListarPuerto(true);
%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
             <div class="span3">
                <div class="row-fluid" id="g-map-top">
                    <div class="span12">
                        <div class="location_add_form well">
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalContenedor'><i class='splashy-zoom'></i></a></span> Contenedor </label>
                                    <di id='nContenedor'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idContenedor"  name="idContenedor" value="" />
                                </div>
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
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalViaEmbarque'><i class='splashy-zoom'></i></a></span> Vía de Embarque </label>
                                    <di id='nViaEmbarque'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idViaEmbarque"  name="idViaEmbarque" value="" />
                                </div>
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalLineaNaviera'><i class='splashy-zoom'></i></a></span> Linea Naviera </label>
                                    <di id='nLineaNaviera'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idLineaNaviera"  name="idLineaNaviera" value="" />
                                </div>
                            
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalPuertoEmbarque'><i class='splashy-zoom'></i></a></span> Pueto de Embarque </label>
                                    <di id='nPuertoEmbarque'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idPuertoEmbarque"  name="idPuertoEmbarque" value="" />
                                </div>
                            
                                <div class="input-prepend">
                                    <label><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalPuertoDestino'><i class='splashy-zoom'></i></a></span> Pueto de Destino </label>
                                    <di id='nPuertoDestino'>
                                    <blockquote >
                                    <p>Esperando Selección</p>
                                    </blockquote>
                                    </di>
                                        <input type="hidden" id="idPuertoDestino"  name="idPuertoDestino" value="" />
                                </div>
                                <div class="input-prepend">
                                    <label>Precinto Operador Logistico</label>
                                    <input type="text" class="span12" id="txtPrecOpLogistico"  name="txtPrecOpLogistico" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Precinto SENASA</label>
                                    <input type="text" class="span12" id="txtPrecSenasa"  name="txtPrecSenasa" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Precinto ADUANAS</label>
                                    <input type="text" class="span12" id="txtPrecAduanas"  name="txtPrecAduanas" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Precinto Linea Naviera</label>
                                    <input type="text" class="span12" id="txtPrecLineaNaviera"  name="txtPrecLineaNaviera" />
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
                                    <label>Cold Treat</label>
                                    <label class="radio inline">
                                    <input type="radio" value="1"  id="rbColdTreat" name="rbColdTreat" />
                                        Activo
                                    </label>
                                    <label class="radio inline">
                                            <input type="radio" value="0" id="rbColdTreat" name="rbColdTreat" checked/>
                                            Desactivado
                                    </label>
                                </div>
                                <div class="input-prepend">
                                    <label>Vapor</label>
                                    <input type="text" class="span12" id="txtVapor"  name="txtVapor" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Container</label>
                                    <input type="text" class="span12" id="txtContainer"  name="txtContainer" />
                                </div>  
                                <div class="input-prepend">
                                    <label>Placa Container</label>
                                    <input type="text" class="span12" id="txtPlacaContainer"  name="txtPlacaContainer" />
                                </div>  
                                <div class="input-prepend">
                                    <label>Placa Carreta</label>
                                    <input type="text" class="span12" id="txtPlacaCarreta"  name="txtPlacaCarreta" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Fecha de Traslado</label>
                                    <input type="text" class="span12" id="txtFechaTraslado"  name="txtFechaTraslado" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Fecha de Partida</label>
                                    <input type="text" class="span12" id="txtFechaPartida"  name="txtFechaPartida" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Fecha de Arribo</label>
                                    <input type="text" class="span12" id="txtFechaArribo"  name="txtFechaArribo" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>Packing List</label>
                                    <input type="text" class="span12" id="txtPackingList"  name="txtPackingList" />
                                 </div>  
                                <div class="input-prepend">
                                    <label>T Set Point</label>
                                    <input type="text" class="span12" id="txtTSetPoint"  name="txtTSetPoint" />
                                 </div>  
                                 <div class="input-prepend">
                                    <label>T Despacho</label>
                                    <input type="text" class="span12" id="txtTDespacho"  name="txtTDespacho" />
                                 </div>  
                                 <div class="input-prepend">
                                    <label>Ventilación</label>
                                    <input type="text" class="span12" id="txtVentilacion"  name="txtVentilacion" />
                                 </div>  
                                 <div class="input-prepend">
                                    <label>Humedad</label>
                                    <input type="text" class="span12" id="txtHumedad"  name="txtHumedad" />
                                 </div>  
                                 <div class="input-prepend">
                                    <label>Cantidad de Filtros</label>
                                    <input type="text" class="span12" id="txtCantidadFiltros"  name="txtCantidadFiltros" />
                                 </div>  
                                 <div class="input-prepend">
                                    <label>Booking</label>
                                    <input type="text" class="span12" id="txtBooking"  name="txtBooking" />
                                 </div>  
                                 <div class="input-prepend">
                                    <label>Hora de Inicio</label>
                                    <input type="text" class="span12" id="txtHoraInicio"  name="txtHoraInicio" />
                                 </div>  
                                 <div class="input-prepend">
                                    <label>Hora de Fin</label>
                                    <input type="text" class="span12" id="txtHoraFin"  name="txtHoraFin" />
                                 </div>  
                                
                            </div>
                                <button class="btn btn-invert" type="submit">Grabar</button>
                                <button class="btn btn-invert" id="prueba"  type="button">Limpiar Lista</button>
                        </div>
                    </div>
                </div>
            </div>
       
           <div class="span6">
                <div id="listContenedor"></div>  
                 <input type="hidden" id="totalPalet"  name="totalPalet" value="" />
            </div>
          
              </form>   

                                                                                    
 </div>
    
      <!-- Modal PuertoEmbarque -->	
<div class="modal hide fade" id="ModalPuertoEmbarque" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Puerto de Embarque</h3>
    </div>
    <div class="modal-body">
      <table id="tablaPuertoEmbarque" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%    
    if(listPuerto!=null)
    for(entPuerto entidad : listPuerto)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_puerto()%></td>
            <td><%=entidad.getNombre()%></td>
            <td>
                <a data-dismiss="modal"  href="javascript:void(0)" onclick="selectPuertoEmbarque(<%=entidad.getId_puerto()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
  
    <!-- Modal PuertoDestino -->	
<div class="modal hide fade" id="ModalPuertoDestino" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar PuertoDestino</h3>
    </div>
    <div class="modal-body">
      <table id="tablaPuertoDestino" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
            </tr>
    </thead> 
     <tbody>      
    <%    
    if(listPuerto!=null)
   for(entPuerto entidad : listPuerto)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getId_puerto()%></td>
            <td><%=entidad.getNombre()%></td>
            <td>
                <a data-dismiss="modal"  href="javascript:void(0)" onclick="selectPuertoDestino(<%=entidad.getId_puerto()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
   <!-- Modal LineaNavieraFacturable -->	
<div class="modal hide fade" id="ModalLineaNaviera" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Linea Naviera </h3>
    </div>
    <div class="modal-body">
        <table id="tablaLineaNaviera" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%            
            List<entLineaNaviera> listLineaNaviera=clsGestor.ListarLineaNaviera(true);
            if(listLineaNaviera!=null)
            for(entLineaNaviera entidad : listLineaNaviera)
            {
            %>

                <tr>
                    <td><%=entidad.getId_linea_naviera()%></td>
                    <td><%=entidad.getNombre()%></td>               
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectLineaNaviera(<%=entidad.getId_linea_naviera()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
  <!-- Modal ViaEmbarqueFacturable -->	
<div class="modal hide fade" id="ModalViaEmbarque" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Vía de Embarque </h3>
    </div>
    <div class="modal-body">
        <table id="tablaViaEmbarque" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Nombre</th>
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            List<entViaEmbarque> listViaEmbarque=clsGestor.ListarViaEmbarque(true);
            if(listViaEmbarque!=null)
            for(entViaEmbarque entidad : listViaEmbarque)
            {
            %>

                <tr>
                    <td><%=entidad.getId_via_embarque()%></td>
                    <td><%=entidad.getNombre()%></td>               
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectViaEmbarque(<%=entidad.getId_via_embarque()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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
            
  <!-- Modal Detalle -->	
<div class="modal hide fade" id="ModalDetalle" >
    <div class="modal-header">
        <button id="CerraDetalle" class="close" data-dismiss="modal">×</button>
        <h3 id="pos"></h3>
    </div>
    <div class="modal-body">
        
    <div class="row-fluid" id="g-map-top">
       <form  method="get" id="detalle_form">
        <div class="span3">
          
        </div>
        <div class="span6">
            <div class="location_add_form well">
                 <div class="formSep">
                      <div class="input-prepend">
                    <label>Thermoregistro</label>
                    <input type="text" class="span12" id="txtThermoregistro"  name="txtThermoregistro" />
                 </div>  
                 <div id="sensor" class="input-prepend">
                    <label>Sensor</label>
                    <label class="radio inline">
                    <input type="radio" value="1"  id="rbColdTreat" name="rbSensor" />
                        Activo
                    </label>
                    <label class="radio inline">
                            <input type="radio" value="0" id="rbColdTreat" name="rbSensor"/>
                            Desactivado
                    </label>
                    
                </div>
                 <br>
                    <div class="input-prepend">
                    <label>Codigo (13 digitos)</label>
                    <div class="input-prepend">
                    <input  type="text" id="txtCodigo" class="span10"  name="txtCodigo" /><span id="validCodigo" class="add-on"><i  class="splashy-pencil"/></span>
                    </div>
                    <di id="contador" >digitos = <span class="label label-warning">0</span></di>
                    </div>    
                </div>
                <button class="btn btn-invert" type="submit">Grabar</button>
                  <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
            </div>
        </div>
           <div class="span3">
          
        </div>
           
           <input type="hidden" id="IdPaleta"  name="IdPaleta"/>
            <input type="hidden" id="Activo"  name="Activo"/>
            <input type="hidden" id="FProduccion"  name="FProduccion"/>
            <input type="hidden" id="Estado"  name="Estado"/>
            <input type="hidden" id="Posicicion"  name="Posicicion"/>
            <input type="hidden" id="PosI"  name="PosI"/>
        </form>
    </div>
 
</div>   
    
    
 
 
 <div id="data_paleta"></div>    
    
<script type="text/javascript">
var size='0';   
var paleta= {
     'entidad': [ 
    <%
    List<entPaleta> listPaleta = clsGestor.ListarPackingPaleta(false);
    if(listPaleta!=null)
    {
     int size=listPaleta.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_paleta': "+listPaleta.get(i).getId_paleta()+",'fecha_produccion': "+listPaleta.get(i).getFecha_produccion().getTime()+",'estado_paleta': "+listPaleta.get(i).getEstado_paleta()+",'posicion_paleta': "+listPaleta.get(i).getPosicion_paleta()+",'codigo_control': '"+listPaleta.get(i).getCodigo_control()+"','nombre_cliente': '"+listPaleta.get(i).getObjCliente().getNombre()+"'}");
        }else
        {
             out.print("{'id_paleta': "+listPaleta.get(i).getId_paleta()+",'fecha_produccion': "+listPaleta.get(i).getFecha_produccion().getTime()+",'estado_paleta': "+listPaleta.get(i).getEstado_paleta()+",'posicion_paleta': "+listPaleta.get(i).getPosicion_paleta()+",'codigo_control': '"+listPaleta.get(i).getCodigo_control()+"','nombre_cliente': '"+listPaleta.get(i).getObjCliente().getNombre()+"'},");
        }
    }%>
     ]
};

function selectPosicion(pos)
{
    $('#pos').html('<h3 id="pos">Agregar Detalle en Posición '+(pos+1)+'</h3>');   
    $('#PosI').val(pos);       
};
function quitarPosicion(pos,codigo)
{
    smoke.confirm('Desea Quitar Paleta: '+codigo,function(e){
        if (e){
             $.ajax({
                url: 'operaciones/embarque/grabar/quitar_list_tabla_temp.jsp?pos='+pos,
                type: 'POST',
                success: function () {     
                    lista();
                },
                contentType: false,
                processData: false
            });  
        }
    }, {cancel:"No",ok:"Si"}); 
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
    $.ajax({
                url: 'operaciones/embarque/grabar/crear_tabla_temp.jsp?idContenedor='+id+'&nContenedor='+nombre+'&XContenedor='+posX+'&YContenedor='+posY,
                type: 'POST',
                success: function () {     
                    lista();
                },
                contentType: false,
                processData: false
            });  
    $('#idContenedor').val(id);                                           
    $('#nContenedor').html("<di id='nContenedor'><blockquote><p>"+nombre+"</p></blockquote></di>");  
    
    
};
function lista()
{
     $.ajax({
            url: 'operaciones/embarque/grabar/list_tabla_temp.jsp',
            type: 'POST',
            success: function (data) {     
                     $('#listContenedor').html(data);
            },
            contentType: false,
            processData: false
        });  
};
function selectViaEmbarque(id,nombre)
{
    $('#idViaEmbarque').val(id);                                           
    $('#nViaEmbarque').html("<di id='nViaEmbarque'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectLineaNaviera(id,nombre)
{
    $('#idLineaNaviera').val(id);                                           
    $('#nLineaNaviera').html("<di id='nLineaNaviera'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectPuertoEmbarque(id,nombre)
{
    $('#idPuertoEmbarque').val(id);                                         
    $('#nPuertoEmbarque').html("<di id='nPuertoEmbarque'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
function selectPuertoDestino(id,nombre)
{
    $('#idPuertoDestino').val(id);                                         
    $('#nPuertoDestino').html("<di id='nPuertoDestino'><blockquote><p>"+nombre+"</p></blockquote></di>");  
};
$(document).ready(function() {  
     $('#sensor').hide();
    $('input[name="rbColdTreat"]').change(function() { 
        if($(this).val()==1)
            $('#sensor').show();
        else
            $('#sensor').hide();
    });
    
    $('#reg_form').validate({
        lang: 'es',
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
        ignore: "input[type='text']:hidden",
            submitHandler: function() {       
                    var url = "operaciones/embarque/grabar/add_list_tabla_temp.jsp"; 
                    $.ajax({
                           type: "POST",
                           url: url,
                           data: $("#reg_form").serialize(), 
                           success: function(data)
                           {
                               if(data==0)
                                 $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                else if(data==1)
                                {
                                    $("#CerraDetalle").trigger("click");                                    
                                     lista();
                                     clear_detalle();
                                   $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  
                                }
                           }
                         });    
           
            },
        rules: {
                idClienteFacturable: { required: true},
                idExportador: { required: true },
                idConsignatario: { required: true },
                idChofer: { required: true },
                idOperadorLogistico: { required: true },
                idDistrito: { required: true },
                idContenedor: { required: true },
                idViaEmbarque: { required: true },
                idLineaNaviera: { required: true },
                idPuertoEmbarque: { required: true },
                idPuertoDestino: { required: true },
                txtPrecOpLogistico: { required: true },
                txtPrecSenasa: { required: true },
                txtPrecAduanas: { required: true },
                txtPrecLineaNaviera: { required: true },
                txtVapor: { required: true },
                txtContainer: { required: true },
                txtPlacaContainer: { required: true },
                txtPlacaCarreta: { required: true },
                txtFechaTraslado: { required: true },
                txtFechaPartida: { required: true },
                txtFechaArribo: { required: true },
                txtPackingList: { required: true },
                txtTSetPoint: { required: true },
                txtTDespacho: { required: true },
                txtVentilacion: { required: true },
                txtHumedad: { required: true },
                txtCantidadFiltros: { required: true },
                txtBooking: { required: true },
                txtHoraInicio: { required: true },
                txtHoraFin: { required: true },
                totalPalet: { required: true, max:0 },
                rbColdTreat: { required: true }
        }, 
         messages: {
             'totalPalet'	: { required:  'Por favor Seleccione un Container', max:'Todos los espacios deben ser ocupados'},
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
   $('#detalle_form').validate({
        lang: 'es',
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
            submitHandler: function() {       
                if($('input#Activo').val()=="1"){
                    var url = "operaciones/embarque/grabar/add_list_tabla_temp.jsp"; 
                    $.ajax({
                           type: "POST",
                           url: url,
                           data: $("#detalle_form").serialize(), 
                           success: function(data)
                           {
                               if(data==0)
                                 $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                else if(data==1)
                                {
                                    $("#CerraDetalle").trigger("click");                                    
                                     lista();
                                     clear_detalle();
                                   $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  
                                }
                           }
                         });    
                }
                else
                    $.sticky("<center><h1>Paleta no Encontrada</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
               
            },
        rules: {
                txtCodigo: { required: true, minlength: 13, maxlength: 13 },
                rbSensor: { required: true },
                txtThermoregistro: { required: true, minlength: 2 }
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
    
    
    
    $("#txtCodigo").keyup(function(){   

    $(this).val($(this).val().trim().toUpperCase());    
   if(13>$(this).val().length)
   {
        $('#Activo').val("");
      $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">'+$(this).val().length+'</span></di>');
      $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
   }
   if(13==$(this).val().length)
   {
      
        $('#contador').html(' <di id="contador" >digitos = <span class="label label-success">'+$(this).val().length+'</span></di>');
        if(compruebaData($(this).val()))
       {   
          
          
           $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
          
       }
       else
            otraBusqueda($(this).val());
           
   }
   else if(13<$(this).val().length)
   {
        $('#Activo').val("");
      $('#contador').html(' <di id="contador" >digitos = <span class="label label-important">'+$(this).val().length+'</span></di>');
     $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
   }
       
     
});

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
    $('#tablaViaEmbarque').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    $('#tablaLineaNaviera').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    $('#tablaPuertoEmbarque').dataTable({
        "sPaginationType": "bootstrap",
        "bDestroy": true,
        "bDeferRender": true
    }); 
    $('#tablaPuertoDestino').dataTable({
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
                url: 'operaciones/contenedor/contenedor_filas.jsp?XContenedor=10&YContenedor=2',
                type: 'POST',
                success: function (data) {     
                         $('#listContenedor').html(data);
                },
                contentType: false,
                processData: false
            });      
    });
});
 function clear_detalle()
{
    $('#IdPaleta').val("");
    $('#txtCodigo').val("");
    $('#FProduccion').val("");
    $('#Estado').val("");
    $('#Posicicion').val("");
    $('#Cliente').val("");
    $('#PosX').val("");
    $('#PosY').val("");
     $('input:radio[name=rbSensor]').attr('checked',false);
    $('#txtThermoregistro').val("");
};
function otraBusqueda(codigo)
{
    $.ajax({
            url: 'operaciones/paleta/data_paleta.jsp?cocmpleto=0',
            type: 'POST',
            success: function (data) {     
                    $('#data_paleta').html(data);
                    if(compruebaData(codigo))
                    {
                        $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
                       
                    }
                    else
                    {
                        $('#Activo').val("");
                       $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
                       $.sticky("<center><h1>Código no encontrado</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
                    }
                    
                      
            },
            contentType: false,
            processData: false
    });
    
}
function compruebaData(data)
{
   var valida=false;
   var maxI =paleta.entidad.length-1;
   for (i = 0; i <=maxI; i++) { 
        if(paleta.entidad[i].codigo_control.toUpperCase()==data.toUpperCase())
        {
             $('#IdPaleta').val(paleta.entidad[i].id_paleta);
             $('#Activo').val(1);
             $('#FProduccion').val(paleta.entidad[i].fecha_produccion);
             $('#Estado').val(paleta.entidad[i].estado_paleta);
             $('#Posicicion').val(paleta.entidad[i].posicion_paleta);
            
            i=maxI;
            valida=true;
        }   
    }
    return valida;
}; 
</script>
  </div>
<%
}%>  