
<%@page import="Entidades.entVariedad"%>
<%@page import="Entidades.entTipoCultivo"%>
<%@page import="Entidades.entSubSector"%>
<%@page import="Entidades.entPatron"%>
<%@page import="Entidades.entVivero"%>
<%@page import="Entidades.entProductor"%>
<%@page import="Entidades.entEdadCultivo"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entLote"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtHectareas") != null && request.getParameter("txtHectareas") != "" &&
                request.getParameter("txtCodigo") != null && request.getParameter("txtCodigo") != "" &&
                request.getParameter("txtCentro") != null && request.getParameter("txtCentro") != "" &&
                request.getParameter("txtAnio") != null && request.getParameter("txtAnio") != "" &&
                request.getParameter("cbProductor") != null && request.getParameter("cbProductor") != "" &&
                request.getParameter("cbPatron") != null && request.getParameter("cbPatron") != "" &&
                request.getParameter("cbVivero") != null && request.getParameter("cbVivero") != "" &&
                request.getParameter("cbSubSector") != null && request.getParameter("cbSubSector") != "" &&
                request.getParameter("cbTipoCultivo") != null && request.getParameter("cbTipoCultivo") != "" &&
                request.getParameter("cbEdadCultivo") != null && request.getParameter("cbEdadCultivo") != "" &&
                request.getParameter("cbVariedad") != null && request.getParameter("cbVariedad") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entLote entidad = new entLote();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setCodigo_control(request.getParameter("txtCodigo"));
            entidad.setCentro_costo(request.getParameter("txtCentro"));
            entidad.setAnio_siembra(Integer.parseInt(request.getParameter("txtAnio")));
            entidad.setHectareas(Double.parseDouble(request.getParameter("txtHectareas")));            
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            
            entidad.setObjProductor(new entProductor(Integer.parseInt(request.getParameter("cbProductor"))));
            entidad.setObjPatron(new entPatron(Integer.parseInt(request.getParameter("cbPatron"))));
            entidad.setObjVivero(new entVivero(Integer.parseInt(request.getParameter("cbVivero"))));
            entidad.setObjSubSector(new entSubSector(Integer.parseInt(request.getParameter("cbSubSector"))));
            entidad.setObjTipoCultivo(new entTipoCultivo(Integer.parseInt(request.getParameter("cbTipoCultivo"))));
            entidad.setObjEdadCultivo(new entEdadCultivo(Integer.parseInt(request.getParameter("cbEdadCultivo"))));
            entidad.setObjVariedad(new entVariedad(Integer.parseInt(request.getParameter("cbVariedad"))));
            
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdLote").equals("0") )
            {
                entidad.setId_lote(Integer.parseInt(request.getParameter("IdLote")));
                 if(clsGestor.actualizarLote(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarLote(entidad);
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