<%@page import="Entidades.entFormulario"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entModulo"%>
<%@page import="Entidades.entSesion"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{%>
<div id="tabla">
<div id="accordion0" class="accordion">
<%
List<entModulo> listModulos=objSession.getListModulos();
if(listModulos!=null)
for(int contModulos=0;contModulos<listModulos.size();contModulos++)
if(listModulos.get(contModulos).isSelecion())
{
%>    
    <div class="accordion-group">
            <div class="accordion-heading">
                <a href="#collapse<%=listModulos.get(contModulos).getId_modulo()%>" data-parent="#accordion0" data-toggle="collapse" class="accordion-toggle">
                            <%=listModulos.get(contModulos).getEtiqueta()%>
                    </a>
            </div>
            <div class="accordion-body collapse" id="collapse<%=listModulos.get(contModulos).getId_modulo()%>">
                    <div class="accordion-inner">
                        <%   
                        List<entFormulario> listFormulario=listModulos.get(contModulos).getList();
                        if(listFormulario!=null)
                        for(int contFormularios=0;contFormularios<listFormulario.size();contFormularios++)
                        {
                             if(listFormulario.get(contFormularios).isSelecion() && listFormulario.get(contFormularios).getPadre()==0)
                             {
                        %>
                        <div id="accordion<%=listModulos.get(contModulos).getId_modulo()%>" class="accordion">
                            <div class="accordion-group">
                                    <div class="accordion-heading">
                                            <a href="#collapse<%=contFormularios%><%=contModulos%>" data-parent="#accordion<%=listModulos.get(contModulos).getId_modulo()%>" data-toggle="collapse" class="accordion-toggle">
                                                    <%=listFormulario.get(contFormularios).getEtiqueta()%>
                                            </a>
                                    </div>
                                    <div class="accordion-body collapse" id="collapse<%=contFormularios%><%=contModulos%>">
                                            <div class="accordion-inner">                                                
                                                    
                                                    <%
                                                    out.print("<ul class='list_d'>");
                                                    for(entFormulario hijo : listFormulario)
                                                    if(hijo.isSelecion() && hijo.getPadre()==listFormulario.get(contFormularios).getId_formulario())
                                                        out.print("<li>"+hijo.getEtiqueta()+"<a onclick='addFormulario("+hijo.getId_formulario()+","+hijo.getPadre()+",\""+hijo.getEtiqueta()+"\",\"False\")' class='label ttip_r' title='Quitar "+hijo.getEtiqueta()+"'><i class='splashy-remove'></i></a> </li>");
                                                    out.print("</ul>");
                                                    %>
                                                   
                                            </div>
                                    </div>
                            </div>

                        </div>	
                        <%
                            }
                        
                        }
                        %>

                    </div>
            </div>
    </div>
 
<%
}
%>   
    
</div>    
</div>
<%
}
%>

				