 <%@page import="Com.clsGestor"%>
<%@page import="Entidades.entLote"%>
<%@page import="java.util.List"%>

                            <tbody id='tbody' style="width:1000px;">    
                            <%
                            List<entLote> list=clsGestor.ListarLote(false);
                            if(list!=null)
                            for(entLote entidad : list)
                            {
                            %>
                                                                                                        
                            <tr>
                                <td style="width:50px;"><%=entidad.getNombre()%></td>
                                <td style="width:50px;"><%=entidad.getHectareas()%></td>
                                <td style="width:50px;"><%=entidad.getCentro_costo()%></td>
                                <td style="width:50px;"><%=entidad.getAnio_siembra()%></td>
                                <td style="width:50px;"><%=entidad.getObjProductor().getNombre()%></td>
                                <td style="width:50px;"><%=entidad.getObjPatron().getNombre()%></td>
                                <td style="width:50px;"><%=entidad.getObjVivero().getNombre()%></td>
                                <td style="width:50px;"><%=entidad.getObjTipoCultivo().getNombre()%></td>
                                <td style="width:50px;"><%=entidad.getObjEdadCultivo().getNombre()%></td>
                                <td style="width:50px;"><%=entidad.getObjVariedad().getNombre()%></td>
                                <td style="width:50px;">
                                    <a href="javascript:void(0)" data-dismiss="modal" onclick="selectLote(<%=entidad.getId_lote()%>,'<%=entidad.getNombre()%>')" class="comp_edit btn btn-success btn-mini">Selecionar</a>

                                </td>
                            </tr>                                                       
                            <%
                            }
                            %>
                            </tbody>
                                   