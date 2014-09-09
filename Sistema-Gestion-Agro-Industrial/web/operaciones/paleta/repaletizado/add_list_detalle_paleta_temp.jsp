 <%@page import="Entidades.entCalibre"%>
<%@page import="Entidades.entProductoTerminado"%>
<%@page import="Entidades.entDetallePaleta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entVivero"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("IdProductoTerminado") != null && request.getParameter("IdProductoTerminado") != "" &&
        request.getParameter("Codigo") != null && request.getParameter("Codigo") != "" &&
        request.getParameter("nCalibre") != null && request.getParameter("nCalibre") != "" &&
        request.getParameter("nVariedad") != null && request.getParameter("nVariedad") != "" &&
        request.getParameter("IdDetPaleta") != null && request.getParameter("IdDetPaleta") != "" &&
            request.getParameter("IdPaleta") != null && request.getParameter("IdPaleta") != "" &&
            request.getParameter("nCajas") != null && request.getParameter("nCajas") != "" &&
        request.getParameter("cLote") != null && request.getParameter("cLote") != "")
        {
            
            int nCajas=Integer.parseInt(request.getParameter("nCajas"));
            if(objSession.getObjPaleta().getListaDetallePaleta().size()==1)
            {
                nCajas=objSession.getObjPaleta().getListaDetallePaleta().get(0).getObjProductoTerminado().getId_dia_recepcion();
            }
            
            entProductoTerminado objProductoTerminado= new entProductoTerminado();
            objProductoTerminado.setCodigo_control(request.getParameter("Codigo"));
            objProductoTerminado.setEmbalador(request.getParameter("nCalibre"));
            objProductoTerminado.setSeleccionador(request.getParameter("nVariedad"));
            objProductoTerminado.setUsuario_responsable(request.getParameter("cLote") );
            objProductoTerminado.setId_dia_recepcion(Integer.parseInt(request.getParameter("nCajas")));
            objProductoTerminado.setId_producto_terminado(Integer.parseInt(request.getParameter("IdProductoTerminado")));
            
            entDetallePaleta entidad = new entDetallePaleta();
            entidad.setObjProductoTerminado(objProductoTerminado);
            entidad.setId_det_paleta(Integer.parseInt(request.getParameter("IdDetPaleta")));
            entidad.setId_paleta(Integer.parseInt(request.getParameter("IdPaleta")));
            boolean valida=false;
            boolean completo=true;
            
            for(entDetallePaleta objDetallePaleta :  objSession.getObjPaleta().getListaDetallePaleta())
            {
                 if(objDetallePaleta.getObjProductoTerminado().getId_dia_recepcion()!=entidad.getObjProductoTerminado().getId_dia_recepcion())
                {
                     completo=false;
                }
                
                if(objDetallePaleta.getObjProductoTerminado().getId_producto_terminado()==entidad.getObjProductoTerminado().getId_producto_terminado())
                {
                     valida=true;
                }
            }
            if(valida)
                out.print(-1);
            else
            {
                if(completo)
                {
                    if(objSession.getObjPaleta().getListaDetallePaleta().size()<nCajas)
                    {
                        objSession.getObjPaleta().setCompleto(true);
                        objSession.getObjPaleta().getListaDetallePaleta().add(entidad);                      
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("SessionUsuario", objSession); 
                        sesion.setMaxInactiveInterval(-1);
                        out.print(0);
                        
                    }
                    else
                    {
                        out.print(nCajas);
                    }
                    
                }
                else
                {
                    objSession.getObjPaleta().setCompleto(false);
                    objSession.getObjPaleta().getListaDetallePaleta().add(entidad);                      
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("SessionUsuario", objSession); 
                    sesion.setMaxInactiveInterval(-1);
                    out.print(-2);
                    
                }
                    
            }
            
        }
}%>  
                                                                        
                                                                       
                                                                            