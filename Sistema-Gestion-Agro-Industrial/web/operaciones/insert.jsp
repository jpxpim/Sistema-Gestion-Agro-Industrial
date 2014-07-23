
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCultivo"%>
<%  

        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtResponsable") != null && request.getParameter("txtResponsable") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entCultivo objCultivo = new entCultivo();
            objCultivo.setNombre(request.getParameter("txtNombre"));
            objCultivo.setDescripcion(request.getParameter("txtDescripcion"));
            objCultivo.setUsuario_responsable(request.getParameter("txtResponsable"));
            objCultivo.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 objCultivo.setEstado(false);

            
            if(!request.getParameter("IdCultivo").equals("0") )
            {
                objCultivo.setId_cultivo(Integer.parseInt(request.getParameter("IdCultivo")));
                 if(clsGestor.actualizarCultivo(objCultivo))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarCultivo(objCultivo);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
 %>