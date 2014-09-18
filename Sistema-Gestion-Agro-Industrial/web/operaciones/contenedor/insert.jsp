
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entContenedor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtPosx") != null && request.getParameter("txtPosx") != "" &&
                request.getParameter("txtPosy") != null && request.getParameter("txtPosy") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entContenedor entidad = new entContenedor();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setPos_x(Integer.parseInt(request.getParameter("txtPosx")));
            entidad.setPos_y(Integer.parseInt(request.getParameter("txtPosy")));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdContenedor").equals("0") )
            {
                entidad.setId_contenedor(Integer.parseInt(request.getParameter("IdContenedor")));
                 if(clsGestor.actualizarContenedor(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarContenedor(entidad);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
}
 %>