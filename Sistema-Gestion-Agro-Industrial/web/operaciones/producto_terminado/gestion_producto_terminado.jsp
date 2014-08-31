
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

%>
<div id="frame">
 <div class="row-fluid">
      <form  method="get" id="reg_form">
                            <div class="span12">
                                    <div class="row-fluid">         
                                              <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                            <div class="formSep">
                                                                                    <div class="input-prepend">
                                                                                    <label>Linea Producción</label>
                                                                                    <select id="cbLineaProduccion" name="cbLineaProduccion" title="Por favor selecione una Linea Producción!" required>
                                                                                        <option value="0">Selecione una Opción</option>
                                                                                        <%List<entLineaProduccion> listLineaProduccion=clsGestor.ListarLineaProduccion(true);
                                                                                            if(listLineaProduccion!=null)
                                                                                                for(entLineaProduccion entidad : listLineaProduccion)
                                                                                                    out.print("<option value='"+entidad.getId_linea_produccion()+"'>"+entidad.getNombre()+"</option>");                                         
                                                                                         %>
                                                                                        </select>
                                                                                    </div>
                                                                                    <div class="input-prepend">
                                                                                        <label>Envase</label>
                                                                                        <select id="cbEnvase" name="cbEnvase" title="Por favor selecione un Envase!" required>
                                                                                        <option value="0">Selecione una Opción</option>
                                                                                        <%List<entEnvase> listEnvase=clsGestor.ListarEnvase(true);
                                                                                            if(listEnvase!=null)
                                                                                                for(entEnvase entidad : listEnvase)
                                                                                                    out.print("<option value='"+entidad.getId_envase()+"'>"+entidad.getNombre()+"</option>");                                         
                                                                                         %>
                                                                                        </select>
                                                                                    </div>
                                                                                      <div class="input-prepend">
                                                                                        <label>Categoria</label>
                                                                                        <select id="cbCategoria" name="cbCategoria" title="Por favor selecione una Categoria!" required>
                                                                                        <option value="">Selecione una Opción</option>
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
                                                                            <button class="btn btn-invert" type="submit">Grabar</button>
                                                                            <input type="hidden" id="IdProductoTerminado"  name="IdProductoTerminado"  value="0"/>
                                                                            <button class="btn btn-invert" onclick="clear_form()" type="button">Limpiar</button>
                                                                          </div>


                                                                
                                                            </div>
                                                    </div>
                                            </div>
                                    </div>
                        </div>
              </form>
 </div>
 

<div class="row-fluid">
    <div class="span12">
         <div id="tabla"> </div>
    </div>
</div>
                                                                                    
                                     
<script type="text/javascript">
var actulizar=false;   
var validLote=false;
var validColor=false;
var validSeleccionador=false;
var validEmpaquetador=false;

$("#txtLote").keyup(function(){
    validLote=false;
    $("#idLote").val(''); 
   if(2<$(this).val().length && 11>$(this).val().length)
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
            $("#txtColor").select(); 
            $('#validLote').html('<i id="validLote" class="splashy-thumb_up"/>');
        }
        else
            $('#validLote').html('<i id="validLote" class="splashy-thumb_down"/>');
   }
     
});

$("#txtColor").keyup(function(){
   var colorEstado=false;
   var calibreEstado=false;
    validColor=false;
    $("#idCalibre").val(''); 
    $("#idColor").val(''); 
   if(5<$(this).val().length && 21>$(this).val().length)
   {
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
               $("#txtSeleccionador").select(); 
               $('#validColor').html('<i id="validColor" class="splashy-thumb_up"/>');
           }
           else
               $('#validColor').html('<i id="validColor" class="splashy-thumb_down"/>');
        }else
               $('#validColor').html('<i id="validColor" class="splashy-thumb_down"/>');
        
   }
     
});

$("#txtSeleccionador").keyup(function(){
    validSeleccionador=false;
    $("#idSeleccionador").val(''); 
   if(8==$(this).val().length)
   {
        for (i = 0; i <empleado.entidad.length; i++) { 
            if(empleado.entidad[i].codigo_control.toUpperCase()==$(this).val().toUpperCase())
            {
                $("#idSeleccionador").val(empleado.entidad[i].id_empleado); 
                validSeleccionador=true;
            }   
        }
        if(validSeleccionador)
        {
            $("#txtEmpaquetador").select(); 
            $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-thumb_up"/>');
        }
        else
            $('#validSeleccionador').html('<i id="validSeleccionador" class="splashy-thumb_down"/>');
   }
     
});

$("#txtEmpaquetador").keyup(function(){
    validEmpaquetador=false;
    $("#idEmpaquetador").val(''); 
   if(8==$(this).val().length)
   {
        for (i = 0; i <empleado.entidad.length; i++) { 
            if(empleado.entidad[i].codigo_control.toUpperCase()==$(this).val().toUpperCase())
            {
                $("#idEmpaquetador").val(empleado.entidad[i].id_empleado); 
                validEmpaquetador=true;
            }   
        }
        if(validEmpaquetador)
        {
            $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-thumb_up"/>');
            grabar();
        }
        else
            $('#validEmpaquetador').html('<i id="validEmpaquetador" class="splashy-thumb_down"/>');
   }
     
});
function grabar()
{
    if(!actulizar)
    {
        if(!validLote)
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
        else
        {
            alert($("#idLote").val());
            clear_all();
        }
        
    }
    

};
function clear_all()
{
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
  alert("XD");
  return false;
});
</script>
  </div>
<%
}}%>  
                                                                        
                                                                       
                                                                            