<%@page import="Entidades.entDetalleEmbarque"%>
<%@page import="java.util.Date"%>
<%@page import="Entidades.entPaleta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>

<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("IdPaleta") != null && request.getParameter("IdPaleta") != "" &&
        request.getParameter("txtCodigo") != null && request.getParameter("txtCodigo") != "" &&
        request.getParameter("FProduccion") != null && request.getParameter("FProduccion") != "" &&
        request.getParameter("Estado") != null && request.getParameter("Estado") != "" &&
        request.getParameter("Posicicion") != null && request.getParameter("Posicicion") != "" &&
            request.getParameter("PosI") != null && request.getParameter("PosI") != "" ) 
        {
            entPaleta objPaleta= new entPaleta();
            objPaleta.setId_paleta(Integer.parseInt(request.getParameter("IdPaleta")));
            objPaleta.setCodigo_control(request.getParameter("txtCodigo"));
            objPaleta.setFecha_produccion(new Date(Long.parseLong(request.getParameter("FProduccion"))));
            objPaleta.setEstado_paleta(Integer.parseInt(request.getParameter("Estado")));
            objPaleta.setPosicion_paleta(Integer.parseInt(request.getParameter("Posicicion")));
            
            boolean encontrado=false;
            
            int size=objSession.getObjEmbarque().getList().size();
            for(int i=0;i<size;i++)
            {
                if(objSession.getObjEmbarque().getList().get(i).getObjPaleta()!=null)
                    if(objSession.getObjEmbarque().getList().get(i).getObjPaleta().getId_paleta()==objPaleta.getId_paleta())
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
                int pos=Integer.parseInt(request.getParameter("PosI"));
                
                entDetalleEmbarque entidad =objSession.getObjEmbarque().getList().get(pos);                        
                objSession.getObjEmbarque().getList().remove(pos);    
                
                entidad.setObjPaleta(objPaleta);
                if(request.getParameter("rbSensor") != null && request.getParameter("rbSensor") != "")
                    entidad.setSensor(Integer.parseInt(request.getParameter("rbSensor")));
                if(request.getParameter("txtThermoregistro") != null && request.getParameter("txtThermoregistro") != "")
                    entidad.setThermoregistro(request.getParameter("txtThermoregistro"));
                
                objSession.getObjEmbarque().getList().add(pos, entidad);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("SessionUsuario", objSession); 
                sesion.setMaxInactiveInterval(-1);
                out.print("1");
            }
            
            
            
        }
}%>  
                                                                        
                                                                       
                                                                            