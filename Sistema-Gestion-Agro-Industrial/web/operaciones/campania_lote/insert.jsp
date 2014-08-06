<%@page import="java.util.Date"%>
txtFecha
<%@page import="Entidades.entCampania"%>
<%@page import="Entidades.entLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCampaniaLote"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("txtNumero") != null && request.getParameter("txtNumero") != "" &&
                request.getParameter("txtFecha") != null && request.getParameter("txtFecha") != "" &&
                request.getParameter("cbCampania") != null && request.getParameter("cbCampania") != "" &&
                request.getParameter("cbLote") != null && request.getParameter("cbLote") != "")
        {
            entCampaniaLote entidad = new entCampaniaLote();
            entidad.setNumero_plantas(Integer.parseInt(request.getParameter("txtNumero")));
            entidad.setObjLote(new entLote(Integer.parseInt(request.getParameter("cbLote"))));
            entidad.setFechaPodaFormacion(new Date(request.getParameter("txtFecha")));
            entidad.setObjCampania(new entCampania(Integer.parseInt(request.getParameter("cbCampania"))));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());

            
            if(!request.getParameter("IdCampaniaLote").equals("0") )
            {
                entidad.setId_campania_lote(Integer.parseInt(request.getParameter("IdCampaniaLote")));
                 if(clsGestor.actualizarCampaniaLote(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarCampaniaLote(entidad);
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