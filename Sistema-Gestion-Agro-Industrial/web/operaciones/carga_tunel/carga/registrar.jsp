
<%@page import="Entidades.entCargaTunel"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entTunel"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entLineaProduccion"%>
<%@page import="Entidades.entEmpleado"%>
<%@page import="Entidades.entLote"%>
<%@page import="Entidades.entColor"%>
<%@page import="Entidades.entCategoria"%>
<%@page import="Entidades.entCalibre"%>
<%@page import="Entidades.entEnvase"%>
<%@page import="java.util.List"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    int size=0;
if(!objSession.isDia_recepcion())
{
    SimpleDateFormat e=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");
    if(objSession.getObjDiaRecepcion()==null)
    {
        objSession.setObjDiaRecepcion(clsGestor.verificarDiaRecepcion());
    }

     if(objSession.getObjDiaRecepcion()==null)
     {
          if(objSession.getObjUsuario().isEs_administrador()||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_1() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_2() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_3())
         {
%>
<div id="frame">
    <div class="row-fluid">
        <div class="span4">
            <h3 class="heading">Iniciar Nuevo día de Producción</h3>  
            <center>
                <button class="btn btn-invert" onclick="SetRecepccion(0)" type="button">Iniciar</button>
            </center>
        </div>
    </div>
</div>
<% 
         }
         else
         {
%>

<div id="frame">
    <div class="row-fluid">
        <div class="6">
            <h3 class="heading">Espere que el ecargado inicie un nuevo día de Producción</h3> 
        </div>
    </div>
</div>
<%      
         }
  
     }
     else
     {
        if(objSession.getObjUsuario().isEs_administrador()||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_1() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_2() ||
            objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_3())
         {
%>
<div id="frame">
    <div class="row-fluid">
        <div class="span5">
            <h3 class="heading">Día de Producción Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
            <center>
                <button class="btn btn-invert" onclick="SetRecepccion(1)" type="button">Cerrar</button>
                <button class="btn btn-invert" onclick="SetRecepccion(2)" type="button">Continuar</button>
            </center>
        </div>
    </div>
</div>
<% 
}
else
{
%>
<div id="frame">
    <div class="row-fluid">
        <div class="span5">
            <h3 class="heading">Día de Producción Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
            <center>
                <button class="btn btn-invert" onclick="SetRecepccion(2)" type="button">Continuar</button>
            </center>
        </div>
    </div>
</div>
<%      
         }
     }
 
    
    
//final
}
else
{

    if(objSession.getObjCargaTunel()==null)
        objSession.setObjCargaTunel(new entCargaTunel());
    else if(objSession.getObjCargaTunel().getId_carga_tunel()>0)        
        objSession.setObjCargaTunel(new entCargaTunel());
    
    
%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
             <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                           
                                                                            <div class="formSep">
                                                                                     <div class="input-prepend">
                                                                                        <di id='Tunel'>
                                                                                                <blockquote >
                                                                                                    <p>Tunel
                                                                                                          <span class='add-on'>
                                                                                                              <a data-toggle='modal' data-backdrop='static' href='#ModalTunel'><i class='splashy-zoom'></i></a>
                                                                                                          </span> 
                                                                                                    </p> <blockquote><p>Capacidad</p></blockquote>
                                                                                                </blockquote>
                                                                                          </di>
                                                                                        <input type="hidden" id="idTunel"  name="idTunel"/>
                                                                                        <input type="hidden" id="cTunel"  name="cTunel" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Estado</label>
                                                                                    <label class="radio inline">
                                                                                    <input type="radio" value="1"  id="rbEstado" name="rbEstado" />
                                                                                        Completa
                                                                                    </label>
                                                                                    <label class="radio inline">
                                                                                            <input type="radio" value="2" id="rbEstado" name="rbEstado" />
                                                                                            Incompleta
                                                                                    </label>
                                                                                     </div>
                                                                                    <br>
                                                                                    <div class="input-prepend">
                                                                                    <label>Codigo (13 digitos)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtCodigo" name="txtCodigo" /><span id="validCodigo" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <di id="contador" >digitos = <span class="label label-warning">0</span></di>
                                                                                    </div>                                                                                   

                                                                            </div>
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="grabar_data()" type="button">Grabar</button>
                                                                            
                                                                            <button class="btn btn-invert" onclick="clear_list()" type="button">Limpiar Lista</button>
                                                                            <a id="buscar" data-toggle='modal' data-backdrop='static' class="btn" href='#ModalPaleta'>Buscar Origen</a>
                                                                          </div>
                                                                          <div id="carga_tunel"></div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                            <div class="span8">
                                        <div id="tabla"> </div>
                                   </div>
              </form>

                                                                                        
 </div>
    
   
    
 <!-- Modal Tunel -->	
<div class="modal hide fade" id="ModalTunel" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Campaña de un Lote</h3>
    </div>
    <div class="modal-body">
        <table id="tablaTunel" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Pos X</th>
                            <th>Pos Y</th>
                            <th>Pos H</th>                     
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
             List<entTunel> listTunel=clsGestor.ListarTunel(true);
            if(listTunel!=null)
            for(entTunel entidad : listTunel)
            {
            %>

                <tr>
                    <td><%=entidad.getId_tunel()%></td>
                    <td><%=entidad.getNombre()%></td>
                    <td><%=entidad.getDescripcion()%></td>
                    <td><%=entidad.getPos_x()%></td>
                    <td><%=entidad.getPos_y()%></td>
                    <td><%=entidad.getPos_h()%></td>           
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectTunel(<%=entidad.getId_tunel()%>,'<%=entidad.getNombre()%>',<%=((entidad.getPos_y()*entidad.getPos_x())*entidad.getPos_h())%>)" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

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

 <!-- Modal Producto Terminado -->	
<div class="modal hide fade" id="ModalPaleta" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Origen de Producto</h3>
    </div>
    <div class="modal-body">
        <div id="origen"></div>
    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
        
    </div>
</div>                 
   
 <form  method="get" id="detalle_form">
    <input type="hidden" id="IdPaleta"  name="IdPaleta"/>
    <input type="hidden" id="Codigo"  name="Codigo"/>
    <input type="hidden" id="FProduccion"  name="FProduccion"/>
    <input type="hidden" id="Estado"  name="Estado"/>
    <input type="hidden" id="Posicicion"  name="Posicicion"/>
    <input type="hidden" id="Cliente"  name="Cliente"/>
</form>                                                                           
<div id="data_paleta"></div>                          
<script type="text/javascript">
var size='0';   

var validGrabaDetalle=true;

var paleta= {
     'entidad': [ 
    <%
    List<entPaleta> listPaleta = clsGestor.ListarPorDiaRecepccionPaleta(objSession.getObjDiaRecepcion().getId_dia_recepcion());
    if(listPaleta!=null)
    {
      size=listPaleta.size();
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

$(document).ready(function() {  


$("#txtCodigo").keyup(function(){   

    $(this).val($(this).val().trim().toUpperCase());    
   if(13>$(this).val().length)
   {
       
       $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">'+$(this).val().length+'</span></di>');
      $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
   }
   if(13==$(this).val().length)
   {
      
        $('#contador').html(' <di id="contador" >digitos = <span class="label label-success">'+$(this).val().length+'</span></di>');
        if(compruebaData($(this).val()))
       {   
          
          
           $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
           if(validGrabaDetalle)
            {
                validGrabaDetalle=false;
                grabarDetalle();
            }
 
           
       }
       else
            otraBusqueda($(this).val());
           
   }
   else if(13<$(this).val().length)
   {
      $('#contador').html(' <di id="contador" >digitos = <span class="label label-important">'+$(this).val().length+'</span></di>');
     $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
   }
       
     
});


});
function otraBusqueda(codigo)
{
    $.ajax({
            url: 'operaciones/paleta/data_paleta.jsp',
            type: 'POST',
            success: function (data) {     
                    $('#data_paleta').html(data);
                    if(compruebaData(codigo))
                    {
                        $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_up"/>');
                        if(validGrabaDetalle)
                        {
                            validGrabaDetalle=false;
                            grabarDetalle();                            
                        }

                    }
                    else
                    {
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
            i=maxI;
            valida=true;
             $('#IdPaleta').val(paleta.entidad[i].id_paleta);
             $('#Codigo').val(paleta.entidad[i].codigo_control);
             $('#FProduccion').val(paleta.entidad[i].fecha_produccion);
             $('#Estado').val(paleta.entidad[i].estado_paleta);
             $('#Posicicion').val(paleta.entidad[i].posicion_paleta);
             $('#Cliente').val(paleta.entidad[i].nombre_cliente);
            
        }   
    }
    return valida;
}; 

function grabarDetalle(){  
  var url = "operaciones/carga_tunel/carga/add_list_detalle_carga_tunel_temp.jsp"; 
    $.ajax({
    type: "POST",
    url: url,
    data: $("#detalle_form").serialize(), 
        success: function(data)
        {
            if(data==0)
            {
                 $('#validCodigo').html('<i id="validCodigo" class="splashy-thumb_down"/>');
                $.sticky("<center><h1>Código Repetido</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
               
            }   
            else if(data==1)
            {
                $("#txtCodigo").val(""); 
                $('#contador').html(' <di id="contador" >digitos = <span class="label label-warning">0</span></di>');
                $('#validCodigo').html('<i id="validCodigo" class="splashy-pencil"/>');
                $('#paleta').html('<div id="paleta"></div>');
                tabla();
            }            
            validGrabaDetalle=true;
            
           
        }
    }); 
};
function tabla()
{
     $.ajax({
        url: 'operaciones/carga_tunel/carga/list_detalle_carga_tunel_temp.jsp',
        type: 'POST',
        success: function (data) {     
                 $('#tabla').html(data);
        },
        contentType: false,
        processData: false
    });          
 };
  function removerItem(pos,codigo)
{
    smoke.confirm('Desea Quitar producto con codigo '+codigo,function(e){
                if (e){
                    $.ajax({
                        url: 'operaciones/carga_tunel/carga/delete_item_list_detalle_carga_tunel_temp.jsp?pos='+pos,
                        type: 'POST',
                        success: function () {     
                                tabla();
                        },
                        contentType: false,
                        processData: false
                    });   
                }
        }, {cancel:"No",ok:"Si"});
                    
 };
 tabla();
$("#reg_form").submit(function(){
  return false;
});
$("#detalle_form").submit(function(){
  return false;
});
</script>
  </div>
<%
}}%>  
                                                                        
                                                                       
                                                                            