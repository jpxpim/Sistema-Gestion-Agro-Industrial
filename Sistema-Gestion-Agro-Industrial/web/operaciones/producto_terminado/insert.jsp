
<%@page import="Entidades.entColor"%>
<%@page import="Entidades.entCalibre"%>
<%@page import="Entidades.entEnvase"%>
<%@page import="Entidades.entCategoria"%>
<%@page import="Entidades.entLineaProduccion"%>
<%@page import="Entidades.entParihuela"%>
<%@page import="Entidades.entJaba"%>
<%@page import="Entidades.entLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entProductoTerminado"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("cbLineaProduccion") != null && request.getParameter("cbLineaProduccion") != "" &&
                request.getParameter("idEnvase") != null && request.getParameter("idEnvase") != "" &&
                request.getParameter("idCategoria") != null && request.getParameter("idCategoria") != "" &&
                request.getParameter("idLote") != null && request.getParameter("idLote") != "" &&
                request.getParameter("idCalibre") != null && request.getParameter("idCalibre") != "" &&
                request.getParameter("idColor") != null && request.getParameter("idColor") != "" &&
                request.getParameter("idSeleccionador") != null && request.getParameter("idSeleccionador") != "" &&
                request.getParameter("idEmpaquetador") != null && request.getParameter("idEmpaquetador") != "" &&
                request.getParameter("idDiaRecepcion") != null && request.getParameter("idDiaRecepcion") != "" &&
                request.getParameter("reempaque") != null && request.getParameter("reempaque") != "" )
        {
            entProductoTerminado entidad = new entProductoTerminado();
            entidad.setObjLineaProduccion(new entLineaProduccion(Integer.parseInt(request.getParameter("cbLineaProduccion"))));
            entidad.setObjEnvase(new entEnvase(Integer.parseInt(request.getParameter("idEnvase"))));
            entidad.setObjCategoria(new entCategoria(Integer.parseInt(request.getParameter("idCategoria"))));
            entidad.setObjLote(new entLote(Integer.parseInt(request.getParameter("idLote"))));           
            entidad.setObjCalibre(new entCalibre(Integer.parseInt(request.getParameter("idCalibre"))));            
            entidad.setObjColor(new entColor(Integer.parseInt(request.getParameter("idColor"))));
            entidad.setEstado(0);
            entidad.setSeleccionador(request.getParameter("idSeleccionador"));
            entidad.setEmbalador(request.getParameter("idEmpaquetador"));
            entidad.setId_dia_recepcion(Integer.parseInt(request.getParameter("idDiaRecepcion")));
           
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            if(request.getParameter("reempaque").equals("1"))
                entidad.setReempaque(true);

            if(!request.getParameter("IdProductoTerminado").equals("0") )
            {
                entidad.setId_producto_terminado(Integer.parseInt(request.getParameter("IdProductoTerminado")));
                 if(clsGestor.actualizarProductoTerminado(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarProductoTerminado(entidad);
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