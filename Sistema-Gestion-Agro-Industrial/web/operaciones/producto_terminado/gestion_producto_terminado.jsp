
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
            <h3 class="heading">Iniciar Nuevo d�a de Producci�n</h3>  
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
            <h3 class="heading">Espere que el ecargado inicie un nuevo d�a de Producci�n</h3> 
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
            <h3 class="heading">D�a de Producci�n Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
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
            <h3 class="heading">D�a de Producci�n Inicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%></h3>  
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
             <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                            <div class="formSep">
                                                                                    <div class="input-prepend">
                                                                                    <label>Linea Producci�n</label>
                                                                                    <select id="cbLineaProduccion" name="cbLineaProduccion" >
                                                                                        <option value="">Selecione una Opci�n</option>
                                                                                        <%List<entLineaProduccion> listLineaProduccion=clsGestor.ListarLineaProduccion(true);
                                                                                            if(listLineaProduccion!=null)
                                                                                                for(entLineaProduccion entidad : listLineaProduccion)
                                                                                                    out.print("<option value='"+entidad.getId_linea_produccion()+"'>"+entidad.getNombre()+"</option>");                                         
                                                                                         %>
                                                                                        </select>
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                        <label>Envase</label>
                                                                                        <select id="cbEnvase" name="cbEnvase" >
                                                                                        <option value="">Selecione una Opci�n</option>
                                                                                        <%List<entEnvase> listEnvase=clsGestor.ListarEnvase(true);
                                                                                            if(listEnvase!=null)
                                                                                                for(entEnvase entidad : listEnvase)
                                                                                                    out.print("<option value='"+entidad.getId_envase()+"'>"+entidad.getNombre()+"</option>");                                         
                                                                                         %>
                                                                                        </select>
                                                                                    </div>
                                                                                      <div class="input-prepend">
                                                                                        <label>Categoria</label>
                                                                                        <select id="cbCategoria" name="cbCategoria">
                                                                                        <option value="">Selecione una Opci�n</option>
                                                                                        <%List<entCategoria> listCategoria=clsGestor.ListarCategoria(true);
                                                                                            if(listCategoria!=null)
                                                                                                for(entCategoria entidad : listCategoria)
                                                                                                    out.print("<option value='"+entidad.getId_categoria()+"'>"+entidad.getNombre()+"</option>");                                         
                                                                                         %>
                                                                                        </select>
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Lote</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtLote" name="txtLote" /><span id="validLote" class="add-on"><i class="splashy-pencil"/></span>
                                                                                        </div>         
                                                                                    <input type="hidden" id="idLote"  name="idLote" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Calibre + Color</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtColor" name="txtColor" /><span id="validColor" class="add-on"><i class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idCalibre"  name="idCalibre" />
                                                                                    <input type="hidden" id="idColor"  name="idColor" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Seleccionador</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtSeleccionador" name="txtSeleccionador" /><span id="validSeleccionador" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idSeleccionador"  name="idSeleccionador" />
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                    <label>Empaquetador</label>
                                                                                        <div class="input-prepend">
                                                                                            <input type="text" id="txtEmpaquetador" name="txtEmpaquetador" /><span id="validEmpaquetador" class="add-on"><i  class="splashy-pencil"/></span>
                                                                                        </div>
                                                                                    <input type="hidden" id="idEmpaquetador"  name="idEmpaquetador" />
                                                                                    </div>                                                                                   

                                                                            </div>
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="comprobar()" type="button">Grabar</button>
                                                                            <input type="hidden" id="IdProductoTerminado"  name="IdProductoTerminado"  value="0"/>
                                                                            <button class="btn btn-invert" onclick="clear_all()" type="button">Limpiar</button>
                                                                          </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                            <div class="span8">
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
var validLote=false;
var validColor=false;
var validSeleccionador=false;
var validEmpaquetador=false;
$(document).ready(function() {    
    $("#btnGrabar").hide(); 
$('#cbLineaProduccion').on('change', function() {
    if(this.value!="" && this.value!=null)
    {
        $("#txtLote").select(); 
        tabla();
    }
});
$('#cbCategoria').on('change', function() {
    if(this.value!="" && this.value!=null)
    {
        $("#txtLote").select(); 
    }
});
$('#cbEnvase').on('change', function() {
    if(this.value!="" && this.value!=null)
    {
        $("#txtLote").select(); 
    }
});
$("#txtLote").keyup(function(){
        $(this).val($(this).val().trim());
    validLote=false;
    $("#idLote").val(''); 
   if(6==$(this).val().length)
   {
        for (i = 0; i <lote.entidad.length; i++) { 
            if(lote.entidad[i].codigo_control.toUpperCase()==$(this).val().toUpperCase())
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
            $('#validLote').html('<i id="validLote" class="splashy-thumb_down"/>');
   }
     
});

$("#txtColor").keyup(function(){
    $(this).val($(this).val().trim());
   var colorEstado=false;
   var calibreEstado=false;
    validColor=false;
    $("#idCalibre").val(''); 
    $("#idColor").val(''); 
   if(9==$(this).val().length)
   {
       $(this).val($(this).val().replace(/"/g, '-'));
       $(this).val($(this).val().replace(/'/g, '-'));

       if($(this).val().indexOf("-")!=-1)
       {
            var elem =$(this).val().split('-');

           for (i = 0; i <calibre.entidad.length; i++) { 
               if(calibre.entidad[i].codigo_control.toUpperCase()==elem[0].toUpperCase())
               {
                   $("#idCalibre").val(calibre.entidad[i].id_calibre); 
                   calibreEstado=true;
               }
           }
           for (i = 0; i <color.entidad.length; i++) { 
               if(color.entidad[i].codigo_control.toUpperCase()==elem[1].toUpperCase())
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
               $('#validColor').html('<i id="validColor" class="splashy-thumb_down"/>');
        }else
               $('#validColor').html('<i id="validColor" class="splashy-thumb_down"/>');
        
   }
     
});

$("#txtSeleccionador").keyup(function(){
    $(this).val($(this).val().trim());
    validSeleccionador=false;
    $("#idSeleccionador").val(''); 
   if(8==$(this).val().length)
   {
        for (i = 0; i <empleado.entidad.length; i++) { 
            if(empleado.entidad[i].codigo_control.toUpperCase()==$(this).val().toUpperCase())
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
            $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-thumb_down"/>');
   }
     
});

$("#txtEmpaquetador").keyup(function(){    
    $(this).val($(this).val().trim());
    validEmpaquetador=false;
    $("#idEmpaquetador").val(''); 
   if(8==$(this).val().length)
   {
        for (i = 0; i <empleado.entidad.length; i++) { 
            if(empleado.entidad[i].codigo_control.toUpperCase()==$(this).val().toUpperCase())
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
            $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-thumb_down"/>');
   }
     
});
});

function comprobar()
{
   
         if($("#cbLineaProduccion :selected").val()=="" && $("#cbLineaProduccion :selected").val()==null)
        {
             $.sticky("Selecione una Linea de Porducci�n", {autoclose : 5000, position: "top-center", type: "st-error" });
        }
        else if($("#cbCategoria :selected").val()=="" && $("#cbCategoria :selected").val()==null)
        {
             $.sticky("Selecione una Categoria", {autoclose : 5000, position: "top-center", type: "st-error" });
        }
         else if($("#cbEnvase :selected").val()=="" && $("#cbEnvase :selected").val()==null)
        {
             $.sticky("Selecione un Envase", {autoclose : 5000, position: "top-center", type: "st-error" });
        }
        else if(!validLote)
        {
            $("#txtLote").select(); 
        }
        else if(!validColor)
        {
            $("#txtColor").select(); 
        }
        else if(!validSeleccionador)
        {
            $("#txtSeleccionador").select(); 
        }
        else if(!validEmpaquetador)
        {
            $("#txtEmpaquetador").select(); 
        }
        else if(!actulizar)
        {            
            if(validGrabar)
            {
                grabar();
                validGrabar=false;
            }          
            
        }else if(actulizar)
        {            
            if(validGrabar)
            {
                grabar();
                validGrabar=false;
            }          
            
        }
        
   
};


function edit_form(id,idLinea,nLinea,idEnvase,nEnvase,idCategoria,nCategoria,idLote,nLote,idCalibre,idColor,nCalibreColor,seleccionador,empaquetador)
{
validLote=true;
validColor=true;
validSeleccionador=true;
validEmpaquetador=true;
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
    $("select#cbCategoria").val(idCategoria); 
    $("select#cbEnvase").val(idEnvase); 
    
};
function grabar(){
    $("#abrirCarga").click();
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
         $("#cerrarCarga").trigger("click");
    }
    }); 
};

function clear_all()
{
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
    
    $("#IdProductoTerminado").val("0");  
    
    $('#validLote').html('<i id="validLote" class="splashy-pencil"/>');
    $('#validColor').html('<i id="validColor" class="splashy-pencil"/>');
    $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-pencil"/>');
    $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-pencil"/>');
    $("#txtLote").select(); 
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
$("#reg_form").submit(function(){
  return false;
});
</script>
  </div>
<%
}}%>  
                                                                        
                                                                       
                                                                            