
<%@page import="Entidades.entInsumo"%>
<%@page import="Entidades.entDetalleReceta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("id") != null && request.getParameter("id") != "" &&
            request.getParameter("nombre") != null && request.getParameter("nombre") != "" &&
            request.getParameter("cantidad") != null && request.getParameter("cantidad") != "" )
        {
            int id=Integer.parseInt(request.getParameter("id"));
            
           
            int pos =-1;
            for(int i=0;i<objSession.getListDetalleReceta().size();i++)
            {
                if(id==objSession.getListDetalleReceta().get(i).getObjInsumo().getId_insumo())
                {
                    pos=i;
                }
                
            }
            
            if(pos==-1)
            {
                entDetalleReceta entidad = new entDetalleReceta();
                entidad.setObjInsumo(new entInsumo(id,request.getParameter("nombre")));
                entidad.setCantidad(Double.parseDouble(request.getParameter("cantidad")));
                entidad.setAgregado_session(true);
                objSession.getListDetalleReceta().add(entidad);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession);
                sesion.setMaxInactiveInterval(-1);
                out.print("1");
            }
            else
            {
                if(objSession.getListDetalleReceta().get(pos).isEliminado_session())
                {
                     objSession.getListDetalleReceta().get(pos).setEliminado_session(false);
                     HttpSession sesion = request.getSession();
                     sesion.setAttribute("SessionUsuario", objSession);
                     sesion.setMaxInactiveInterval(-1);
                     out.print("1");
                }
                else
                    out.print("0");
            }

        }
}
 %>