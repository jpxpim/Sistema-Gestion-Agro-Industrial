
<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entSector"%>
<%@page import="Entidades.entCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCalibre"%>
<%  
 entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtCodigo") != null && request.getParameter("txtCodigo") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" &&
                request.getParameter("cbCultivo") != null && request.getParameter("cbCultivo") != "")
        {
            entCalibre entidad = new entCalibre();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setCodigo_control(request.getParameter("txtCodigo"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            entidad.setObjCultivo(new entCultivo(Integer.parseInt(request.getParameter("cbCultivo"))));
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdCalibre").equals("0") )
            {
                entidad.setId_calibre(Integer.parseInt(request.getParameter("IdCalibre")));
                 if(clsGestor.actualizarCalibre(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarCalibre(entidad);
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