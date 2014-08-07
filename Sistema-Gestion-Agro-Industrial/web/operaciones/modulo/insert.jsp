
<%@page import="Entidades.entModulo"%>
<%@page import="Entidades.entFormulario"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("IdFormulario") != null && request.getParameter("IdFormulario") != "" &&
                request.getParameter("cbModuloFormulario") != null && request.getParameter("cbModuloFormulario") != "" &&
                request.getParameter("cbFormulario") != null && request.getParameter("cbFormulario") != "" &&
                request.getParameter("rbAccion") != null && request.getParameter("rbAccion") != "" )
        {       
                
            entFormulario entidad=null; 
            int sizeI=objSession.getListModulos().size();
            for(int i=0;i<sizeI;i++)
            {
                int siseJ=objSession.getListModulos().get(i).getList().size();
                for(int j=0;j<siseJ;j++)
                {
                    if(objSession.getListModulos().get(i).getList().get(j).getId_formulario()==Integer.parseInt(request.getParameter("IdFormulario"))) 
                    {
                        entidad=objSession.getListModulos().get(i).getList().get(j);
                        j=siseJ;
                        i=sizeI;
                    }
                    
                }
            } 
            entidad.setObjModulo(new entModulo(Integer.parseInt(request.getParameter("cbModuloFormulario"))));
            entidad.setPadre(Integer.parseInt(request.getParameter("cbFormulario")));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            

            if(request.getParameter("rbAccion").equals("0"))
            {
                 if(clsGestor.actualizarFormulario(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarFormulario(entidad);
                    if(id>0)
                    {
                        
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            objSession.setListModulos(clsGestor.ListarUsuarioModulo(objSession.getObjUsuario().getId_usuario()));
            HttpSession sesion = request.getSession();
            sesion.setAttribute("SessionUsuario", objSession);
            sesion.setMaxInactiveInterval(-1);
            
        }
}
 %>