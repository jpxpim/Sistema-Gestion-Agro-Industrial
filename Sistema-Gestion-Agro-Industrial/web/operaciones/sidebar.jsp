<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entModulo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entSesion"%>
<%
    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{     
%>
<div class="sidebar">
    <div class="antiScroll">
            <div class="antiscroll-inner">
                    <div class="antiscroll-content">
                            <div class="sidebar_inner">								
                                    <div id="side_accordion" class="accordion">

                                            <div class="accordion-group">
                                                    <div class="accordion-heading">
                                                            <a href="#collapseFour" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                                                    <i class="icon-folder-close"></i> Modulos
                                                            </a>
                                                    </div>
                                                    <div class="accordion-body collapse in" id="collapseFour">
                                                            <div class="accordion-inner">
                                                                    <ul class="nav nav-list">
                                                                        <%
                                                                            List<entModulo> list=objSession.getListModulos();
                                                                            if(list!=null)
                                                                            for(int i=0;i<list.size();i++)
                                                                            {
                                                                                if(i>0)
                                                                                out.print("<li class='divider'></li>");
                                                                                if(i==objSession.getPosicion())
                                                                                {
                                                                                 out.print("<li class='active'><a onclick='getMododulos("+i+")'>"+list.get(i).getEtiqueta()+"</a></li>");
                                                                                }
                                                                                else
                                                                                    out.print("<li><a onclick='getMododulos("+i+")'>"+list.get(i).getEtiqueta()+"</a></li>");
                                                                            }%> 
                                                                    </ul>
                                                            </div>
                                                    </div>


                                            <div class="accordion-group">
                                                    <div class="accordion-heading">
                                                            <a href="#collapseHerramientas" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                                               <i class="icon-cog"></i> Herramientas
                                                            </a>
                                                    </div>
                                                    <div class="accordion-body collapse" id="collapseHerramientas">
                                                            <div class="accordion-inner">
                                                                  <ul class="nav nav-list">
                                                                       <%if(objSession.getObjDiaRecepcion()!=null)
                                                                            if(objSession.getObjUsuario().isEs_administrador()||
                                                                             objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_1() ||
                                                                             objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_2() ||
                                                                             objSession.getObjUsuario().getId_usuario()==objSession.getObjConfiguracion().getUsuario_cierre_recepcion_3())
                                                                             {%>
                                                                                <li><a onclick="cerrarRecepccion()" href="javascript:void(0)">Cerrar Día de Producción</a></li>
                                                                             <%}%>
                                                                      <li><a onclick="getReporte()" href="javascript:void(0)">Generar Excel</a></li>
                                                                     
                                                                </ul> 
                                                            </div>
                                                     </div>
                                            </div>
                                            
                                             <div class="accordion-group">
                                                    <div class="accordion-heading">
                                                            <a href="#collapseCalculador" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                                               <i class="icon-th"></i> Calculadora
                                                            </a>
                                                    </div>
                                                    <div class="accordion-body collapse" id="collapseCalculador">
                                                            <div class="accordion-inner">
                                                                    <form name="Calc" id="calc">
                                                                            <div class="formSep control-group input-append">
                                                                                    <input type="text" style="width:142px" name="Input" /><button type="button" class="btn" name="clear" value="c" onclick="Calc.Input.value = ''"><i class="icon-remove"></i></button>
                                                                            </div>
                                                                            <div class="control-group">
                                                                                    <input type="button" class="btn btn-large" name="seven" value="7" onclick="Calc.Input.value += '7'" />
                                                                                    <input type="button" class="btn btn-large" name="eight" value="8" onclick="Calc.Input.value += '8'" />
                                                                                    <input type="button" class="btn btn-large" name="nine" value="9" onclick="Calc.Input.value += '9'" />
                                                                                    <input type="button" class="btn btn-large" name="div" value="/" onclick="Calc.Input.value += ' / '">
                                                                            </div>
                                                                            <div class="control-group">
                                                                                    <input type="button" class="btn btn-large" name="four" value="4" onclick="Calc.Input.value += '4'" />
                                                                                    <input type="button" class="btn btn-large" name="five" value="5" onclick="Calc.Input.value += '5'" />
                                                                                    <input type="button" class="btn btn-large" name="six" value="6" onclick="Calc.Input.value += '6'" />
                                                                                    <input type="button" class="btn btn-large" name="times" value="x" onclick="Calc.Input.value += ' * '" />
                                                                            </div>
                                                                            <div class="control-group">
                                                                                    <input type="button" class="btn btn-large" name="one" value="1" onclick="Calc.Input.value += '1'" />
                                                                                    <input type="button" class="btn btn-large" name="two" value="2" onclick="Calc.Input.value += '2'" />
                                                                                    <input type="button" class="btn btn-large" name="three" value="3" onclick="Calc.Input.value += '3'" />
                                                                                    <input type="button" class="btn btn-large" name="minus" value="-" onclick="Calc.Input.value += ' - '" />
                                                                            </div>
                                                                            <div class="formSep control-group">
                                                                                    <input type="button" class="btn btn-large" name="dot" value="." onclick="Calc.Input.value += '.'" />
                                                                                    <input type="button" class="btn btn-large" name="zero" value="0" onclick="Calc.Input.value += '0'" />
                                                                                    <input type="button" class="btn btn-large" name="DoIt" value="=" onclick="Calc.Input.value = Math.round( eval(Calc.Input.value) * 1000)/1000" />
                                                                                    <input type="button" class="btn btn-large" name="plus" value="+" onclick="Calc.Input.value += ' + '" />
                                                                            </div>													
                                                                    </form>
                                                            </div>
                                                     </div>
                                            </div>
                                    </div>

                                    <div class="push"></div>
                            </div>

                    </div>
            </div>
    </div>
</div>   
 <%if(objSession.getObjDiaRecepcion()!=null){
 SimpleDateFormat e=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");
 %>                                                                      
<script>
function cerrarRecepccion()
{
    var texto="Desea cerrar el día de Producción\nInicado <%=e.format(objSession.getObjDiaRecepcion().getHora_inicio())%>";
    smoke.confirm(texto,function(e){
                if (e){
                       $.ajax({
                        url: 'operaciones/dia_recepcion/gestionar.jsp?parametro=1',
                        type: 'POST',
                        success: function (data) { 
                                if(data==1)
                                window.location.reload();
                        },
                        contentType: false,
                        processData: false
                        });
                }
        },{cancel:"No",ok:"Si"});
    
    
  
};
</script>  
<%}}%>           