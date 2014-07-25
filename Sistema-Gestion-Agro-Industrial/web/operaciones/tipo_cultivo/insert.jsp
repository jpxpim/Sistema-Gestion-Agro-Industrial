
<%@page import="Entidades.entTipoCultivo"%>
<%@page import="Com.clsGestor"%>
<%  

        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtResponsable") != null && request.getParameter("txtResponsable") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entTipoCultivo entidad = new entTipoCultivo();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setUsuario_responsable(request.getParameter("txtResponsable"));
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdTipodCultivo").equals("0") )
            {
                entidad.setId_tipo_cultivo(Integer.parseInt(request.getParameter("IdTipodCultivo")));
                 if(clsGestor.actualizarTipoCultivo(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarTipoCultivo(entidad);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
 %>