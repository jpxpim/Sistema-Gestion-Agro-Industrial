

<%@page import="Entidades.entCliente"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entPaleta"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("idCliente") != null && request.getParameter("idCliente") != "" &&
            request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "")
        {
            entPaleta entidad = objSession.getObjPaleta();
            entidad.setObjCliente(new entCliente(Integer.parseInt(request.getParameter("idCliente"))));            
            if(!entidad.isCompleto())
            {
                if(request.getParameter("idCliente").equals("1"))
                    entidad.setCompleto(true);
            }
            
            entidad.setId_dia_recepcion(objSession.getObjDiaRecepcion().getId_dia_recepcion());
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            

            int id=clsGestor.insertarPaleta(entidad);
            if(id>0)
            {
                out.print(id);
            }
            else
                out.print(0);
      
           
                 
            
            
        }
}
 %>