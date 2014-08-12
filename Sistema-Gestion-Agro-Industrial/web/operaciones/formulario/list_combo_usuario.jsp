
<%@page import="Entidades.entFormulario"%>
<%@page import="Entidades.entModulo"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entSesion"%>

<%    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{ 
    if(request.getParameter("cbFormulario") != null && request.getParameter("cbFormulario") != "" &&
       request.getParameter("idModulo") != null && request.getParameter("idModulo") != "" )
    {
    entModulo objModulo = new entModulo();
    for(entModulo entidad : objSession.getListModulos())
        if(entidad.getId_modulo()==Integer.parseInt(request.getParameter("idModulo"))) 
            objModulo=entidad;    
    %>
    <select id="<%=request.getParameter("cbFormulario")%>" name="<%=request.getParameter("cbFormulario")%>" title="Por favor selecione un Cabecera!" required>
    <option value="">Selecione una Opción</option>
    <%
        
        List<entFormulario> list=objModulo.getList();
        if(list!=null)
            for(entFormulario entidad : list)
                 if(entidad.getPadre()==0) 
                 out.print("<option value='"+entidad.getId_formulario()+"'>"+entidad.getEtiqueta()+"</option>");
    }
}
 %>
</select>