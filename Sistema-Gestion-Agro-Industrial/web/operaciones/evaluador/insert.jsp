
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtApellido") != null && request.getParameter("txtApellido") != "" &&
                request.getParameter("txtCodigoERP") != null && request.getParameter("txtCodigoERP") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entEvaluador entidad = new entEvaluador();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setApellido(request.getParameter("txtApellido"));
            entidad.setCodigo_erp(request.getParameter("txtCodigoERP"));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdEvaluador").equals("0") )
            {
                entidad.setId_evaluador(Integer.parseInt(request.getParameter("IdEvaluador")));
                 if(clsGestor.actualizarEvaluador(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarEvaluador(entidad);
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