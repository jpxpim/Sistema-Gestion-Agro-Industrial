
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCliente"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtRuc") != null && request.getParameter("txtRuc") != "" &&
                request.getParameter("txtDireccion") != null && request.getParameter("txtDireccion") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entCliente entidad = new entCliente();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setRuc(request.getParameter("txtRuc"));
            entidad.setDireccion(request.getParameter("txtDireccion"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdCliente").equals("0") )
            {
                entidad.setId_cliente(Integer.parseInt(request.getParameter("IdCliente")));
                 if(clsGestor.actualizarCliente(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarCliente(entidad);
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