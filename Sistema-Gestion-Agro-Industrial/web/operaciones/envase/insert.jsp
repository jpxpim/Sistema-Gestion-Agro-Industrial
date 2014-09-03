
<%@page import="Entidades.entReceta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entSector"%>
<%@page import="Entidades.entCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entEnvase"%>
<%  
 entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtPeso") != null && request.getParameter("txtPeso") != "" &&
                request.getParameter("txtCajas") != null && request.getParameter("txtCajas") != "" &&
                request.getParameter("txtCarga") != null && request.getParameter("txtCarga") != "" &&
                request.getParameter("txtCodigo") != null && request.getParameter("txtCodigo") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" &&
                request.getParameter("cbReceta") != null && request.getParameter("cbReceta") != "")
        {
            entEnvase entidad = new entEnvase();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setPeso(Double.parseDouble(request.getParameter("txtPeso")));
            entidad.setPeso_carga(Double.parseDouble(request.getParameter("txtCarga")));
            entidad.setCant_cajas_paleta(Integer.parseInt(request.getParameter("txtCajas")));
            entidad.setCodigo_control(request.getParameter("txtCodigo"));
            
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            entidad.setObjReceta(new entReceta(Integer.parseInt(request.getParameter("cbReceta"))));
            
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdEnvase").equals("0") )
            {
                entidad.setId_envase(Integer.parseInt(request.getParameter("IdEnvase")));
                 if(clsGestor.actualizarEnvase(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarEnvase(entidad);
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