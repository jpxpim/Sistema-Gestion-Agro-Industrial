

<%@page import="java.util.Date"%>
<%@page import="Entidades.entTunel"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCargaTunel"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("idTunel") != null && request.getParameter("idTunel") != "" &&
            request.getParameter("txtFechaInicio") != null && request.getParameter("txtFechaInicio") != "" &&
            request.getParameter("txtFechaFin") != null && request.getParameter("txtFechaFin") != "" &&
            request.getParameter("txtGrados") != null && request.getParameter("txtGrados") != "")
        {
            entCargaTunel entidad = objSession.getObjCargaTunel();
            entidad.setObjTunel(new entTunel(Integer.parseInt(request.getParameter("idTunel"))));            
            
            entidad.setInicio_descarga(new Date(Long.parseLong(request.getParameter("txtFechaInicio"))));
            entidad.setFin_descarga(new Date(Long.parseLong(request.getParameter("txtFechaFin"))));
            entidad.setTemperatura_descarga(Double.parseDouble(request.getParameter("txtGrados")));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(clsGestor.actualizarDescargaCargaTunel(entidad))
            {
                out.print(1);
            }
            else
                out.print(0);
      
           
                 
            
            
        }
}
 %>