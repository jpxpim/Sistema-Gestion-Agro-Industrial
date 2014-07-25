
<%@page import="Entidades.entCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVariedad"%>
<%  

        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtResponsable") != null && request.getParameter("txtResponsable") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" &&
                request.getParameter("cbCultivo") != null && request.getParameter("cbCultivo") != "")
        {
            entVariedad entidad = new entVariedad();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setUsuario_responsable(request.getParameter("txtResponsable"));
            entidad.setEstado(true);
            entidad.setObjCultivo(new entCultivo(Integer.parseInt(request.getParameter("cbCultivo"))));
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdVariedad").equals("0") )
            {
                entidad.setId_variedad(Integer.parseInt(request.getParameter("IdVariedad")));
                 if(clsGestor.actualizarVariedad(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarVariedad(entidad);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
 %>