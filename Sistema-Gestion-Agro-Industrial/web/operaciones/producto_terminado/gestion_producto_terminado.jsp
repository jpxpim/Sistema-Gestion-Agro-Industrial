
<%@page import="Entidades.entDiaRecepcion"%>
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
    entDiaRecepcion objDiaRecepcion=objSession.getObjDiaRecepcion();
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
                                                                                    <label>Linea Producción</label>
                                                                                    <select id="cbLineaProduccion"  class="span12" name="cbLineaProduccion" >
                                                                                        <option value="">Selecione una Opción</option>
                                                                                        <%List<entLineaProduccion> listLineaProduccion=clsGestor.ListarLineaProduccion(true,false);
                                                                                            if(listLineaProduccion!=null)
                                                                                                for(entLineaProduccion entidad : listLineaProduccion)
                                                                                                    out.print("<option value='"+entidad.getId_linea_produccion()+"'>"+entidad.getNombre()+"</option>");                                         
                                                                                         %>
                                                                                        </select>
                                                                                    </div>
                                                                                     <div class="input-prepend">
                                                                                         <label id="contadorEnvase" >Envase (6 digitos de <span class="label label-warning">0</span>)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtEnvase" class="span10"  name="txtEnvase" /><span id="validEnvase" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idEnvase"  name="idEnvase" />
                                                                                    </div>                                                                                  
                                                                                    <div class="input-prepend">
                                                                                     <label id="contadorCategoria" >Categoria (6 digitos de <span class="label label-warning">0</span>)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtCategoria" class="span10" name="txtCategoria" /><span id="validCategoria" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idCategoria"  name="idCategoria" />
                                                                                    </div>
                                                                                    
                                                                                    <div class="input-prepend">
                                                                                    <label id="contadorLote" >Lote (6 digitos de <span class="label label-warning">0</span>)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtLote" class="span10" name="txtLote" /><span id="validLote" class="add-on"><i class="splashy-pencil"/></span>
                                                                                        </div>         
                                                                                    <input type="hidden" id="idLote"  name="idLote" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label id="contadorColor" >Calibre + Color (9 digitos de <span class="label label-warning">0</span>)</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtColor" class="span10" name="txtColor" /><span id="validColor" class="add-on"><i class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idCalibre"  name="idCalibre" />
                                                                                    <input type="hidden" id="idColor"  name="idColor" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label id="contadorSeleccionador" >Seleccionador(8 digitos de <span class="label label-warning">0</span>)</label>                                                                                    
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtSeleccionador" class="span10" name="txtSeleccionador" /><span id="validSeleccionador" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idSeleccionador"  name="idSeleccionador" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label id="contadorEmpaquetador" >Empaquetador(8 digitos de <span class="label label-warning">0</span>)</label>                                                                                    
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtEmpaquetador" class="span10" name="txtEmpaquetador" /><span id="validEmpaquetador" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idEmpaquetador"  name="idEmpaquetador" />
                                                                                    <input type="hidden" id="reempaque"  name="reempaque"  value="0" /> 
                                                                                    <input type="hidden" id="idDiaRecepcion"  name="idDiaRecepcion"  value="<%=objDiaRecepcion.getId_dia_recepcion()%>" /> 
                                                                                    
                                                                                    </div>                                                                                   

                                                                            </div>
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="actulizar_data()" type="button">Grabar</button>
                                                                            <input type="hidden" id="IdProductoTerminado"  name="IdProductoTerminado"  value="0"/>
                                                                            <button class="btn btn-invert" onclick="clear_all()" type="button">Limpiar</button>
                                                                          </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                            <div class="span9">
                                        <div id="tabla"> </div>
                                   </div>
              </form>
 </div>
 

                                                                            
                                     
