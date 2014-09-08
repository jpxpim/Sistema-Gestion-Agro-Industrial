

<%@page import="java.util.Date"%>
<%@page import="Entidades.entTunel"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCargaTunel"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("idTunel") != null && request.getParameter("idTunel") != "" )
        {
            entCargaTunel entidad = objSession.getObjCargaTunel();
            if(clsGestor.actualizarCarga(entidad))
            {
                out.print(1);
            }
            else
                out.print(0);
      
           
                 
            
            
        }
}
 %>