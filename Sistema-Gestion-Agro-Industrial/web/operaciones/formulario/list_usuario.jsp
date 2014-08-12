
<%@page import="Entidades.entFormulario"%>
<%@page import="Entidades.entModulo"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entSesion"%>

<%    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{ 
    if(request.getParameter("idFormulario") != null && request.getParameter("idFormulario") != "" &&
       request.getParameter("idModulo") != null && request.getParameter("idModulo") != "" )
    {
    entModulo objModulo = new entModulo();
    for(entModulo entidad : objSession.getListModulos())
        if(entidad.getId_modulo()==Integer.parseInt(request.getParameter("idModulo"))) 
            objModulo=entidad;    

            
        out.print("<ul class='list_b'>");                                                   
        List<entFormulario> list=objModulo.getList();
        if(list!=null)
            for(entFormulario entidad : list)
                 if(entidad.getPadre()==Integer.parseInt(request.getParameter("idFormulario")) && !entidad.isSelecion()) 
              out.print("<li>"+entidad.getEtiqueta()+"  <a onclick='addFormulario("+entidad.getId_formulario()+","+entidad.getPadre()+",\""+entidad.getEtiqueta()+"\",\"True\")' class='label ttip_r' title='Agregar "+entidad.getEtiqueta()+"'><i class='splashy-add'></i></a>  </li>");
        out.print("</ul>");
    }
}
 %>