
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%  

        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtResponsable") != null && request.getParameter("txtResponsable") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entVivero entidad = new entVivero();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setUsuario_responsable(request.getParameter("txtResponsable"));
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdVivero").equals("0") )
            {
                entidad.setId_vivero(Integer.parseInt(request.getParameter("IdVivero")));
                 if(clsGestor.actualizarVivero(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarVivero(entidad);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
 %>