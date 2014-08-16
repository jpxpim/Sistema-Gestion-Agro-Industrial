
<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entSector"%>
<%@page import="Entidades.entCultivo"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSubSector"%>
<%  
 entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtGrower") != null && request.getParameter("txtGrower") != "" &&
                request.getParameter("txtCodigo") != null && request.getParameter("txtCodigo") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" &&
                request.getParameter("cbSector") != null && request.getParameter("cbSector") != "")
        {
            entSubSector entidad = new entSubSector();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setGrower_senasa(request.getParameter("txtGrower"));
            entidad.setCodigo_control(request.getParameter("txtCodigo"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            entidad.setObjSector(new entSector(Integer.parseInt(request.getParameter("cbSector"))));
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdSubSector").equals("0") )
            {
                entidad.setId_sub_sector(Integer.parseInt(request.getParameter("IdSubSector")));
                 if(clsGestor.actualizarSubSector(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarSubSector(entidad);
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