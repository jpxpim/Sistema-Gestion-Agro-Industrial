

<%@page import="Entidades.entDetallePoda"%>
<%@page import="Entidades.entCabeceraPoda"%>
<%@page import="Entidades.entPoda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    if(request.getParameter("txtNH") != null && request.getParameter("txtNH") != "" &&
       request.getParameter("txtNP") != null && request.getParameter("txtNP") != "" &&
       request.getParameter("txtNSP") != null && request.getParameter("txtNSP") != "" &&
       request.getParameter("txtNCP") != null && request.getParameter("txtNCP") != "" &&
       request.getParameter("posicion") != null && request.getParameter("posicion") != "")
    {
        int pos = Integer.parseInt(request.getParameter("posicion"));  
        if(objSession.getObjPoda()==null)
        {
            objSession.setObjPoda(new entPoda());
            if(objSession.getObjPoda().getList()==null)
                objSession.getObjPoda().setList(new ArrayList<entCabeceraPoda>());
        }
        
        
        entCabeceraPoda entidad=new entCabeceraPoda();
        

        
        entidad.setNum_salida_planta(Integer.parseInt(request.getParameter("txtNSP")));
        entidad.setNum_planta(Integer.parseInt(request.getParameter("txtNP")));
        entidad.setNum_hilera(Integer.parseInt(request.getParameter("txtNH")));
        entidad.setNum_cargador_planta(Integer.parseInt(request.getParameter("txtNCP")));
        
        entidad.setList(new ArrayList<entDetallePoda>());
        
        
        entDetallePoda datalle0 = new entDetallePoda();
        
        if(request.getParameter("txt0") != null && request.getParameter("txt0") != "" )
            datalle0.setCantidad(Integer.parseInt(request.getParameter("txt0")));  

         entidad.getList().add(datalle0);
         
         entDetallePoda datalle1 = new entDetallePoda();
        
        if(request.getParameter("txt1") != null && request.getParameter("txt1") != "" )
            datalle1.setCantidad(Integer.parseInt(request.getParameter("txt1")));  

         entidad.getList().add(datalle1);
         
         entDetallePoda datalle2 = new entDetallePoda();
        
        if(request.getParameter("txt2") != null && request.getParameter("txt2") != "" )
            datalle2.setCantidad(Integer.parseInt(request.getParameter("txt2")));  
 
         entidad.getList().add(datalle2);
         
        entDetallePoda datalle3 = new entDetallePoda();
        
        if(request.getParameter("txt3") != null && request.getParameter("txt3") != "" )
            datalle3.setCantidad(Integer.parseInt(request.getParameter("txt3")));  
  
         entidad.getList().add(datalle3);
         
        entDetallePoda datalle4 = new entDetallePoda();
        
        if(request.getParameter("txt4") != null && request.getParameter("txt4") != "" )
            datalle4.setCantidad(Integer.parseInt(request.getParameter("txt4")));  

         entidad.getList().add(datalle4);
         
         entDetallePoda datalle5 = new entDetallePoda();
        
        if(request.getParameter("txt5") != null && request.getParameter("txt5") != "" )
            datalle5.setCantidad(Integer.parseInt(request.getParameter("txt5")));  

         entidad.getList().add(datalle5);
         
        entDetallePoda datalle6 = new entDetallePoda();
        
        if(request.getParameter("txt6") != null && request.getParameter("txt6") != "" )
            datalle6.setCantidad(Integer.parseInt(request.getParameter("txt6")));  

         entidad.getList().add(datalle6);
         
         entDetallePoda datalle7 = new entDetallePoda();
        
        if(request.getParameter("txt7") != null && request.getParameter("txt7") != "" )
            datalle7.setCantidad(Integer.parseInt(request.getParameter("txt7")));  
  
         entidad.getList().add(datalle7);
         
        entDetallePoda datalle8 = new entDetallePoda();
        
        if(request.getParameter("txt8") != null && request.getParameter("txt8") != "" )
            datalle8.setCantidad(Integer.parseInt(request.getParameter("txt8")));  
   
         entidad.getList().add(datalle8);
         
         entDetallePoda datalle9 = new entDetallePoda();
        
        if(request.getParameter("txt9") != null && request.getParameter("txt9") != "" )
            datalle9.setCantidad(Integer.parseInt(request.getParameter("txt9")));  
   
        entidad.getList().add(datalle9);
        
        entDetallePoda datalle10 = new entDetallePoda();
        
        if(request.getParameter("txt10") != null && request.getParameter("txt10") != "" )
            datalle10.setCantidad(Integer.parseInt(request.getParameter("txt10")));  
   
         entidad.getList().add(datalle10);
         
         entDetallePoda datalle11 = new entDetallePoda();
        
        if(request.getParameter("txt11") != null && request.getParameter("txt11") != "" )
            datalle11.setCantidad(Integer.parseInt(request.getParameter("txt11")));  

         entidad.getList().add(datalle11);
         
         entDetallePoda datalle12 = new entDetallePoda();
        
        if(request.getParameter("txt12") != null && request.getParameter("txt12") != "" )
            datalle12.setCantidad(Integer.parseInt(request.getParameter("txt12")));  
 
         entidad.getList().add(datalle12);
         
         entDetallePoda datalle13 = new entDetallePoda();
        
        if(request.getParameter("txt13") != null && request.getParameter("txt13") != "" )
            datalle13.setCantidad(Integer.parseInt(request.getParameter("txt13")));  

         entidad.getList().add(datalle13);
         
         entDetallePoda datalle14 = new entDetallePoda();
        
        if(request.getParameter("txt14") != null && request.getParameter("txt14") != "" )
            datalle14.setCantidad(Integer.parseInt(request.getParameter("txt14")));  

         entidad.getList().add(datalle14);
         
         entDetallePoda datalle15 = new entDetallePoda();
        
        if(request.getParameter("txt15") != null && request.getParameter("txt15") != "" )
            datalle15.setCantidad(Integer.parseInt(request.getParameter("txt15")));  

         entidad.getList().add(datalle15);
         
         entDetallePoda datalle16 = new entDetallePoda();
        
        if(request.getParameter("txt16") != null && request.getParameter("txt16") != "" )
            datalle16.setCantidad(Integer.parseInt(request.getParameter("txt16")));  
  
         entidad.getList().add(datalle16);
         
         entDetallePoda datalle17 = new entDetallePoda();
        
        if(request.getParameter("txt17") != null && request.getParameter("txt17") != "" )
            datalle17.setCantidad(Integer.parseInt(request.getParameter("txt17")));  
  
         entidad.getList().add(datalle17);
         
         entDetallePoda datalle18 = new entDetallePoda();
        
        if(request.getParameter("txt18") != null && request.getParameter("txt18") != "" )
            datalle18.setCantidad(Integer.parseInt(request.getParameter("txt18")));  
     
         entidad.getList().add(datalle18);
         
         entDetallePoda datalle19 = new entDetallePoda();
        
        if(request.getParameter("txt19") != null && request.getParameter("txt19") != "" )
            datalle19.setCantidad(Integer.parseInt(request.getParameter("txt19")));  
    
         entidad.getList().add(datalle19);
         
         entDetallePoda datalle20 = new entDetallePoda();
        
        if(request.getParameter("txt20") != null && request.getParameter("txt20") != "" )
            datalle20.setCantidad(Integer.parseInt(request.getParameter("txt20")));  
  
         entidad.getList().add(datalle20);
         
         entDetallePoda datalle21 = new entDetallePoda();
        
        if(request.getParameter("txt21") != null && request.getParameter("txt21") != "" )
            datalle21.setCantidad(Integer.parseInt(request.getParameter("txt21")));  
  
         entidad.getList().add(datalle21);
         
         entDetallePoda datalle22 = new entDetallePoda();
        
        if(request.getParameter("txt22") != null && request.getParameter("txt22") != "" )
            datalle22.setCantidad(Integer.parseInt(request.getParameter("txt22")));  
       
         entidad.getList().add(datalle22);
         
         entDetallePoda datalle23 = new entDetallePoda();
        
        if(request.getParameter("txt23") != null && request.getParameter("txt23") != "" )
            datalle23.setCantidad(Integer.parseInt(request.getParameter("txt23")));  

         entidad.getList().add(datalle23);
         
         entDetallePoda datalle24 = new entDetallePoda();
        
        if(request.getParameter("txt24") != null && request.getParameter("txt24") != "" )
            datalle24.setCantidad(Integer.parseInt(request.getParameter("txt24")));  

         entidad.getList().add(datalle24);
         
         entDetallePoda datalle25 = new entDetallePoda();
        
        if(request.getParameter("txt25") != null && request.getParameter("txt25") != "" )
            datalle25.setCantidad(Integer.parseInt(request.getParameter("txt25")));  
 
         entidad.getList().add(datalle25);
         
         entDetallePoda datalle26 = new entDetallePoda();
        
        if(request.getParameter("txt26") != null && request.getParameter("txt26") != "" )
            datalle26.setCantidad(Integer.parseInt(request.getParameter("txt26")));  

         entidad.getList().add(datalle26);
         
         entDetallePoda datalle27 = new entDetallePoda();
        
        if(request.getParameter("txt27") != null && request.getParameter("txt27") != "" )
            datalle27.setCantidad(Integer.parseInt(request.getParameter("txt27")));  

         entidad.getList().add(datalle27);
         
         entDetallePoda datalle28 = new entDetallePoda();
        
        if(request.getParameter("txt28") != null && request.getParameter("txt28") != "" )
            datalle28.setCantidad(Integer.parseInt(request.getParameter("txt28")));  

         entidad.getList().add(datalle28);
         
         entDetallePoda datalle29 = new entDetallePoda();
        
        if(request.getParameter("txt29") != null && request.getParameter("txt29") != "" )
            datalle29.setCantidad(Integer.parseInt(request.getParameter("txt29")));  

         entidad.getList().add(datalle29);
         
         entDetallePoda datalle30 = new entDetallePoda();
        
        if(request.getParameter("txt30") != null && request.getParameter("txt30") != "" )
            datalle30.setCantidad(Integer.parseInt(request.getParameter("txt30")));  
    
         entidad.getList().add(datalle30);
         
         entDetallePoda datalle31 = new entDetallePoda();
        
        if(request.getParameter("txt31") != null && request.getParameter("txt31") != "" )
            datalle31.setCantidad(Integer.parseInt(request.getParameter("txt31")));  
    
         entidad.getList().add(datalle31);
         
         entDetallePoda datalle32 = new entDetallePoda();
        
        if(request.getParameter("txt32") != null && request.getParameter("txt32") != "" )
            datalle32.setCantidad(Integer.parseInt(request.getParameter("txt32")));  
      
         entidad.getList().add(datalle32);
         
         entDetallePoda datalle33 = new entDetallePoda();
        
        if(request.getParameter("txt33") != null && request.getParameter("txt33") != "" )
            datalle33.setCantidad(Integer.parseInt(request.getParameter("txt33")));  
    
         entidad.getList().add(datalle33);
         
         entDetallePoda datalle34 = new entDetallePoda();
        
        if(request.getParameter("txt34") != null && request.getParameter("txt34") != "" )
            datalle34.setCantidad(Integer.parseInt(request.getParameter("txt34")));  
  
         entidad.getList().add(datalle34);
         
         entDetallePoda datalle35 = new entDetallePoda();
        
        if(request.getParameter("txt35") != null && request.getParameter("txt35") != "" )
            datalle35.setCantidad(Integer.parseInt(request.getParameter("txt35")));  

         entidad.getList().add(datalle35);
         
         entDetallePoda datalle36 = new entDetallePoda();
        
        if(request.getParameter("txt36") != null && request.getParameter("txt36") != "" )
            datalle36.setCantidad(Integer.parseInt(request.getParameter("txt36")));  
  
         entidad.getList().add(datalle36);
         
         entDetallePoda datalle37 = new entDetallePoda();
        
        if(request.getParameter("txt37") != null && request.getParameter("txt37") != "" )
            datalle37.setCantidad(Integer.parseInt(request.getParameter("txt37")));  

         entidad.getList().add(datalle37);
         
         entDetallePoda datalle38 = new entDetallePoda();
        
        if(request.getParameter("txt38") != null && request.getParameter("txt38") != "" )
            datalle38.setCantidad(Integer.parseInt(request.getParameter("txt38")));  

         entidad.getList().add(datalle38);
         
         entDetallePoda datalle39 = new entDetallePoda();
        
        if(request.getParameter("txt39") != null && request.getParameter("txt39") != "" )
            datalle39.setCantidad(Integer.parseInt(request.getParameter("txt39")));  
        
         entidad.getList().add(datalle39);
         
         entDetallePoda datalle40 = new entDetallePoda();
        
        if(request.getParameter("txt40") != null && request.getParameter("txt40") != "" )
            datalle40.setCantidad(Integer.parseInt(request.getParameter("txt40")));  

         entidad.getList().add(datalle40);
         
         entDetallePoda datalle41 = new entDetallePoda();
        
        if(request.getParameter("txt41") != null && request.getParameter("txt41") != "" )
            datalle41.setCantidad(Integer.parseInt(request.getParameter("txt41")));  
  
         entidad.getList().add(datalle41);
         
         entDetallePoda datalle42 = new entDetallePoda();
        
        if(request.getParameter("txt42") != null && request.getParameter("txt42") != "" )
            datalle42.setCantidad(Integer.parseInt(request.getParameter("txt42")));  

         entidad.getList().add(datalle42);
         
         entDetallePoda datalle43 = new entDetallePoda();
        
        if(request.getParameter("txt43") != null && request.getParameter("txt43") != "" )
            datalle43.setCantidad(Integer.parseInt(request.getParameter("txt43")));  

         entidad.getList().add(datalle43);
         
         entDetallePoda datalle44 = new entDetallePoda();
        
        if(request.getParameter("txt44") != null && request.getParameter("txt44") != "" )
            datalle44.setCantidad(Integer.parseInt(request.getParameter("txt44")));  
        
         entidad.getList().add(datalle44);
         
         entDetallePoda datalle45 = new entDetallePoda();
         
         if(request.getParameter("txt45") != null && request.getParameter("txt45") != "" )
            datalle45.setCantidad(Integer.parseInt(request.getParameter("txt45")));  

         entidad.getList().add(datalle45);
         
         entDetallePoda datalle46 = new entDetallePoda();
        
        if(request.getParameter("txt46") != null && request.getParameter("txt46") != "" )
            datalle46.setCantidad(Integer.parseInt(request.getParameter("txt46")));  
  
         entidad.getList().add(datalle46);
         
         entDetallePoda datalle47 = new entDetallePoda();
        
        if(request.getParameter("txt47") != null && request.getParameter("txt47") != "" )
            datalle47.setCantidad(Integer.parseInt(request.getParameter("txt47")));  

         entidad.getList().add(datalle47);
         
         entDetallePoda datalle48 = new entDetallePoda();
        
        if(request.getParameter("txt48") != null && request.getParameter("txt48") != "" )
            datalle48.setCantidad(Integer.parseInt(request.getParameter("txt48")));  

         entidad.getList().add(datalle48);
         
         entDetallePoda datalle49 = new entDetallePoda();
        
        if(request.getParameter("txt49") != null && request.getParameter("txt49") != "" )
            datalle49.setCantidad(Integer.parseInt(request.getParameter("txt49")));  
        
         entidad.getList().add(datalle49);
         
        if(pos>=0)
        {
            if(objSession.getObjPoda().getId_poda()>0)
            {
                entidad.setSeleccion(true);
                entidad.setId_cabecera_poda(objSession.getObjPoda().getList().get(pos).getId_cabecera_poda());
            }
            
            objSession.getObjPoda().getList().remove(pos);
            objSession.getObjPoda().getList().add(pos, entidad);
        }
        else
        {
            objSession.getObjPoda().getList().add(entidad);
        }
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);

    }
}
%>