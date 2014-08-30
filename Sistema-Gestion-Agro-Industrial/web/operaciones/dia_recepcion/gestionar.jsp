
<%@page import="java.util.Date"%>
<%@page import="Entidades.entDiaRecepcion"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entCultivo"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("parametro") != null && request.getParameter("parametro") != "")
        {
            if(request.getParameter("parametro").equals("0"))
            {
                entDiaRecepcion entidad=new entDiaRecepcion();            
                entidad.setHora_inicio(new Date());
                entidad.setUsuario_responsable_inicio(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
                entidad.setEs_cerrado(false);

                 int id=clsGestor.insertarDiaRecepcion(entidad);
                    if(id>0)
                    {
                        entidad.setId_dia_recepcion(id);
                        objSession.setObjDiaRecepcion(entidad);
                        objSession.setDia_recepcion(true);
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("SessionUsuario", objSession); 
                        sesion.setMaxInactiveInterval(-1);
                        out.print(id);

                    }
                    else
                        out.print(0);
            }
            else  if(request.getParameter("parametro").equals("1"))
            {
                entDiaRecepcion entidad=objSession.getObjDiaRecepcion(); 
                entidad.setUsuario_responsable_fin(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());

                    if(clsGestor.actualizarDiaRecepcion(entidad))
                    {
                        objSession.setObjDiaRecepcion(null);
                        objSession.setDia_recepcion(false);
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("SessionUsuario", objSession); 
                        sesion.setMaxInactiveInterval(-1);
                        out.print(1);

                    }
                    else
                        out.print(-1);
            }
            else  if(request.getParameter("parametro").equals("2"))
            {
                objSession.setDia_recepcion(true);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession); 
                sesion.setMaxInactiveInterval(-1);
            }
            
        }
}
 %>