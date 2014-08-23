
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entRaleo"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("idEvaluador") != null && request.getParameter("idEvaluador") != "" &&
                request.getParameter("idLoteCanpania") != null && request.getParameter("idLoteCanpania") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entRaleo entidad = objSession.getObjRaleo();
            entidad.setObjCampaniaLote(new entCampaniaLote(Integer.parseInt(request.getParameter("idLoteCanpania"))));
            entidad.setObjEvaluador(new entEvaluador(Integer.parseInt(request.getParameter("idEvaluador"))));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdRaleo").equals("0") )
            {
                entidad.setId_raleo(Integer.parseInt(request.getParameter("IdRaleo")));
                 if(clsGestor.actualizarRaleo(entidad))
                 {                   
                    out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarRaleo(entidad);
                    if(id>0)
                    {
                        objSession.setObjRaleo(null);
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("SessionUsuario", objSession);
                        sesion.setMaxInactiveInterval(-1);
                        out.print(id);
                        
                    }
                    else
                        out.print(-1);
             }       
        }
}
 %>