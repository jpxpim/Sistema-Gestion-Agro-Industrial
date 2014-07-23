 <%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCultivo"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
                                                                    SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
                                                                    SimpleDateFormat hora=new SimpleDateFormat("h:mm a");
                                                                    List<entCultivo> list=clsGestor.ListarCultivo(false);
                                                                    if(list!=null)
                                                                    {%>
                                                                     <table id="tabla" class="table table-striped location_table">
                                                                            <thead>
                                                                                    <tr>
                                                                                            <th>Id</th>
                                                                                            <th>Nombre</th>
                                                                                            <th>Descripcion</th>
                                                                                            <th>Responsable</th>
                                                                                            <th>Fecha</th>
                                                                                            <th>Hora</th>
                                                                                            <th>Estado</th>
                                                                                            <th>Acciones</th>
                                                                                    </tr>
                                                                            </thead>   
                                                                            <%
                                                                            for(entCultivo objCultivo : list)
                                                                            {
                                                                            %>
									
                                                                            <tbody>                                                                                
                                                                                <tr>
                                                                                    <td><%=objCultivo.getId_cultivo()%></td>
                                                                                    <td><%=objCultivo.getNombre()%></td>
                                                                                    <td><%=objCultivo.getDescripcion()%></td>
                                                                                    <td><%=objCultivo.getUsuario_responsable()%></td>
                                                                                    <td><%=fecha.format(objCultivo.getFecha_modificacion())%></td>
                                                                                    <td><%=hora.format(objCultivo.getFecha_modificacion())%></td>
                                                                                    <td>
                                                                                         <%
                                                                                           if(objCultivo.getEstado())
                                                                                           out.print(" <span class='label label-success'>Activado</span>");
                                                                                           else
                                                                                               out.print(" <span class='label label-important'>Desactivado</span>");
                                                                                        %>
                                                                                       

                                                                                    </td>
                                                                                    <td>
                                                                                        <a href="javascript:void(0)" onclick="edit_form(<%=objCultivo.getId_cultivo()%>,'<%=objCultivo.getNombre()%>','<%=objCultivo.getDescripcion()%>','<%=objCultivo.getUsuario_responsable()%>','<%=objCultivo.getEstado()%>')" class="comp_edit btn btn-primary btn-mini">Editar</a>
                                                                                       
                                                                                    </td>
                                                                                </tr>
                                                                                      
                                                                            </tbody>
                                                               
                                                                       
                                                                            <%
                                                                            }
                                                                            %>
                                                                            </table>
                                                                          
                                                                        <%} %>  
                                                                        
                                                                       
                                                                            