<script type="text/javascript">
function tabla()
{
     if($("#cbLineaProduccion :selected").val()!="" && $("#cbLineaProduccion :selected").val()!=null)
    {
         $('#tabla').html('<center id="tabla"><h3><img src="img/ajax-loader.gif" alt="" /> Espere un Momento ...</h3></center>');
        var id=$("#cbLineaProduccion :selected").val();
        $.ajax({
            url: 'operaciones/producto_terminado/list_tabla.jsp?id='+id,
            type: 'POST',
            success: function (data) {     
                     $('#tabla').html(data);
            },
            contentType: false,
            processData: false
        });      

    }
         
 };

var actulizar=false;   
var validGrabar=true; 
var validEnvase=false;
var validCategoria=false;
var validLote=false;
var validColor=false;
var validSeleccionador=false;
var validEmpaquetador=false;
$(document).ready(function() {    
    $("#btnGrabar").hide(); 
$('#cbLineaProduccion').on('change', function() {
    if(this.value!="")
    {
        $("#txtEnvase").select(); 
        tabla();
    }
});
$("#txtLote").keyup(function(){
        $(this).val($(this).val().trim());
    validLote=false;
    $("#idLote").val(''); 
    if(6>$(this).val().length)
   {
       $('#contadorLote').html('<label id="contadorLote" >Lote (6 digitos de <span class="label label-warning">'+$(this).val().length+'</span>)</label>');
       $('#validLote').html('<i id="validLote" class="splashy-pencil"/>');
   }
   if(6==$(this).val().length)
   {
       $('#contadorLote').html('<label id="contadorLote" >Lote (6 digitos de <span class="label label-success">'+$(this).val().length+'</span>)</label>');
        
        for (i = 0; i <lote.entidad.length; i++) { 
            if(lote.entidad[i].codigo_control.toUpperCase().trim()==$(this).val().toUpperCase())
            {
                $("#idLote").val(lote.entidad[i].id_lote); 
                validLote=true;
            }   
        }
        if(validLote)
        {
            $("#txtColor").focus(); 
            $('#validLote').html('<i id="validLote" class="splashy-thumb_up"/>');
        }
        else
        {
            $('#validLote').html('<i id="validLote" class="splashy-thumb_down"/>');
             $.sticky("<center><h1>Error de lectura de Lote</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
              
        }
   }
   else if(6<$(this).val().length)
   {
       $('#contadorLote').html('<label id="contadorLote" >Lote (6 digitos de <span class="label label-important">'+$(this).val().length+'</span>)</label>');
       $('#validCategoria').html('<i id="validCategoria" class="splashy-thumb_down"/>');
   }
     
});

$("#txtColor").keyup(function(){
    $(this).val($(this).val().trim());
   var colorEstado=false;
   var calibreEstado=false;
    validColor=false;
    $("#idCalibre").val(''); 
    $("#idColor").val(''); 
   if(9>$(this).val().length)
   {
       $('#contadorColor').html('<label id="contadorColor" >Calibre + Color (9 digitos de <span class="label label-warning">'+$(this).val().length+'</span>)</label>');
       $('#validColor').html('<i id="validColor" class="splashy-pencil"/>');
   }
   if(9==$(this).val().length)
   {
        $('#contadorColor').html('<label id="contadorColor" >Calibre + Color (9 digitos de <span class="label label-success">'+$(this).val().length+'</span>)</label>');
       
       $(this).val($(this).val().replace(/"/g, '-'));
       $(this).val($(this).val().replace(/'/g, '-'));

       if($(this).val().indexOf("-")!=-1)
       {
            var elem =$(this).val().split('-');

           for (i = 0; i <calibre.entidad.length; i++) { 
               if(calibre.entidad[i].codigo_control.toUpperCase().trim()==elem[0].toUpperCase())
               {
                   $("#idCalibre").val(calibre.entidad[i].id_calibre); 
                   calibreEstado=true;
               }
           }
           for (i = 0; i <color.entidad.length; i++) { 
               if(color.entidad[i].codigo_control.toUpperCase().trim()==elem[1].toUpperCase())
               {
                   $("#idColor").val(color.entidad[i].id_color);
                   colorEstado=true;
               }
           }
           if(calibreEstado && colorEstado)
           {
               validColor=true;
               $("#txtSeleccionador").focus();              
               $('#validColor').html('<i id="validColor" class="splashy-thumb_up"/>');
           }
           else
            {
                $.sticky("<center><h1>Error de lectura de Calibre + Color</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
                $('#validColor').html('<i id="validColor" class="splashy-thumb_down"/>');
            }
        }else
        {
                $.sticky("<center><h1>Error de lectura de Calibre + Color</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
               $('#validColor').html('<i id="validColor" class="splashy-thumb_down"/>');
        }
        
   }
   else if(9<$(this).val().length)
   {
       $('#contadorColor').html('<label id="contadorColor" >Calibre + Color (9 digitos de <span class="label label-important">'+$(this).val().length+'</span>)</label>');
       $('#validColor').html('<i id="validColor" class="splashy-thumb_down"/>');
   }
     
});

$("#txtSeleccionador").keyup(function(){
    $(this).val($(this).val().trim());
    validSeleccionador=false;
    $("#idSeleccionador").val(''); 
     if(8>$(this).val().length)
   {
       $('#contadorSeleccionador').html('<label id="contadorSeleccionador" >Seleccionador (8 digitos de <span class="label label-warning">'+$(this).val().length+'</span>)</label>');
       $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-pencil"/>');
   }
   if(8==$(this).val().length)
   {
        $('#contadorSeleccionador').html('<label id="contadorSeleccionador" >Seleccionador (8 digitos de <span class="label label-success">'+$(this).val().length+'</span>)</label>');
       
        for (i = 0; i <empleado.entidad.length; i++) { 
            if(empleado.entidad[i].codigo_control.toUpperCase().trim()==$(this).val().toUpperCase())
            {
                $("#idSeleccionador").val(empleado.entidad[i].codigo_control); 
                validSeleccionador=true;
            }   
        }
        if(validSeleccionador)
        {
            $("#txtEmpaquetador").focus();           
            $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-thumb_up"/>');
        }
        else
        {
            $.sticky("<center><h1>Error de lectura de Seleccionador</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
            $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-thumb_down"/>');
        }
   }
   else if(8<$(this).val().length)
   {
       $('#contadorSeleccionador').html('<label id="contadorSeleccionador" >Seleccionador (8 digitos de <span class="label label-important">'+$(this).val().length+'</span>)</label>');
       $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-thumb_down"/>');
   }
     
});

$("#txtEmpaquetador").keyup(function(){    
    $(this).val($(this).val().trim());
    validEmpaquetador=false;
    $("#idEmpaquetador").val(''); 
     if(8>$(this).val().length)
   {
       $('#contadorEmpaquetador').html('<label id="contadorEmpaquetador" >Empaquetador (8 digitos de <span class="label label-warning">'+$(this).val().length+'</span>)</label>');
       $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-pencil"/>');
   }
   if(8==$(this).val().length)
   {
       $('#contadorEmpaquetador').html('<label id="contadorEmpaquetador" >Empaquetador (8 digitos de <span class="label label-success">'+$(this).val().length+'</span>)</label>');
       
        for (i = 0; i <empleado.entidad.length; i++) { 
            if(empleado.entidad[i].codigo_control.toUpperCase().trim()==$(this).val().toUpperCase())
            {
                $("#idEmpaquetador").val(empleado.entidad[i].codigo_control); 
                validEmpaquetador=true;
            }   
        }
        if(validEmpaquetador)
        {
            $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-thumb_up"/>');
            comprobar();
        }
        else
        {
            $.sticky("<center><h1>Error de lectura de Empaquetador</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
            $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-thumb_down"/>');
        }
   }
   else if(8<$(this).val().length)
   {
       $('#contadorEmpaquetador').html('<label id="contadorEmpaquetador" >Empaquetador (8 digitos de <span class="label label-important">'+$(this).val().length+'</span>)</label>');
       $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-thumb_down"/>');
   }
     
});

$("#txtEnvase").keyup(function(){    
    $(this).val($(this).val().trim());
    validEnvase=false;
    $("#idEnvase").val(''); 
    if(6>$(this).val().length)
   {
       $('#contadorEnvase').html('<label id="contadorEnvase" >Envase (6 digitos de <span class="label label-warning">'+$(this).val().length+'</span>)</label>');
       $('#validEnvase').html('<i id="validEnvase" class="splashy-pencil"/>');
   }
   if(6==$(this).val().length)
   {
        $('#contadorEnvase').html('<label id="contadorEnvase" >Envase (6 digitos de <span class="label label-success">'+$(this).val().length+'</span>)</label>');
        for (i = 0; i <envase.entidad.length; i++) { 
            if(envase.entidad[i].codigo_control.toUpperCase().trim()==$(this).val().toUpperCase())
            {
                $("#idEnvase").val(envase.entidad[i].id_envase); 
                validEnvase=true;
            }   
        }
        if(validEnvase)
        {
            $("#txtCategoria").focus();   
            $('#validEnvase').html('<i id="validEnvase" class="splashy-thumb_up"/>');
        }
        else
        {
            $.sticky("<center><h1>Error de lectura del Envase</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
            $('#validEnvase').html('<i id="validEnvase" class="splashy-thumb_down"/>');
        }
   }
    else if(6<$(this).val().length)
   {
       $('#contadorEnvase').html('<label id="contadorEnvase" >Envase (6 digitos de <span class="label label-important">'+$(this).val().length+'</span>)</label>');
       $('#validEnvase').html('<i id="validEnvase" class="splashy-thumb_down"/>');
   }
     
});

$("#txtCategoria").keyup(function(){    
    $(this).val($(this).val().trim());
    validCategoria=false;
    $("#idCategoria").val(''); 
     if(6>$(this).val().length)
   {
       $('#contadorCategoria').html('<label id="contadorCategoria" >Categoria (6 digitos de <span class="label label-warning">'+$(this).val().length+'</span>)</label>');
       $('#validCategoria').html('<i id="validCategoria" class="splashy-pencil"/>');
   }
   if(6==$(this).val().length)
   {
       $('#contadorCategoria').html('<label id="contadorCategoria" >Categoria (6 digitos de <span class="label label-success">'+$(this).val().length+'</span>)</label>');
        for (i = 0; i <categoria.entidad.length; i++) { 
            if(categoria.entidad[i].codigo_control.toUpperCase().trim()==$(this).val().toUpperCase())
            {
                $("#idCategoria").val(categoria.entidad[i].id_categoria); 
                validCategoria=true;
            }   
        }
        if(validCategoria)
        {
            $('#validCategoria').html('<i id="validCategoria" class="splashy-thumb_up"/>');
            $("#txtLote").focus();   
        }
        else
        {
            $.sticky("<center><h1>Error de lectura de la Categoria</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
            $('#validCategoria').html('<i id="validCategoria" class="splashy-thumb_down"/>');
        }
   }
   else if(6<$(this).val().length)
   {
       $('#contadorCategoria').html('<label id="contadorCategoria" >Categoria (6 digitos de <span class="label label-important">'+$(this).val().length+'</span>)</label>');
       $('#validCategoria').html('<i id="validCategoria" class="splashy-thumb_down"/>');
   }
     
});

});

function comprobar()
{
  
         if($("#cbLineaProduccion :selected").val()=="")
        {
             $.sticky("Selecione una Linea de Porducción", {autoclose : 5000, position: "top-center", type: "st-error" });
        }
        else if(!validEnvase)
        {
            $("#txtEnvase").select(); 
             $.sticky("<center><h1>Error de lectura del Envase</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
             
        }
        else if(!validCategoria)
        {
            $("#txtCategoria").select(); 
             $.sticky("<center><h1>Error de lectura del Envase</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
             
        }
        else if(!validLote)
        {
            $("#txtLote").select(); 
             $.sticky("<center><h1>Error de lectura de Lote</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
             
        }
        else if(!validColor)
        {
            $("#txtColor").select(); 
            $.sticky("<center><h1>Error de lectura de Calibre + Color</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
             
        }
        else if(!validSeleccionador)
        {
            $("#txtSeleccionador").select(); 
            $.sticky("<center><h1>Error de lectura de Seleccionador</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
             
        }
        else if(!validEmpaquetador)
        {
            $("#txtEmpaquetador").select(); 
            $.sticky("<center><h1>Error de lectura de Empaquetador</h1></center>", {autoclose : 5000, position: "top-right", type: "st-error" });
             
        }
        else if(!actulizar)
        {            
            if(validGrabar)
            {
                grabar();
                validGrabar=false;
            }          
            
        }
};
function actulizar_data()
{
     if(validGrabar)
    {
        grabar();
        validGrabar=false;
    }     
}


function edit_form(id,idLinea,nLinea,idEnvase,nEnvase,idCategoria,nCategoria,idLote,nLote,idCalibre,idColor,nCalibreColor,seleccionador,empaquetador)
{
validLote=true;
validColor=true;
validSeleccionador=true;
validEmpaquetador=true;
validEnvase=true;
validCategoria=true;
     $("#btnGrabar").show(); 
    actulizar=true;
     $("#txtLote").val(nLote); 
    $("#idLote").val(idLote); 
    
    $("#txtColor").val(nCalibreColor); 
    $("#idColor").val(idColor); 
    $("#idCalibre").val(idCalibre); 
    
    $("#txtSeleccionador").val(seleccionador); 
    $("#idSeleccionador").val(seleccionador); 
    
    $("#txtEmpaquetador").val(empaquetador); 
    $("#idEmpaquetador").val(empaquetador); 
    
    $("#IdProductoTerminado").val(id);  
    
    $("select#cbLineaProduccion").val(idLinea); 
    
    $("#txtCategoria").val(nCategoria); 
    $("#idCategoria").val(idCategoria); 
    
    $("#txtEnvase").val(nEnvase); 
    $("#idEnvase").val(idEnvase); 
    
    
};
function grabar(){
    $("#myModal").modal('show'); 
  var url = "operaciones/producto_terminado/insert.jsp"; 
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
            clear_all();
             tabla();
           $.sticky("Se Actualizo Correctamente.", {autoclose : 5000, position: "top-center" });

       }
        else if(data>0)
        {
           clear_all();
            tabla();
           $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  

        }
         $('#myModal').modal('hide');
    }
    }); 
};

function clear_all()
{
validLote=false;
validColor=false;
validSeleccionador=false;
validEmpaquetador=false;
validCategoria=false;
validEnvase=false;
     $("#btnGrabar").hide(); 
    actulizar=false;
     validGrabar=true;
    $("#txtLote").val(""); 
    $("#idLote").val(""); 
    
    $("#txtColor").val(""); 
    $("#idColor").val(""); 
    $("#idCalibre").val(""); 
    
    $("#txtSeleccionador").val(""); 
    $("#idSeleccionador").val(""); 
    
    $("#txtEmpaquetador").val(""); 
    $("#idEmpaquetador").val(""); 
    
    $("#txtEnvase").val(""); 
    $("#idEnvase").val(""); 
    
    $("#txtCategoria").val(""); 
    $("#idCategoria").val(""); 
    
    $("#IdProductoTerminado").val("0");  
    
    $('#validLote').html('<i id="validLote" class="splashy-pencil"/>');
    $('#validColor').html('<i id="validColor" class="splashy-pencil"/>');
    $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-pencil"/>');
    $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-pencil"/>');
    $('#validEnvase').html('<i id="validEnvase" class="splashy-pencil"/>');
    $('#validCategoria').html('<i id="validCategoria" class="splashy-pencil"/>');
    $("#txtEnvase").select();     
    $('#contadorEnvase').html('<label id="contadorEnvase" >Envase (6 digitos de <span class="label label-warning">0</span>)</label>');
    $('#contadorCategoria').html('<label id="contadorCategoria" >Categoria (6 digitos de <span class="label label-warning">0</span>)</label>');
    $('#contadorLote').html('<label id="contadorLote" >Lote (6 digitos de <span class="label label-warning">0</span>)</label>');
    $('#contadorColor').html('<label id="contadorColor" >Calibre + Color (9 digitos de <span class="label label-warning">0</span>)</label>');
    $('#contadorSeleccionador').html('<label id="contadorSeleccionador" >Seleccionador (8 digitos de <span class="label label-warning">0</span>)</label>');
    $('#contadorEmpaquetador').html('<label id="contadorEmpaquetador" >Empaquetador (8 digitos de <span class="label label-warning">0</span>)</label>');
       
};
var calibre = {
     'entidad': [ 
    <%
    List<entCalibre> listCalibre = clsGestor.ListarCalibre(true);
    if(listCalibre!=null)
    {
      size=listCalibre.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_calibre': "+listCalibre.get(i).getId_calibre()+",'nombre': '"+listCalibre.get(i).getNombre()+"','codigo_control': '"+listCalibre.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_calibre': "+listCalibre.get(i).getId_calibre()+",'nombre': '"+listCalibre.get(i).getNombre()+"','codigo_control': '"+listCalibre.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};

var color= {
     'entidad': [ 
    <%
    List<entColor> listColor = clsGestor.ListarColor(true);
    if(listColor!=null)
    {
      size=listColor.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_color': "+listColor.get(i).getId_color()+",'nombre': '"+listColor.get(i).getNombre()+"','codigo_control': '"+listColor.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_color': "+listColor.get(i).getId_color()+",'nombre': '"+listColor.get(i).getNombre()+"','codigo_control': '"+listColor.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};

var lote= {
     'entidad': [ 
    <%
    List<entLote> listLote = clsGestor.ListarLote(true);
    if(listLote!=null)
    {
      size=listLote.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_lote': "+listLote.get(i).getId_lote()+",'nombre': '"+listLote.get(i).getNombre()+"','codigo_control': '"+listLote.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_lote': "+listLote.get(i).getId_lote()+",'nombre': '"+listLote.get(i).getNombre()+"','codigo_control': '"+listLote.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};
var empleado= {
     'entidad': [ 
    <%
    List<entEmpleado> listEmpleado = clsGestor.ListarEmpleado(true);
    if(listEmpleado!=null)
    {
      size=listEmpleado.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_empleado': "+listEmpleado.get(i).getId_empleado()+",'nombre': '"+listEmpleado.get(i).getNombre()+" "+listEmpleado.get(i).getApellido()+"','codigo_control': '"+listEmpleado.get(i).getDni()+"'}");
        }else
        {
             out.print("{'id_empleado': "+listEmpleado.get(i).getId_empleado()+",'nombre': '"+listEmpleado.get(i).getNombre()+" "+listEmpleado.get(i).getApellido()+"','codigo_control': '"+listEmpleado.get(i).getDni()+"'},");
        }
    }%>
     ]
};

var envase= {
     'entidad': [ 
    <%
    List<entEnvase> listEnvase = clsGestor.ListarEnvase(true);
    if(listEnvase!=null)
    {
      size=listEnvase.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_envase': "+listEnvase.get(i).getId_envase()+",'nombre': '"+listEnvase.get(i).getNombre()+"','codigo_control': '"+listEnvase.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_envase': "+listEnvase.get(i).getId_envase()+",'nombre': '"+listEnvase.get(i).getNombre()+"','codigo_control': '"+listEnvase.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};

var categoria= {
     'entidad': [ 
    <%
    List<entCategoria> listCategoria = clsGestor.ListarCategoria(true);
    if(listCategoria!=null)
    {
      size=listCategoria.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_categoria': "+listCategoria.get(i).getId_categoria()+",'nombre': '"+listCategoria.get(i).getNombre()+"','codigo_control': '"+listCategoria.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_categoria': "+listCategoria.get(i).getId_categoria()+",'nombre': '"+listCategoria.get(i).getNombre()+"','codigo_control': '"+listCategoria.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};
$("#reg_form").submit(function(){
  return false;
});
</script>
  </div>
<%
}}%>  
                                                                        
                                                                       
                                                                            