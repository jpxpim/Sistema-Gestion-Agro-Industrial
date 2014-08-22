

<%@page import="Entidades.entDetallePrePoda"%>
<%@page import="Entidades.entCabeceraPrePoda"%>
<%@page import="Entidades.entPrePoda"%>
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
       request.getParameter("posicion") != null && request.getParameter("posicion") != "")
    {
        int pos = Integer.parseInt(request.getParameter("posicion"));  
        if(objSession.getObjPrePoda()==null)
        {
            objSession.setObjPrePoda(new entPrePoda());
            if(objSession.getObjPrePoda().getList()==null)
                objSession.getObjPrePoda().setList(new ArrayList<entCabeceraPrePoda>());
        }
        
        
        entCabeceraPrePoda entidad=new entCabeceraPrePoda();
        

        
        entidad.setNum_salida_planta(Integer.parseInt(request.getParameter("txtNSP")));
        entidad.setNum_planta(Integer.parseInt(request.getParameter("txtNP")));
        entidad.setNum_hilera(Integer.parseInt(request.getParameter("txtNH")));
        
        entidad.setList(new ArrayList<entDetallePrePoda>());
        
        
        entDetallePrePoda datalle0 = new entDetallePrePoda();
        
        if(request.getParameter("txtD0") != null && request.getParameter("txtD0") != "" )
            datalle0.setDiametro(Integer.parseInt(request.getParameter("txtD0")));  
        
        if(request.getParameter("txtF0") != null && request.getParameter("txtF0") != "" )
            datalle0.setFeminela(Integer.parseInt(request.getParameter("txtF0")));  
    
         entidad.getList().add(datalle0);
         
         entDetallePrePoda datalle1 = new entDetallePrePoda();
        
        if(request.getParameter("txtD1") != null && request.getParameter("txtD1") != "" )
            datalle1.setDiametro(Integer.parseInt(request.getParameter("txtD1")));  
        
        if(request.getParameter("txtF1") != null && request.getParameter("txtF1") != "" )
            datalle1.setFeminela(Integer.parseInt(request.getParameter("txtF1")));  
    
         entidad.getList().add(datalle1);
         
         entDetallePrePoda datalle2 = new entDetallePrePoda();
        
        if(request.getParameter("txtD2") != null && request.getParameter("txtD2") != "" )
            datalle2.setDiametro(Integer.parseInt(request.getParameter("txtD2")));  
        
        if(request.getParameter("txtF2") != null && request.getParameter("txtF2") != "" )
            datalle2.setFeminela(Integer.parseInt(request.getParameter("txtF2")));  
    
         entidad.getList().add(datalle2);
         
        entDetallePrePoda datalle3 = new entDetallePrePoda();
        
        if(request.getParameter("txtD3") != null && request.getParameter("txtD3") != "" )
            datalle3.setDiametro(Integer.parseInt(request.getParameter("txtD3")));  
        
        if(request.getParameter("txtF3") != null && request.getParameter("txtF3") != "" )
            datalle3.setFeminela(Integer.parseInt(request.getParameter("txtF3")));  
    
         entidad.getList().add(datalle3);
         
        entDetallePrePoda datalle4 = new entDetallePrePoda();
        
        if(request.getParameter("txtD4") != null && request.getParameter("txtD4") != "" )
            datalle4.setDiametro(Integer.parseInt(request.getParameter("txtD4")));  
        
        if(request.getParameter("txtF4") != null && request.getParameter("txtF4") != "" )
            datalle4.setFeminela(Integer.parseInt(request.getParameter("txtF4")));  
    
         entidad.getList().add(datalle4);
         
         entDetallePrePoda datalle5 = new entDetallePrePoda();
        
        if(request.getParameter("txtD5") != null && request.getParameter("txtD5") != "" )
            datalle5.setDiametro(Integer.parseInt(request.getParameter("txtD5")));  
        
        if(request.getParameter("txtF5") != null && request.getParameter("txtF5") != "" )
            datalle5.setFeminela(Integer.parseInt(request.getParameter("txtF5")));  
    
         entidad.getList().add(datalle5);
         
        entDetallePrePoda datalle6 = new entDetallePrePoda();
        
        if(request.getParameter("txtD6") != null && request.getParameter("txtD6") != "" )
            datalle6.setDiametro(Integer.parseInt(request.getParameter("txtD6")));  
        
        if(request.getParameter("txtF6") != null && request.getParameter("txtF6") != "" )
            datalle6.setFeminela(Integer.parseInt(request.getParameter("txtF6")));  
    
         entidad.getList().add(datalle6);
         
         entDetallePrePoda datalle7 = new entDetallePrePoda();
        
        if(request.getParameter("txtD7") != null && request.getParameter("txtD7") != "" )
            datalle7.setDiametro(Integer.parseInt(request.getParameter("txtD7")));  
        
        if(request.getParameter("txtF7") != null && request.getParameter("txtF7") != "" )
            datalle7.setFeminela(Integer.parseInt(request.getParameter("txtF7")));  
    
         entidad.getList().add(datalle7);
         
        entDetallePrePoda datalle8 = new entDetallePrePoda();
        
        if(request.getParameter("txtD8") != null && request.getParameter("txtD8") != "" )
            datalle8.setDiametro(Integer.parseInt(request.getParameter("txtD8")));  
        
        if(request.getParameter("txtF8") != null && request.getParameter("txtF8") != "" )
            datalle8.setFeminela(Integer.parseInt(request.getParameter("txtF8")));  
    
         entidad.getList().add(datalle8);
         
         entDetallePrePoda datalle9 = new entDetallePrePoda();
        
        if(request.getParameter("txtD9") != null && request.getParameter("txtD9") != "" )
            datalle9.setDiametro(Integer.parseInt(request.getParameter("txtD9")));  
        
        if(request.getParameter("txtF9") != null && request.getParameter("txtF9") != "" )
            datalle9.setFeminela(Integer.parseInt(request.getParameter("txtF9")));  
    
        entidad.getList().add(datalle9);
        
        entDetallePrePoda datalle10 = new entDetallePrePoda();
        
        if(request.getParameter("txtD10") != null && request.getParameter("txtD10") != "" )
            datalle10.setDiametro(Integer.parseInt(request.getParameter("txtD10")));  
        
        if(request.getParameter("txtF10") != null && request.getParameter("txtF10") != "" )
            datalle10.setFeminela(Integer.parseInt(request.getParameter("txtF10")));  
    
         entidad.getList().add(datalle10);
         
         entDetallePrePoda datalle11 = new entDetallePrePoda();
        
        if(request.getParameter("txtD11") != null && request.getParameter("txtD11") != "" )
            datalle11.setDiametro(Integer.parseInt(request.getParameter("txtD11")));  
        
        if(request.getParameter("txtF11") != null && request.getParameter("txtF11") != "" )
            datalle11.setFeminela(Integer.parseInt(request.getParameter("txtF11")));  
    
         entidad.getList().add(datalle11);
         
         entDetallePrePoda datalle12 = new entDetallePrePoda();
        
        if(request.getParameter("txtD12") != null && request.getParameter("txtD12") != "" )
            datalle12.setDiametro(Integer.parseInt(request.getParameter("txtD12")));  
        
        if(request.getParameter("txtF12") != null && request.getParameter("txtF12") != "" )
            datalle12.setFeminela(Integer.parseInt(request.getParameter("txtF12")));  
    
         entidad.getList().add(datalle12);
         
         entDetallePrePoda datalle13 = new entDetallePrePoda();
        
        if(request.getParameter("txtD13") != null && request.getParameter("txtD13") != "" )
            datalle13.setDiametro(Integer.parseInt(request.getParameter("txtD13")));  
        
        if(request.getParameter("txtF13") != null && request.getParameter("txtF13") != "" )
            datalle13.setFeminela(Integer.parseInt(request.getParameter("txtF13")));  
    
         entidad.getList().add(datalle13);
         
         entDetallePrePoda datalle14 = new entDetallePrePoda();
        
        if(request.getParameter("txtD14") != null && request.getParameter("txtD14") != "" )
            datalle14.setDiametro(Integer.parseInt(request.getParameter("txtD14")));  
        
        if(request.getParameter("txtF14") != null && request.getParameter("txtF14") != "" )
            datalle14.setFeminela(Integer.parseInt(request.getParameter("txtF14")));  
    
         entidad.getList().add(datalle14);
         
         entDetallePrePoda datalle15 = new entDetallePrePoda();
        
        if(request.getParameter("txtD15") != null && request.getParameter("txtD15") != "" )
            datalle15.setDiametro(Integer.parseInt(request.getParameter("txtD15")));  
        
        if(request.getParameter("txtF15") != null && request.getParameter("txtF15") != "" )
            datalle15.setFeminela(Integer.parseInt(request.getParameter("txtF15")));  
    
         entidad.getList().add(datalle15);
         
         entDetallePrePoda datalle16 = new entDetallePrePoda();
        
        if(request.getParameter("txtD16") != null && request.getParameter("txtD16") != "" )
            datalle16.setDiametro(Integer.parseInt(request.getParameter("txtD16")));  
        
        if(request.getParameter("txtF16") != null && request.getParameter("txtF16") != "" )
            datalle16.setFeminela(Integer.parseInt(request.getParameter("txtF16")));  
    
         entidad.getList().add(datalle16);
         
         entDetallePrePoda datalle17 = new entDetallePrePoda();
        
        if(request.getParameter("txtD17") != null && request.getParameter("txtD17") != "" )
            datalle17.setDiametro(Integer.parseInt(request.getParameter("txtD17")));  
        
        if(request.getParameter("txtF17") != null && request.getParameter("txtF17") != "" )
            datalle17.setFeminela(Integer.parseInt(request.getParameter("txtF17")));  
    
         entidad.getList().add(datalle17);
         
         entDetallePrePoda datalle18 = new entDetallePrePoda();
        
        if(request.getParameter("txtD18") != null && request.getParameter("txtD18") != "" )
            datalle18.setDiametro(Integer.parseInt(request.getParameter("txtD18")));  
        
        if(request.getParameter("txtF18") != null && request.getParameter("txtF18") != "" )
            datalle18.setFeminela(Integer.parseInt(request.getParameter("txtF18")));  
    
         entidad.getList().add(datalle18);
         
         entDetallePrePoda datalle19 = new entDetallePrePoda();
        
        if(request.getParameter("txtD19") != null && request.getParameter("txtD19") != "" )
            datalle19.setDiametro(Integer.parseInt(request.getParameter("txtD19")));  
        
        if(request.getParameter("txtF19") != null && request.getParameter("txtF19") != "" )
            datalle19.setFeminela(Integer.parseInt(request.getParameter("txtF19")));  
    
         entidad.getList().add(datalle19);
         
         entDetallePrePoda datalle20 = new entDetallePrePoda();
        
        if(request.getParameter("txtD20") != null && request.getParameter("txtD20") != "" )
            datalle20.setDiametro(Integer.parseInt(request.getParameter("txtD20")));  
        
        if(request.getParameter("txtF20") != null && request.getParameter("txtF20") != "" )
            datalle20.setFeminela(Integer.parseInt(request.getParameter("txtF20")));  
    
         entidad.getList().add(datalle20);
         
         entDetallePrePoda datalle21 = new entDetallePrePoda();
        
        if(request.getParameter("txtD21") != null && request.getParameter("txtD21") != "" )
            datalle21.setDiametro(Integer.parseInt(request.getParameter("txtD21")));  
        
        if(request.getParameter("txtF21") != null && request.getParameter("txtF21") != "" )
            datalle21.setFeminela(Integer.parseInt(request.getParameter("txtF21")));  
    
         entidad.getList().add(datalle21);
         
         entDetallePrePoda datalle22 = new entDetallePrePoda();
        
        if(request.getParameter("txtD22") != null && request.getParameter("txtD22") != "" )
            datalle22.setDiametro(Integer.parseInt(request.getParameter("txtD22")));  
        
        if(request.getParameter("txtF22") != null && request.getParameter("txtF22") != "" )
            datalle22.setFeminela(Integer.parseInt(request.getParameter("txtF22")));  
    
         entidad.getList().add(datalle22);
         
         entDetallePrePoda datalle23 = new entDetallePrePoda();
        
        if(request.getParameter("txtD23") != null && request.getParameter("txtD23") != "" )
            datalle23.setDiametro(Integer.parseInt(request.getParameter("txtD23")));  
        
        if(request.getParameter("txtF23") != null && request.getParameter("txtF23") != "" )
            datalle23.setFeminela(Integer.parseInt(request.getParameter("txtF23")));  
    
         entidad.getList().add(datalle23);
         
         entDetallePrePoda datalle24 = new entDetallePrePoda();
        
        if(request.getParameter("txtD24") != null && request.getParameter("txtD24") != "" )
            datalle24.setDiametro(Integer.parseInt(request.getParameter("txtD24")));  
        
        if(request.getParameter("txtF24") != null && request.getParameter("txtF24") != "" )
            datalle24.setFeminela(Integer.parseInt(request.getParameter("txtF24")));  
    
         entidad.getList().add(datalle24);
         
         entDetallePrePoda datalle25 = new entDetallePrePoda();
        
        if(request.getParameter("txtD25") != null && request.getParameter("txtD25") != "" )
            datalle25.setDiametro(Integer.parseInt(request.getParameter("txtD25")));  
        
        if(request.getParameter("txtF25") != null && request.getParameter("txtF25") != "" )
            datalle25.setFeminela(Integer.parseInt(request.getParameter("txtF25")));  
    
         entidad.getList().add(datalle25);
         
         entDetallePrePoda datalle26 = new entDetallePrePoda();
        
        if(request.getParameter("txtD26") != null && request.getParameter("txtD26") != "" )
            datalle26.setDiametro(Integer.parseInt(request.getParameter("txtD26")));  
        
        if(request.getParameter("txtF26") != null && request.getParameter("txtF26") != "" )
            datalle26.setFeminela(Integer.parseInt(request.getParameter("txtF26")));  
    
         entidad.getList().add(datalle26);
         
         entDetallePrePoda datalle27 = new entDetallePrePoda();
        
        if(request.getParameter("txtD27") != null && request.getParameter("txtD27") != "" )
            datalle27.setDiametro(Integer.parseInt(request.getParameter("txtD27")));  
        
        if(request.getParameter("txtF27") != null && request.getParameter("txtF27") != "" )
            datalle27.setFeminela(Integer.parseInt(request.getParameter("txtF27")));  
    
         entidad.getList().add(datalle27);
         
         entDetallePrePoda datalle28 = new entDetallePrePoda();
        
        if(request.getParameter("txtD28") != null && request.getParameter("txtD28") != "" )
            datalle28.setDiametro(Integer.parseInt(request.getParameter("txtD28")));  
        
        if(request.getParameter("txtF28") != null && request.getParameter("txtF28") != "" )
            datalle28.setFeminela(Integer.parseInt(request.getParameter("txtF28")));  
    
         entidad.getList().add(datalle28);
         
         entDetallePrePoda datalle29 = new entDetallePrePoda();
        
        if(request.getParameter("txtD29") != null && request.getParameter("txtD29") != "" )
            datalle29.setDiametro(Integer.parseInt(request.getParameter("txtD29")));  
        
        if(request.getParameter("txtF29") != null && request.getParameter("txtF29") != "" )
            datalle29.setFeminela(Integer.parseInt(request.getParameter("txtF29")));  
    
         entidad.getList().add(datalle29);
         
         entDetallePrePoda datalle30 = new entDetallePrePoda();
        
        if(request.getParameter("txtD30") != null && request.getParameter("txtD30") != "" )
            datalle30.setDiametro(Integer.parseInt(request.getParameter("txtD30")));  
        
        if(request.getParameter("txtF30") != null && request.getParameter("txtF30") != "" )
            datalle30.setFeminela(Integer.parseInt(request.getParameter("txtF30")));  
    
         entidad.getList().add(datalle30);
         
         entDetallePrePoda datalle31 = new entDetallePrePoda();
        
        if(request.getParameter("txtD31") != null && request.getParameter("txtD31") != "" )
            datalle31.setDiametro(Integer.parseInt(request.getParameter("txtD31")));  
        
        if(request.getParameter("txtF31") != null && request.getParameter("txtF31") != "" )
            datalle31.setFeminela(Integer.parseInt(request.getParameter("txtF31")));  
    
         entidad.getList().add(datalle31);
         
         entDetallePrePoda datalle32 = new entDetallePrePoda();
        
        if(request.getParameter("txtD32") != null && request.getParameter("txtD32") != "" )
            datalle32.setDiametro(Integer.parseInt(request.getParameter("txtD32")));  
        
        if(request.getParameter("txtF32") != null && request.getParameter("txtF32") != "" )
            datalle32.setFeminela(Integer.parseInt(request.getParameter("txtF32")));  
    
         entidad.getList().add(datalle32);
         
         entDetallePrePoda datalle33 = new entDetallePrePoda();
        
        if(request.getParameter("txtD33") != null && request.getParameter("txtD33") != "" )
            datalle33.setDiametro(Integer.parseInt(request.getParameter("txtD33")));  
        
        if(request.getParameter("txtF33") != null && request.getParameter("txtF33") != "" )
            datalle33.setFeminela(Integer.parseInt(request.getParameter("txtF33")));  
    
         entidad.getList().add(datalle33);
         
         entDetallePrePoda datalle34 = new entDetallePrePoda();
        
        if(request.getParameter("txtD34") != null && request.getParameter("txtD34") != "" )
            datalle34.setDiametro(Integer.parseInt(request.getParameter("txtD34")));  
        
        if(request.getParameter("txtF34") != null && request.getParameter("txtF34") != "" )
            datalle34.setFeminela(Integer.parseInt(request.getParameter("txtF34")));  
    
         entidad.getList().add(datalle34);
         
         entDetallePrePoda datalle35 = new entDetallePrePoda();
        
        if(request.getParameter("txtD35") != null && request.getParameter("txtD35") != "" )
            datalle35.setDiametro(Integer.parseInt(request.getParameter("txtD35")));  
        
        if(request.getParameter("txtF35") != null && request.getParameter("txtF35") != "" )
            datalle35.setFeminela(Integer.parseInt(request.getParameter("txtF35")));  
    
         entidad.getList().add(datalle35);
         
         entDetallePrePoda datalle36 = new entDetallePrePoda();
        
        if(request.getParameter("txtD36") != null && request.getParameter("txtD36") != "" )
            datalle36.setDiametro(Integer.parseInt(request.getParameter("txtD36")));  
        
        if(request.getParameter("txtF36") != null && request.getParameter("txtF36") != "" )
            datalle36.setFeminela(Integer.parseInt(request.getParameter("txtF36")));  
    
         entidad.getList().add(datalle36);
         
         entDetallePrePoda datalle37 = new entDetallePrePoda();
        
        if(request.getParameter("txtD37") != null && request.getParameter("txtD37") != "" )
            datalle37.setDiametro(Integer.parseInt(request.getParameter("txtD37")));  
        
        if(request.getParameter("txtF37") != null && request.getParameter("txtF37") != "" )
            datalle37.setFeminela(Integer.parseInt(request.getParameter("txtF37")));  
    
         entidad.getList().add(datalle37);
         
         entDetallePrePoda datalle38 = new entDetallePrePoda();
        
        if(request.getParameter("txtD38") != null && request.getParameter("txtD38") != "" )
            datalle38.setDiametro(Integer.parseInt(request.getParameter("txtD38")));  
        
        if(request.getParameter("txtF38") != null && request.getParameter("txtF38") != "" )
            datalle38.setFeminela(Integer.parseInt(request.getParameter("txtF38")));  
    
         entidad.getList().add(datalle38);
         
         entDetallePrePoda datalle39 = new entDetallePrePoda();
        
        if(request.getParameter("txtD39") != null && request.getParameter("txtD39") != "" )
            datalle39.setDiametro(Integer.parseInt(request.getParameter("txtD39")));  
        
        if(request.getParameter("txtF39") != null && request.getParameter("txtF39") != "" )
            datalle39.setFeminela(Integer.parseInt(request.getParameter("txtF39")));  
    
         entidad.getList().add(datalle39);
         
         entDetallePrePoda datalle40 = new entDetallePrePoda();
        
        if(request.getParameter("txtD40") != null && request.getParameter("txtD40") != "" )
            datalle40.setDiametro(Integer.parseInt(request.getParameter("txtD40")));  
        
        if(request.getParameter("txtF40") != null && request.getParameter("txtF40") != "" )
            datalle40.setFeminela(Integer.parseInt(request.getParameter("txtF40")));  
    
         entidad.getList().add(datalle40);
         
         entDetallePrePoda datalle41 = new entDetallePrePoda();
        
        if(request.getParameter("txtD41") != null && request.getParameter("txtD41") != "" )
            datalle41.setDiametro(Integer.parseInt(request.getParameter("txtD41")));  
        
        if(request.getParameter("txtF41") != null && request.getParameter("txtF41") != "" )
            datalle41.setFeminela(Integer.parseInt(request.getParameter("txtF41")));  
    
         entidad.getList().add(datalle41);
         
         entDetallePrePoda datalle42 = new entDetallePrePoda();
        
        if(request.getParameter("txtD42") != null && request.getParameter("txtD42") != "" )
            datalle42.setDiametro(Integer.parseInt(request.getParameter("txtD42")));  
        
        if(request.getParameter("txtF42") != null && request.getParameter("txtF42") != "" )
            datalle42.setFeminela(Integer.parseInt(request.getParameter("txtF42")));  
    
         entidad.getList().add(datalle42);
         
         entDetallePrePoda datalle43 = new entDetallePrePoda();
        
        if(request.getParameter("txtD43") != null && request.getParameter("txtD43") != "" )
            datalle43.setDiametro(Integer.parseInt(request.getParameter("txtD43")));  
        
        if(request.getParameter("txtF43") != null && request.getParameter("txtF43") != "" )
            datalle43.setFeminela(Integer.parseInt(request.getParameter("txtF43")));  
    
         entidad.getList().add(datalle43);
         
         entDetallePrePoda datalle44 = new entDetallePrePoda();
        
        if(request.getParameter("txtD44") != null && request.getParameter("txtD44") != "" )
            datalle44.setDiametro(Integer.parseInt(request.getParameter("txtD44")));  
        
        if(request.getParameter("txtF44") != null && request.getParameter("txtF44") != "" )
            datalle44.setFeminela(Integer.parseInt(request.getParameter("txtF44")));  
    
         entidad.getList().add(datalle44);
         
        if(pos>=0)
        {
            if(objSession.getObjPrePoda().getId_pre_poda()>0)
            {
                entidad.setSeleccion(true);
                entidad.setId_cabecera_pre_poda(objSession.getObjPrePoda().getList().get(pos).getId_cabecera_pre_poda());
            }
            
            objSession.getObjPrePoda().getList().remove(pos);
            objSession.getObjPrePoda().getList().add(pos, entidad);
        }
        else
        {
            objSession.getObjPrePoda().getList().add(entidad);
        }
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);

    }
}
%>