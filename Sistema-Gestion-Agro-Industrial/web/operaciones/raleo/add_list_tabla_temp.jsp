

<%@page import="Entidades.entCabeceraRaleo"%>
<%@page import="Entidades.entRaleo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    if(request.getParameter("txtNH") != null && request.getParameter("txtNH") != "" &&
       request.getParameter("txtNP") != null && request.getParameter("txtNP") != "" &&
       request.getParameter("txtNRP") != null && request.getParameter("txtNRP") != "" &&
       request.getParameter("posicion") != null && request.getParameter("posicion") != "")
    {
        int pos = Integer.parseInt(request.getParameter("posicion"));  
        if(objSession.getObjRaleo()==null)
        {
            objSession.setObjRaleo(new entRaleo());
            if(objSession.getObjRaleo().getList()==null)
                objSession.getObjRaleo().setList(new ArrayList<entCabeceraRaleo>());
        }
        
        
        entCabeceraRaleo entidad=new entCabeceraRaleo();       
        entidad.setNum_racimo_planta(Integer.parseInt(request.getParameter("txtNRP")));
        entidad.setNum_planta(Integer.parseInt(request.getParameter("txtNP")));
        entidad.setNum_hilera(Integer.parseInt(request.getParameter("txtNH")));
        
        if(request.getParameter("txtNB1") != null && request.getParameter("txtNB1") != "" &&                
            request.getParameter("txtCR1") != null && request.getParameter("txtCR1") != "" &&
            request.getParameter("txtLR1") != null && request.getParameter("txtLR1") != "" &&
            !request.getParameter("cbTR1").equals("0"))
        {
            entidad.setNum_baya_1(Integer.parseInt(request.getParameter("txtNB1")));
            entidad.setCalidad_racimo_1(Integer.parseInt(request.getParameter("txtCR1")));
            entidad.setLargo_racimo_1(Integer.parseInt(request.getParameter("txtLR1")));
            entidad.setTipo_racimo_1(Integer.parseInt(request.getParameter("cbTR1")));
             if(request.getParameter("txtO1") != null && request.getParameter("txtO1") != "")
                 entidad.setObservaciones_1(request.getParameter("txtO1"));
            
        }
        else
        {
            entidad.setNum_baya_1(-1);
            entidad.setCalidad_racimo_1(-1);
            entidad.setLargo_racimo_1(-1);
            entidad.setTipo_racimo_1(0);            
        }
        
        if(request.getParameter("txtNB2") != null && request.getParameter("txtNB2") != "" &&                
            request.getParameter("txtCR2") != null && request.getParameter("txtCR2") != "" &&
            request.getParameter("txtLR2") != null && request.getParameter("txtLR2") != "" &&
            !request.getParameter("cbTR2").equals("0"))
        {
            entidad.setNum_baya_2(Integer.parseInt(request.getParameter("txtNB2")));
            entidad.setCalidad_racimo_2(Integer.parseInt(request.getParameter("txtCR2")));
            entidad.setLargo_racimo_2(Integer.parseInt(request.getParameter("txtLR2")));
            entidad.setTipo_racimo_2(Integer.parseInt(request.getParameter("cbTR2")));
             if(request.getParameter("txtO2") != null && request.getParameter("txtO2") != "")
                 entidad.setObservaciones_2(request.getParameter("txtO2"));
            
        }
        else
        {
            entidad.setNum_baya_2(-1);
            entidad.setCalidad_racimo_2(-1);
            entidad.setLargo_racimo_2(-1);
            entidad.setTipo_racimo_2(0);            
        }
        
        if(request.getParameter("txtNB3") != null && request.getParameter("txtNB3") != "" &&                
            request.getParameter("txtCR3") != null && request.getParameter("txtCR3") != "" &&
            request.getParameter("txtLR3") != null && request.getParameter("txtLR3") != "" &&
            !request.getParameter("cbTR3").equals("0"))
        {
            entidad.setNum_baya_3(Integer.parseInt(request.getParameter("txtNB3")));
            entidad.setCalidad_racimo_3(Integer.parseInt(request.getParameter("txtCR3")));
            entidad.setLargo_racimo_3(Integer.parseInt(request.getParameter("txtLR3")));
            entidad.setTipo_racimo_3(Integer.parseInt(request.getParameter("cbTR3")));
             if(request.getParameter("txtO3") != null && request.getParameter("txtO3") != "")
                 entidad.setObservaciones_3(request.getParameter("txtO3"));
            
        }
        else
        {
            entidad.setNum_baya_3(-1);
            entidad.setCalidad_racimo_3(-1);
            entidad.setLargo_racimo_3(-1);
            entidad.setTipo_racimo_3(0);            
        }

  
         
         
         
        if(pos>=0)
        {
            if(objSession.getObjRaleo().getId_raleo()>0)
            {
                entidad.setSeleccion(true);
                entidad.setId_cabecera_raleo(objSession.getObjRaleo().getList().get(pos).getId_cabecera_raleo());
            }
            
            objSession.getObjRaleo().getList().remove(pos);
            objSession.getObjRaleo().getList().add(pos, entidad);
        }
        else
        {
            objSession.getObjRaleo().getList().add(entidad);
        }
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);

    }
}
%>