
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entTunel"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("txtNombre") != null && request.getParameter("txtNombre") != "" &&
                request.getParameter("txtDescripcion") != null && request.getParameter("txtDescripcion") != "" &&
                request.getParameter("txtPosX") != null && request.getParameter("txtPosX") != "" &&
                request.getParameter("txtPosY") != null && request.getParameter("txtPosY") != "" &&
                request.getParameter("txtPosH") != null && request.getParameter("txtPosH") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entTunel entidad = new entTunel();
            entidad.setNombre(request.getParameter("txtNombre"));
            entidad.setDescripcion(request.getParameter("txtDescripcion"));
            entidad.setPos_x(Integer.parseInt(request.getParameter("txtPosX")));
            entidad.setPos_y(Integer.parseInt(request.getParameter("txtPosY")));
            entidad.setPos_h(Integer.parseInt(request.getParameter("txtPosH")));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdTunel").equals("0") )
            {
                entidad.setId_tunel(Integer.parseInt(request.getParameter("IdTunel")));
                 if(clsGestor.actualizarTunel(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarTunel(entidad);
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