
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entConfiguracion"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("cbTiempoAlerta") != null && request.getParameter("cbTiempoAlerta") != ""  &&
            request.getParameter("cbDash") != null && request.getParameter("cbDash") != "" &&
            request.getParameter("txtClave") != null && request.getParameter("txtClave") != "" &&
            request.getParameter("txtNombreBD") != null && request.getParameter("txtNombreBD") != "" &&
            request.getParameter("txtIPBD") != null && request.getParameter("txtIPBD") != "" &&
            request.getParameter("txtPuertoBD") != null && request.getParameter("txtPuertoBD") != "" &&
            request.getParameter("txtUsuarioBD") != null && request.getParameter("txtUsuarioBD") != "" &&
            request.getParameter("txtContraseniaBD") != null && request.getParameter("txtContraseniaBD") != "" &&
            request.getParameter("cbEmpresa") != null && request.getParameter("cbEmpresa") != "" &&
            request.getParameter("cbUsuario1") != null && request.getParameter("cbUsuario1") != "" )
    {
        entConfiguracion entidad = objSession.getObjConfiguracion();
        entidad.setTiempo_alerta(Integer.parseInt(request.getParameter("cbTiempoAlerta")));
        entidad.setSincro_dash(Integer.parseInt(request.getParameter("cbDash")));
        entidad.setProductor_empresa(Integer.parseInt(request.getParameter("cbEmpresa")));
        entidad.setUsuario_cierre_recepcion_1(Integer.parseInt(request.getParameter("cbUsuario1")));
        entidad.setUsuario_clave(request.getParameter("txtClave"));
        entidad.setNom_bd_erp_ext(request.getParameter("txtNombreBD"));
        entidad.setIp_bd_erp_ext(request.getParameter("txtIPBD"));
        entidad.setPuerto_erp_ext(request.getParameter("txtPuertoBD"));
        entidad.setUsuario_bd_erp_ext(request.getParameter("txtUsuarioBD"));
        entidad.setContra_bd_erp_ext(request.getParameter("txtContraseniaBD"));
        
        if(request.getParameter("cbUsuario2") != null && request.getParameter("cbUsuario2") != "" )
            entidad.setUsuario_cierre_recepcion_2(Integer.parseInt(request.getParameter("cbUsuario2")));
        if(request.getParameter("cbUsuario3") != null && request.getParameter("cbUsuario3") != "" )
            entidad.setUsuario_cierre_recepcion_2(Integer.parseInt(request.getParameter("cbUsuario3")));
        
        
         if(clsGestor.actualizarConfiguracion(entidad))
         {
            objSession.setObjConfiguracion(entidad);
            HttpSession sesion = request.getSession();
            sesion.setAttribute("SessionUsuario", objSession);
            sesion.setMaxInactiveInterval(-1);
             out.print(0);
         }
         else
             out.print(-1);


    }
}
 %>