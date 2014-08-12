<%@page import="Entidades.entModulo"%>
<%@page import="java.util.List"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entUsuario"%>
<%@page import="Entidades.entSesion"%>
<%  
 entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if( request.getParameter("id") != null && request.getParameter("id") != "" )
    {
        List<entModulo> list=clsGestor.ListarUsuarioModulo(Integer.parseInt(request.getParameter("id")));
        if(list!=null)
        {
            for(int i=0;i<objSession.getListModulos().size();i++)
            {
                for(int j=0;j<objSession.getListModulos().get(i).getList().size();j++)
                {
                    for(int x=0;x<list.size();x++)
                    {
                        if(objSession.getListModulos().get(i).getId_modulo()==list.get(x).getId_modulo())
                        {
                            objSession.getListModulos().get(i).setSelecion(true);
                            for(int y=0;y<list.get(x).getList().size();y++)
                            {
                                if(objSession.getListModulos().get(i).getList().get(j).getId_formulario()==list.get(x).getList().get(y).getId_formulario())
                                {
                                    objSession.getListModulos().get(i).getList().get(j).setSelecion(true);
                                }

                            }
                        }
                    }
                    
                }
                
            }
            HttpSession sesion = request.getSession();
            sesion.setAttribute("SessionUsuario", objSession); 
            sesion.setMaxInactiveInterval(-1);
            
        }
    }
}
 %>