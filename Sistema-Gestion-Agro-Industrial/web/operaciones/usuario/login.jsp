<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entUsuario"%>
<%@page import="Entidades.entSesion"%>
<%  
    if( request.getParameter("username") != null && request.getParameter("username") != "" &&
            request.getParameter("password") != null && request.getParameter("password") != "")
    {
      entUsuario objUsuario= clsGestor.loginUsuario(request.getParameter("username"), request.getParameter("password"));
            if(objUsuario!=null)
            {
                if(objUsuario.getEstado())
                {
                    entSesion objSession = new entSesion(); 
                    objSession.setObjUsuario(objUsuario);
                    objSession.setListModulos(clsGestor.ListarUsuarioModulo(objUsuario.getId_usuario()));
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("SessionUsuario", objSession); 
                    sesion.setMaxInactiveInterval(-1);
                    out.print(2); 
                }
                else
                     out.print(1);
            }  
            else
               out.print(0);
    }
    else
        out.print(-1);
 %>