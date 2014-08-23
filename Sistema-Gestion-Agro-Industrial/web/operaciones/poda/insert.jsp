
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entPoda"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("idEvaluador") != null && request.getParameter("idEvaluador") != "" &&
                request.getParameter("idLoteCanpania") != null && request.getParameter("idLoteCanpania") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entPoda entidad = objSession.getObjPoda();
            entidad.setObjCampaniaLote(new entCampaniaLote(Integer.parseInt(request.getParameter("idLoteCanpania"))));
            entidad.setObjEvaluador(new entEvaluador(Integer.parseInt(request.getParameter("idEvaluador"))));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdPoda").equals("0") )
            {
                entidad.setId_poda(Integer.parseInt(request.getParameter("IdPoda")));
                 if(clsGestor.actualizarPoda(entidad))
                 {                   
                    out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarPoda(entidad);
                    if(id>0)
                    {
                        objSession.setObjPoda(null);
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