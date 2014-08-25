
<%@page import="Entidades.entTransportista"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entDireccionLlegada"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtDireccion") != null && request.getParameter("txtDireccion") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entDireccionLlegada entidad = new entDireccionLlegada();
            entidad.setNombre(request.getParameter("txtDireccion"));
           entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdDireccionLlegada").equals("0") )
            {
                entidad.setId_dir_llegada(Integer.parseInt(request.getParameter("IdDireccionLlegada")));
                 if(clsGestor.actualizarDireccionLlegada(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarDireccionLlegada(entidad);
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