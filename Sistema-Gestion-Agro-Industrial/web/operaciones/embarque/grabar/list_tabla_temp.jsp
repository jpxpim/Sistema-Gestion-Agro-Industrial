 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entTunel"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null && objSession.getObjEmbarque()!=null) 
{
     SimpleDateFormat fecha=new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat hora=new SimpleDateFormat("HH:mm a"); 
    int contador=0;
int ids=0;
%>
<div id="listContenedor">
    
  <table id="lista" class="table table-bordered table-striped table_vam">
      <thead>
      <th colspan="<%=objSession.getObjEmbarque().getObjContenedor().getPos_y()%>">
         Contenedor: <%=objSession.getObjEmbarque().getObjContenedor().getNombre()%> - Total X:<%=objSession.getObjEmbarque().getObjContenedor().getPos_x()%>  - Total Y:<%=objSession.getObjEmbarque().getObjContenedor().getPos_y()%> 
      </th>
      </thead>
      <tbody>   
        <%for(int i=0;i<objSession.getObjEmbarque().getObjContenedor().getPos_x();i++){%>
            <tr>
                <%for(int y=0;y<objSession.getObjEmbarque().getObjContenedor().getPos_y();y++)
                {
                if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta()==null){%>
                    <td>
                        <center>
                            <a data-toggle='modal' data-backdrop='static' href='#ModalDetalle' onclick="selectPosicion(<%=ids%>)" class="comp_edit btn btn-primary">Agregar <% if((ids+1)<10) out.print("0"+(ids+1));else  out.print((ids+1));%></a>
                        </center>   
                    </td>
                   <%contador++;
                    }else{%> 
                    <td>
                      <center>
                        
                       <table class="table table-bordered table-striped table_vam">
                            <tbody>
                                <tr>
                                    <th>
                                        Codigo
                                    </th>
                                    <td>
                                        <%=objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getCodigo_control()%>
                                    </td>
                                </tr>
                                 <tr>
                                    <th>
                                        Estado
                                    </th>
                                    <td>
                                        <%  if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getEstado_paleta()==1)
                                                out.print("Completo");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getEstado_paleta()==2)
                                                out.print("Incompleto");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getEstado_paleta()==3)
                                                out.print("Baja de Frio");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getEstado_paleta()==4)
                                                out.print("Cortesia");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getEstado_paleta()==5)
                                                out.print("Repaletizado");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getEstado_paleta()==6)
                                                out.print("Reempacado");
                                           %>
                                    </td>
                                </tr>
                                 <tr>
                                    <th>
                                        Posiscion
                                    </th>
                                    <td>
                                         <%  if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getPosicion_paleta()==1)
                                                out.print("<span class='label label-success'>Paleteizado</span>");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getPosicion_paleta()==2)
                                                out.print("<span class='label label-success'>Tunel</span>");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getPosicion_paleta()==3)
                                                out.print("<span class='label label-warning'>Camara</span>");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getPosicion_paleta()==4)
                                                out.print("<span class='label label-success'>Exportada</span>");
                                           else if(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getPosicion_paleta()==5)
                                                out.print("<span class='label label-important'>Retornada</span>");
                                %>
                                    </td>
                                </tr>
                                 <tr>
                                    <th>
                                        Hora
                                    </th>
                                    <td>
                                         <%=hora.format(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getFecha_produccion())%>
                                    </td>
                                </tr>
                                 <tr>
                                    <th>
                                        Fecha
                                    </th>
                                    <td>
                                        <%=fecha.format(objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getFecha_produccion())%>
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                                    <a href='#' onclick="quitarPosicion(<%=ids%>,'<%=objSession.getObjEmbarque().getList().get(ids).getObjPaleta().getCodigo_control()%>')" class="comp_edit btn btn-danger">Quitar <% if((ids+1)<10) out.print("0"+(ids+1));else  out.print((ids+1));%></a>
                      </center>
                    </td>
                <%}
                ids++;
                }%>
            </tr>
        <%}%>
        </tbody>   
    </table>
        
<script type="text/javascript">
     $('#totalPalet').val('<%=contador%>');     
</script>       
        
</div>

<%} %>  
                                                                        
                                                                       
                