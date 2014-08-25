
<%@page import="Entidades.entTransportista"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entChofer"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtNombres") != null && request.getParameter("txtNombres") != "" &&
                request.getParameter("txtBrevete") != null && request.getParameter("txtBrevete") != "" &&
                request.getParameter("cbTransportista") != null && request.getParameter("cbTransportista") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entChofer entidad = new entChofer();
            entidad.setNombre(request.getParameter("txtNombres"));
            entidad.setBrevete(request.getParameter("txtBrevete"));
            entidad.setObjTransportista(new entTransportista(Integer.parseInt(request.getParameter("cbTransportista"))));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdChofer").equals("0") )
            {
                entidad.setId_chofer(Integer.parseInt(request.getParameter("IdChofer")));
                 if(clsGestor.actualizarChofer(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarChofer(entidad);
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