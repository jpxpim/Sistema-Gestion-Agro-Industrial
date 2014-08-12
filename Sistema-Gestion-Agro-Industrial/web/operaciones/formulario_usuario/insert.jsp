<%@page import="java.util.List"%>
<%@page import="Entidades.entModulo"%>
<%@page import="Entidades.entUsuario"%>
<%@page import="Entidades.entFormulario"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entFormularioUsuario"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("idusuario") != null && request.getParameter("idusuario") != "" &&
                request.getParameter("idFormulario") != null && request.getParameter("idFormulario") != "" &&
                request.getParameter("idPadre") != null && request.getParameter("idPadre") != "" &&
                request.getParameter("tipo") != null && request.getParameter("tipo") != "" )
        {
            boolean tipo=Boolean.parseBoolean(request.getParameter("tipo"));


            entFormularioUsuario entidad = new entFormularioUsuario();
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setObjUSuario(new entUsuario(Integer.parseInt(request.getParameter("idusuario"))) );
            entidad.setObjFormulario(new entFormulario(Integer.parseInt(request.getParameter("idFormulario")),Integer.parseInt(request.getParameter("idPadre"))));

            if(!tipo)
            {
                 if(clsGestor.eliminarentFormularioUsuario(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarentFormularioUsuario(entidad);
                    if(id>0)
                    {
                        out.print(id);
                        
                    }
                    else
                       out.print(-1);
             }
            
        for(int i=0;i<objSession.getListModulos().size();i++)
        {
            objSession.getListModulos().get(i).setSelecion(false);
            for(int j=0;j<objSession.getListModulos().get(i).getList().size();j++)
            {
                objSession.getListModulos().get(i).getList().get(j).setSelecion(false);
            }
        }
        List<entModulo> list=clsGestor.ListarUsuarioModulo(Integer.parseInt(request.getParameter("idusuario")));
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
        }

        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);
        
        }
}
 %>