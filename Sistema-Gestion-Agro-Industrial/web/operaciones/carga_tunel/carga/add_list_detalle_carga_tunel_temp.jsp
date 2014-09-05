<%@page import="Entidades.entDetalleCargaTunel"%>
<%@page import="Entidades.entCliente"%>
<%@page import="java.util.Date"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>

<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("IdPaleta") != null && request.getParameter("IdPaleta") != "" &&
        request.getParameter("Codigo") != null && request.getParameter("Codigo") != "" &&
        request.getParameter("FProduccion") != null && request.getParameter("FProduccion") != "" &&
        request.getParameter("Estado") != null && request.getParameter("Estado") != "" &&
        request.getParameter("Posicicion") != null && request.getParameter("Posicicion") != "" &&
        request.getParameter("Cliente") != null && request.getParameter("Cliente") != "")
        {
            entPaleta objPaleta= new entPaleta();
            objPaleta.setId_paleta(Integer.parseInt(request.getParameter("IdPaleta")));
            objPaleta.setCodigo_control(request.getParameter("Codigo"));
            objPaleta.setFecha_produccion(new Date(Long.parseLong(request.getParameter("FProduccion"))));
            objPaleta.setEstado_paleta(Integer.parseInt(request.getParameter("Estado")));
            objPaleta.setPosicion_paleta(Integer.parseInt(request.getParameter("Estado")));
            objPaleta.setObjCliente(new entCliente(request.getParameter("Cliente")));
            
            boolean encontrado=false;
            
            int size=objSession.getObjCargaTunel().getListaDetalleCargaTunel().size();
            for(int i=0;i<size;i++)
            {
               if(objSession.getObjCargaTunel().getListaDetalleCargaTunel().get(i).getObjPaleta().getId_paleta()==objPaleta.getId_paleta())
               {
                   encontrado=true;
               }
            }
            
            if(encontrado)
            {
                out.print("0");
            }
            else
            {
                entDetalleCargaTunel entidad = new entDetalleCargaTunel();
                entidad.setObjPaleta(objPaleta);
                objSession.getObjCargaTunel().getListaDetalleCargaTunel().add(entidad);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession); 
                sesion.setMaxInactiveInterval(-1);
                out.print(0);
                out.print("1");
            }
            
            
            
        }
}%>  
                                                                        
                                                                       
                                                                            