
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entEdadCultivo"%>
<%  

        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtResponsable") != null && request.getParameter("txtResponsable") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entEdadCultivo entidad = new entEdadCultivo();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setUsuario_responsable(request.getParameter("txtResponsable"));
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdEdadCultivo").equals("0") )
            {
                entidad.setId_edad_cultivo(Integer.parseInt(request.getParameter("IdEdadCultivo")));
                 if(clsGestor.actualizarEdadCultivo(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarEdadCultivo(entidad);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
 %>