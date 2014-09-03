
<%@page import="Entidades.entDetalleReceta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entReceta"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entReceta entidad = new entReceta();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);            
            entidad.setList(objSession.getListDetalleReceta());
            
            if(!request.getParameter("IdReceta").equals("0") )
            {
                entidad.setId_receta(Integer.parseInt(request.getParameter("IdReceta")));
                 if(clsGestor.actualizarReceta(entidad))
                 {
                     objSession.setListDetalleReceta(new ArrayList<entDetalleReceta>() );
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarReceta(entidad);
                    if(id>0)
                    {
                        objSession.setListDetalleReceta(new ArrayList<entDetalleReceta>() );
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
                out.print("1");
            
        }
}
 %>