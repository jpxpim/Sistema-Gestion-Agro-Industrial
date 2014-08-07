<%@page import="Entidades.entFormulario"%>
<%@page import="Entidades.entModulo"%>
<%@page import="Entidades.entSesion"%>
<div id="getModulo" class="accordion">
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
if(request.getParameter("id") != null && request.getParameter("id") != "" )    
{
    entModulo objModulo = new entModulo();
    for(entModulo entidad : objSession.getListModulos())
        if(entidad.getId_modulo()==Integer.parseInt(request.getParameter("id"))) 
            objModulo=entidad;
    for(entFormulario padre : objModulo.getList())  
    if(padre.getPadre()==0)
    {
    %>

        <div class="accordion-group">
                <div class="accordion-heading">
                    <a href="#collapseFormulario<%=padre.getControl_form()%>" data-parent="#getModulo" data-toggle="collapse" class="accordion-toggle">
                                <%=padre.getEtiqueta()%>
                     </a>
                </div>
                <div class="accordion-body collapse" id="collapseFormulario<%=padre.getControl_form()%>">
                        <div class="accordion-inner">
                            <%
                                out.print("<ul class='list_b'>");
                                for(entFormulario hijo : objModulo.getList())
                                if(hijo.getPadre()==padre.getId_formulario())
                                {
                            %>
                                <li><%=hijo.getEtiqueta()%><a onclick="getFormulario(<%=hijo.getId_formulario()%>,'<%=hijo.getEtiqueta()%>',<%=padre.getId_formulario()%>,'<%=padre.getEtiqueta()%>','<%=objModulo.getEtiqueta()%>')" class="label ttip_r" title="Seleccionar <%=hijo.getEtiqueta()%>"><i class="splashy-arrow_large_right"></i></a></li>
                            <%
                                }    
                                out.print("</ul>");
                            %>                                
                        </div>
                </div>
        </div>

    <%
    }
}
%>
</div>
	