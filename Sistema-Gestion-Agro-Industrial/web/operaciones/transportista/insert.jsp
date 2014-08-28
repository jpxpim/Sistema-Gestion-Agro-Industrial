
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entTransportista"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtRazon") != null && request.getParameter("txtRazon") != "" &&
                request.getParameter("txtRuc") != null && request.getParameter("txtRuc") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entTransportista entidad = new entTransportista();
            entidad.setRazon_social(request.getParameter("txtRazon"));
            entidad.setRuc(request.getParameter("txtRuc"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdTransportista").equals("0") )
            {
                entidad.setId_transportista(Integer.parseInt(request.getParameter("IdTransportista")));
                 if(clsGestor.actualizarTransportista(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarTransportista(entidad);
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