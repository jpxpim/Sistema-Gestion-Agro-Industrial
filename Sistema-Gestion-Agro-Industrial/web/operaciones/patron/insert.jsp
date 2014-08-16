
<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entPatron"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtCodigo") != null && request.getParameter("txtCodigo") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entPatron entidad = new entPatron();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setCodigo_control(request.getParameter("txtCodigo"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdPatron").equals("0") )
            {
                entidad.setId_patron(Integer.parseInt(request.getParameter("IdPatron")));
                 if(clsGestor.actualizarPatron(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarPatron(entidad);
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