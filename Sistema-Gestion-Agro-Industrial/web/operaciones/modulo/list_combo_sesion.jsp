
<%@page import="Entidades.entModulo"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entSesion"%>

<%    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{ 
    if(request.getParameter("cbModulo") != null && request.getParameter("cbModulo") != "" )
    {
    %>
    <select id="<%=request.getParameter("cbModulo")%>" name="<%=request.getParameter("cbModulo")%>" title="Por favor selecione un Modulo!" required>
    <option value="">Selecione una Opción</option>
    <%
        List<entModulo> list=objSession.getListModulos();
        if(list!=null)
            for(entModulo entidad : list)
                out.print("<option value='"+entidad.getId_modulo()+"'>"+entidad.getEtiqueta()+"</option>");
    }
}
 %>
</select>