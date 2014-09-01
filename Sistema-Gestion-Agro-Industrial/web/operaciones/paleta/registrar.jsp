
<%@page import="Entidades.entProductoTerminado"%>
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
             <div class="span4">
                                                    <div class="row-fluid" id="g-map-top">
                                                            <div class="span12">
                                                                     
                                                                          <div class="location_add_form well">
                                                                            <div class="formSep">
                                                                                    <div class="input-prepend">
                                                                                    <label>Linea Producción</label>
                                                                                    <select id="cbLineaProduccion" name="cbLineaProduccion" >
                                                                                        <option value="">Selecione una Opción</option>
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
                                                                                        <option value="">Selecione una Opción</option>
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
                                                                             <button id="btnGrabar" class="btn btn-invert" onclick="actulizar_data()" type="button">Grabar</button>
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
            out.print("{'id_lote': "+listLote.get(i).getId_lote()+",'variedad': '"+listLote.get(i).getObjVariedad().getNombre()+"','codigo_control': '"+listLote.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_lote': "+listLote.get(i).getId_lote()+",'variedad': '"+listLote.get(i).getObjVariedad().getNombre()+"','codigo_control': '"+listLote.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};

var producto= {
     'entidad': [ 
    <%
    List<entProductoTerminado> listProductoTerminado = clsGestor.ListarPorDiaRecepccionProductoTerminado(objSession.getObjDiaRecepcion().getId_dia_recepcion());
    if(listProductoTerminado!=null)
    {
      size=listProductoTerminado.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjLote().getId_lote()+",'codigo_control': '"+listProductoTerminado.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjLote().getId_lote()+",'codigo_control': '"+listProductoTerminado.get(i).getCodigo_control()+"'},");
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
                                                                        
                                                                       
                                                                            