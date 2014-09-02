
<%@page import="Entidades.entDireccionLlegada"%>
<%@page import="Entidades.entChofer"%>
<%@page import="java.util.Date"%>
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entRecepcion"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtModelo") != null && request.getParameter("txtModelo") != "" &&
                request.getParameter("txtPlaca") != null && request.getParameter("txtPlaca") != "" &&
                request.getParameter("txtGuia") != null && request.getParameter("txtGuia") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" &&
                request.getParameter("txtPrecinto") != null && request.getParameter("txtPrecinto") != "" &&
                request.getParameter("IdChofer") != null && request.getParameter("IdChofer") != "" &&
                request.getParameter("IdDireccion") != null && request.getParameter("IdDireccion") != "" &&
                request.getParameter("txtFecha") != null && request.getParameter("txtFecha") != "" )
        {
            entRecepcion entidad = objSession.getObjRecepcion();
            entidad.setModelo(request.getParameter("txtModelo"));
            entidad.setFecha_recepcion(new Date(request.getParameter("txtFecha")));
            entidad.setNum_guia(request.getParameter("txtGuia"));
            entidad.setPrecinto(request.getParameter("txtPrecinto"));
            entidad.setPlaca(request.getParameter("txtPlaca"));
            entidad.setId_dia_recepcion(objSession.getObjDiaRecepcion().getId_dia_recepcion());
            entidad.setObjChofer(new entChofer(Integer.parseInt(request.getParameter("IdChofer"))));
            entidad.setObjDireccionLlegada(new entDireccionLlegada(Integer.parseInt(request.getParameter("IdDireccion"))));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            
            entidad.setEstado(1);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(0);

            
            if(objSession.getObjRecepcion().getId_recepcion()>0)
            {
                 if(clsGestor.actualizarRecepcion(entidad))
                 {                   
                    out.print(0);
                        objSession.setObjRecepcion(entidad);
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("SessionUsuario", objSession);
                        sesion.setMaxInactiveInterval(-1);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarRecepcion(entidad);
                    if(id>0)
                    {
                        objSession.setObjRecepcion(null);
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