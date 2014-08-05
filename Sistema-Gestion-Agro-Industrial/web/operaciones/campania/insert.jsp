
<%@page import="java.util.Date"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCampania"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtInicio") != null && request.getParameter("txtInicio") != "" &&
                request.getParameter("txtFin") != null && request.getParameter("txtFin") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entCampania entidad = new entCampania();
            entidad.setNombre(Integer.parseInt(request.getParameter("txtNombre")));
            entidad.setFecha_inicio(new Date(request.getParameter("txtInicio")));
            entidad.setFecha_fin(new Date(request.getParameter("txtFin")));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdCampania").equals("0") )
            {
                entidad.setId_campania(Integer.parseInt(request.getParameter("IdCampania")));
                 if(clsGestor.actualizarCampania(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarCampania(entidad);
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