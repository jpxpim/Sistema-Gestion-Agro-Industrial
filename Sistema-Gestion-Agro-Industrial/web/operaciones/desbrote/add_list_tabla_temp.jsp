

<%@page import="Entidades.entDetalleDesbrote"%>
<%@page import="Entidades.entCabeceraDesbrote"%>
<%@page import="Entidades.entDesbrote"%>
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
        if(objSession.getObjDesbrote()==null)
        {
            objSession.setObjDesbrote(new entDesbrote());
            if(objSession.getObjDesbrote().getList()==null)
                objSession.getObjDesbrote().setList(new ArrayList<entCabeceraDesbrote>());
        }
        
        
        entCabeceraDesbrote entidad=new entCabeceraDesbrote();
        

        
        entidad.setNum_salida_planta(Integer.parseInt(request.getParameter("txtNSP")));
        entidad.setNum_planta(Integer.parseInt(request.getParameter("txtNP")));
        entidad.setNum_hilera(Integer.parseInt(request.getParameter("txtNH")));
        entidad.setNum_cargador_planta(Integer.parseInt(request.getParameter("txtNCP")));
        
        entidad.setList(new ArrayList<entDetalleDesbrote>());
        
        
        entDetalleDesbrote datalle0 = new entDetalleDesbrote();
        
        if(request.getParameter("txt0N1") != null && request.getParameter("txt0N1") != "" &&
            request.getParameter("txt0N6") != null && request.getParameter("txt0N6") != "")
        {
            datalle0.setNum_1(Integer.parseInt(request.getParameter("txt0N1")));  
            datalle0.setNum_6(Integer.parseInt(request.getParameter("txt0N6")));
            if(datalle0.getNum_1()==datalle0.getNum_6())
                datalle0.setNum_11(1);
            else
                datalle0.setNum_11(0);
        }
        else
        {
            datalle0.setNum_1(-1);  
            datalle0.setNum_6(-1);
            datalle0.setNum_11(-1);            
        }
        
        if(request.getParameter("txt0N2") != null && request.getParameter("txt0N2") != "" &&
            request.getParameter("txt0N7") != null && request.getParameter("txt0N7") != "")
        {
            datalle0.setNum_2(Integer.parseInt(request.getParameter("txt0N2")));  
            datalle0.setNum_7(Integer.parseInt(request.getParameter("txt0N7")));
            if(datalle0.getNum_2()==datalle0.getNum_7())
                datalle0.setNum_12(1);
            else
                datalle0.setNum_12(0);
        }
        else
        {
            datalle0.setNum_2(-1);  
            datalle0.setNum_7(-1);
            datalle0.setNum_12(-1);            
        }
        
        if(request.getParameter("txt0N3") != null && request.getParameter("txt0N3") != "" &&
            request.getParameter("txt0N8") != null && request.getParameter("txt0N8") != "")
        {
            datalle0.setNum_3(Integer.parseInt(request.getParameter("txt0N3")));  
            datalle0.setNum_8(Integer.parseInt(request.getParameter("txt0N8")));
            if(datalle0.getNum_3()==datalle0.getNum_8())
                datalle0.setNum_13(1);
            else
                datalle0.setNum_13(0);
        }
        else
        {
            datalle0.setNum_3(-1);  
            datalle0.setNum_8(-1);
            datalle0.setNum_13(-1);            
        }
        
        if(request.getParameter("txt0N4") != null && request.getParameter("txt0N4") != "" &&
            request.getParameter("txt0N9") != null && request.getParameter("txt0N9") != "")
        {
            datalle0.setNum_4(Integer.parseInt(request.getParameter("txt0N4")));  
            datalle0.setNum_9(Integer.parseInt(request.getParameter("txt0N9")));
            if(datalle0.getNum_4()==datalle0.getNum_9())
                datalle0.setNum_14(1);
            else
                datalle0.setNum_14(0);
        }
        else
        {
            datalle0.setNum_4(-1);  
            datalle0.setNum_9(-1);
            datalle0.setNum_14(-1);            
        }
        
        if(request.getParameter("txt0N5") != null && request.getParameter("txt0N5") != "" &&
            request.getParameter("txt0N10") != null && request.getParameter("txt0N10") != "")
        {
            datalle0.setNum_5(Integer.parseInt(request.getParameter("txt0N5")));  
            datalle0.setNum_10(Integer.parseInt(request.getParameter("txt0N10")));
            if(datalle0.getNum_5()==datalle0.getNum_10())
                datalle0.setNum_15(1);
            else
                datalle0.setNum_15(0);
        }
        else
        {
            datalle0.setNum_5(-1);  
            datalle0.setNum_10(-1);
            datalle0.setNum_15(-1);            
        }        
        
        entidad.getList().add(datalle0);
         
        entDetalleDesbrote datalle1 = new entDetalleDesbrote();
        if(request.getParameter("txt1N1") != null && request.getParameter("txt1N1") != "" &&
            request.getParameter("txt1N6") != null && request.getParameter("txt1N6") != "")
        {
            datalle1.setNum_1(Integer.parseInt(request.getParameter("txt1N1")));  
            datalle1.setNum_6(Integer.parseInt(request.getParameter("txt1N6")));
            if(datalle1.getNum_1()==datalle1.getNum_6())
                datalle1.setNum_11(1);
            else
                datalle1.setNum_11(0);
        }
        else
        {
            datalle1.setNum_1(-1);  
            datalle1.setNum_6(-1);
            datalle1.setNum_11(-1);            
        }
        
        if(request.getParameter("txt1N2") != null && request.getParameter("txt1N2") != "" &&
            request.getParameter("txt1N7") != null && request.getParameter("txt1N7") != "")
        {
            datalle1.setNum_2(Integer.parseInt(request.getParameter("txt1N2")));  
            datalle1.setNum_7(Integer.parseInt(request.getParameter("txt1N7")));
            if(datalle1.getNum_2()==datalle1.getNum_7())
                datalle1.setNum_12(1);
            else
                datalle1.setNum_12(0);
        }
        else
        {
            datalle1.setNum_2(-1);  
            datalle1.setNum_7(-1);
            datalle1.setNum_12(-1);            
        }
        
        if(request.getParameter("txt1N3") != null && request.getParameter("txt1N3") != "" &&
            request.getParameter("txt1N8") != null && request.getParameter("txt1N8") != "")
        {
            datalle1.setNum_3(Integer.parseInt(request.getParameter("txt1N3")));  
            datalle1.setNum_8(Integer.parseInt(request.getParameter("txt1N8")));
            if(datalle1.getNum_3()==datalle1.getNum_8())
                datalle1.setNum_13(1);
            else
                datalle1.setNum_13(0);
        }
        else
        {
            datalle1.setNum_3(-1);  
            datalle1.setNum_8(-1);
            datalle1.setNum_13(-1);            
        }
        
        if(request.getParameter("txt1N4") != null && request.getParameter("txt1N4") != "" &&
            request.getParameter("txt1N9") != null && request.getParameter("txt1N9") != "")
        {
            datalle1.setNum_4(Integer.parseInt(request.getParameter("txt1N4")));  
            datalle1.setNum_9(Integer.parseInt(request.getParameter("txt1N9")));
            if(datalle1.getNum_4()==datalle1.getNum_9())
                datalle1.setNum_14(1);
            else
                datalle1.setNum_14(0);
        }
        else
        {
            datalle1.setNum_4(-1);  
            datalle1.setNum_9(-1);
            datalle1.setNum_14(-1);            
        }
        
        if(request.getParameter("txt1N5") != null && request.getParameter("txt1N5") != "" &&
            request.getParameter("txt1N10") != null && request.getParameter("txt1N10") != "")
        {
            datalle1.setNum_5(Integer.parseInt(request.getParameter("txt1N5")));  
            datalle1.setNum_10(Integer.parseInt(request.getParameter("txt1N10")));
            if(datalle1.getNum_5()==datalle1.getNum_10())
                datalle1.setNum_15(1);
            else
                datalle1.setNum_15(0);
        }
        else
        {
            datalle1.setNum_5(-1);  
            datalle1.setNum_10(-1);
            datalle1.setNum_15(-1);            
        } 

        
         entidad.getList().add(datalle1);
         
         entDetalleDesbrote datalle2 = new entDetalleDesbrote();
        if(request.getParameter("txt2N1") != null && request.getParameter("txt2N1") != "" &&
            request.getParameter("txt2N6") != null && request.getParameter("txt2N6") != "")
        {
            datalle2.setNum_1(Integer.parseInt(request.getParameter("txt2N1")));  
            datalle2.setNum_6(Integer.parseInt(request.getParameter("txt2N6")));
            if(datalle2.getNum_1()==datalle2.getNum_6())
                datalle2.setNum_11(1);
            else
                datalle2.setNum_11(0);
        }
        else
        {
            datalle2.setNum_1(-1);  
            datalle2.setNum_6(-1);
            datalle2.setNum_11(-1);            
        }
        
        if(request.getParameter("txt2N2") != null && request.getParameter("txt2N2") != "" &&
            request.getParameter("txt2N7") != null && request.getParameter("txt2N7") != "")
        {
            datalle2.setNum_2(Integer.parseInt(request.getParameter("txt2N2")));  
            datalle2.setNum_7(Integer.parseInt(request.getParameter("txt2N7")));
            if(datalle2.getNum_2()==datalle2.getNum_7())
                datalle2.setNum_12(1);
            else
                datalle2.setNum_12(0);
        }
        else
        {
            datalle2.setNum_2(-1);  
            datalle2.setNum_7(-1);
            datalle2.setNum_12(-1);            
        }
        
        if(request.getParameter("txt2N3") != null && request.getParameter("txt2N3") != "" &&
            request.getParameter("txt2N8") != null && request.getParameter("txt2N8") != "")
        {
            datalle2.setNum_3(Integer.parseInt(request.getParameter("txt2N3")));  
            datalle2.setNum_8(Integer.parseInt(request.getParameter("txt2N8")));
            if(datalle2.getNum_3()==datalle2.getNum_8())
                datalle2.setNum_13(1);
            else
                datalle2.setNum_13(0);
        }
        else
        {
            datalle2.setNum_3(-1);  
            datalle2.setNum_8(-1);
            datalle2.setNum_13(-1);            
        }
        
        if(request.getParameter("txt2N4") != null && request.getParameter("txt2N4") != "" &&
            request.getParameter("txt2N9") != null && request.getParameter("txt2N9") != "")
        {
            datalle2.setNum_4(Integer.parseInt(request.getParameter("txt2N4")));  
            datalle2.setNum_9(Integer.parseInt(request.getParameter("txt2N9")));
            if(datalle2.getNum_4()==datalle2.getNum_9())
                datalle2.setNum_14(1);
            else
                datalle2.setNum_14(0);
        }
        else
        {
            datalle2.setNum_4(-1);  
            datalle2.setNum_9(-1);
            datalle2.setNum_14(-1);            
        }
        
        if(request.getParameter("txt2N5") != null && request.getParameter("txt2N5") != "" &&
            request.getParameter("txt2N10") != null && request.getParameter("txt2N10") != "")
        {
            datalle2.setNum_5(Integer.parseInt(request.getParameter("txt2N5")));  
            datalle2.setNum_10(Integer.parseInt(request.getParameter("txt2N10")));
            if(datalle2.getNum_5()==datalle2.getNum_10())
                datalle2.setNum_15(1);
            else
                datalle2.setNum_15(0);
        }
        else
        {
            datalle2.setNum_5(-1);  
            datalle2.setNum_10(-1);
            datalle2.setNum_15(-1);            
        } 

        
        
         entidad.getList().add(datalle2);
         
         entDetalleDesbrote datalle3 = new entDetalleDesbrote();
        if(request.getParameter("txt3N1") != null && request.getParameter("txt3N1") != "" &&
            request.getParameter("txt3N6") != null && request.getParameter("txt3N6") != "")
        {
            datalle3.setNum_1(Integer.parseInt(request.getParameter("txt3N1")));  
            datalle3.setNum_6(Integer.parseInt(request.getParameter("txt3N6")));
            if(datalle3.getNum_1()==datalle3.getNum_6())
                datalle3.setNum_11(1);
            else
                datalle3.setNum_11(0);
        }
        else
        {
            datalle3.setNum_1(-1);  
            datalle3.setNum_6(-1);
            datalle3.setNum_11(-1);            
        }
        
        if(request.getParameter("txt3N2") != null && request.getParameter("txt3N2") != "" &&
            request.getParameter("txt3N7") != null && request.getParameter("txt3N7") != "")
        {
            datalle3.setNum_2(Integer.parseInt(request.getParameter("txt3N2")));  
            datalle3.setNum_7(Integer.parseInt(request.getParameter("txt3N7")));
            if(datalle3.getNum_2()==datalle3.getNum_7())
                datalle3.setNum_12(1);
            else
                datalle3.setNum_12(0);
        }
        else
        {
            datalle3.setNum_2(-1);  
            datalle3.setNum_7(-1);
            datalle3.setNum_12(-1);            
        }
        
        if(request.getParameter("txt3N3") != null && request.getParameter("txt3N3") != "" &&
            request.getParameter("txt3N8") != null && request.getParameter("txt3N8") != "")
        {
            datalle3.setNum_3(Integer.parseInt(request.getParameter("txt3N3")));  
            datalle3.setNum_8(Integer.parseInt(request.getParameter("txt3N8")));
            if(datalle3.getNum_3()==datalle3.getNum_8())
                datalle3.setNum_13(1);
            else
                datalle3.setNum_13(0);
        }
        else
        {
            datalle3.setNum_3(-1);  
            datalle3.setNum_8(-1);
            datalle3.setNum_13(-1);            
        }
        
        if(request.getParameter("txt3N4") != null && request.getParameter("txt3N4") != "" &&
            request.getParameter("txt3N9") != null && request.getParameter("txt3N9") != "")
        {
            datalle3.setNum_4(Integer.parseInt(request.getParameter("txt3N4")));  
            datalle3.setNum_9(Integer.parseInt(request.getParameter("txt3N9")));
            if(datalle3.getNum_4()==datalle3.getNum_9())
                datalle3.setNum_14(1);
            else
                datalle3.setNum_14(0);
        }
        else
        {
            datalle3.setNum_4(-1);  
            datalle3.setNum_9(-1);
            datalle3.setNum_14(-1);            
        }
        
        if(request.getParameter("txt3N5") != null && request.getParameter("txt3N5") != "" &&
            request.getParameter("txt3N10") != null && request.getParameter("txt3N10") != "")
        {
            datalle3.setNum_5(Integer.parseInt(request.getParameter("txt3N5")));  
            datalle3.setNum_10(Integer.parseInt(request.getParameter("txt3N10")));
            if(datalle3.getNum_5()==datalle3.getNum_10())
                datalle3.setNum_15(1);
            else
                datalle3.setNum_15(0);
        }
        else
        {
            datalle3.setNum_5(-1);  
            datalle3.setNum_10(-1);
            datalle3.setNum_15(-1);            
        } 
        
        
        
         entidad.getList().add(datalle3);
         
         entDetalleDesbrote datalle4 = new entDetalleDesbrote();
        if(request.getParameter("txt4N1") != null && request.getParameter("txt4N1") != "" &&
            request.getParameter("txt4N6") != null && request.getParameter("txt4N6") != "")
        {
            datalle4.setNum_1(Integer.parseInt(request.getParameter("txt4N1")));  
            datalle4.setNum_6(Integer.parseInt(request.getParameter("txt4N6")));
            if(datalle4.getNum_1()==datalle4.getNum_6())
                datalle4.setNum_11(1);
            else
                datalle4.setNum_11(0);
        }
        else
        {
            datalle4.setNum_1(-1);  
            datalle4.setNum_6(-1);
            datalle4.setNum_11(-1);            
        }
        
        if(request.getParameter("txt4N2") != null && request.getParameter("txt4N2") != "" &&
            request.getParameter("txt4N7") != null && request.getParameter("txt4N7") != "")
        {
            datalle4.setNum_2(Integer.parseInt(request.getParameter("txt4N2")));  
            datalle4.setNum_7(Integer.parseInt(request.getParameter("txt4N7")));
            if(datalle4.getNum_2()==datalle4.getNum_7())
                datalle4.setNum_12(1);
            else
                datalle4.setNum_12(0);
        }
        else
        {
            datalle4.setNum_2(-1);  
            datalle4.setNum_7(-1);
            datalle4.setNum_12(-1);            
        }
        
        if(request.getParameter("txt4N3") != null && request.getParameter("txt4N3") != "" &&
            request.getParameter("txt4N8") != null && request.getParameter("txt4N8") != "")
        {
            datalle4.setNum_3(Integer.parseInt(request.getParameter("txt4N3")));  
            datalle4.setNum_8(Integer.parseInt(request.getParameter("txt4N8")));
            if(datalle4.getNum_3()==datalle4.getNum_8())
                datalle4.setNum_13(1);
            else
                datalle4.setNum_13(0);
        }
        else
        {
            datalle4.setNum_3(-1);  
            datalle4.setNum_8(-1);
            datalle4.setNum_13(-1);            
        }
        
        if(request.getParameter("txt4N4") != null && request.getParameter("txt4N4") != "" &&
            request.getParameter("txt4N9") != null && request.getParameter("txt4N9") != "")
        {
            datalle4.setNum_4(Integer.parseInt(request.getParameter("txt4N4")));  
            datalle4.setNum_9(Integer.parseInt(request.getParameter("txt4N9")));
            if(datalle4.getNum_4()==datalle4.getNum_9())
                datalle4.setNum_14(1);
            else
                datalle4.setNum_14(0);
        }
        else
        {
            datalle4.setNum_4(-1);  
            datalle4.setNum_9(-1);
            datalle4.setNum_14(-1);            
        }
        
        if(request.getParameter("txt4N5") != null && request.getParameter("txt4N5") != "" &&
            request.getParameter("txt4N10") != null && request.getParameter("txt4N10") != "")
        {
            datalle4.setNum_5(Integer.parseInt(request.getParameter("txt4N5")));  
            datalle4.setNum_10(Integer.parseInt(request.getParameter("txt4N10")));
            if(datalle4.getNum_5()==datalle4.getNum_10())
                datalle4.setNum_15(1);
            else
                datalle4.setNum_15(0);
        }
        else
        {
            datalle4.setNum_5(-1);  
            datalle4.setNum_10(-1);
            datalle4.setNum_15(-1);            
        } 
        
        
        
         entidad.getList().add(datalle4);
         
        entDetalleDesbrote datalle5 = new entDetalleDesbrote();
        	if(request.getParameter("txt5N1") != null && request.getParameter("txt5N1") != "" &&
            request.getParameter("txt5N6") != null && request.getParameter("txt5N6") != "")
        {
            datalle5.setNum_1(Integer.parseInt(request.getParameter("txt5N1")));  
            datalle5.setNum_6(Integer.parseInt(request.getParameter("txt5N6")));
            if(datalle5.getNum_1()==datalle5.getNum_6())
                datalle5.setNum_11(1);
            else
                datalle5.setNum_11(0);
        }
        else
        {
            datalle5.setNum_1(-1);  
            datalle5.setNum_6(-1);
            datalle5.setNum_11(-1);            
        }
        
        if(request.getParameter("txt5N2") != null && request.getParameter("txt5N2") != "" &&
            request.getParameter("txt5N7") != null && request.getParameter("txt5N7") != "")
        {
            datalle5.setNum_2(Integer.parseInt(request.getParameter("txt5N2")));  
            datalle5.setNum_7(Integer.parseInt(request.getParameter("txt5N7")));
            if(datalle5.getNum_2()==datalle5.getNum_7())
                datalle5.setNum_12(1);
            else
                datalle5.setNum_12(0);
        }
        else
        {
            datalle5.setNum_2(-1);  
            datalle5.setNum_7(-1);
            datalle5.setNum_12(-1);            
        }
        
        if(request.getParameter("txt5N3") != null && request.getParameter("txt5N3") != "" &&
            request.getParameter("txt5N8") != null && request.getParameter("txt5N8") != "")
        {
            datalle5.setNum_3(Integer.parseInt(request.getParameter("txt5N3")));  
            datalle5.setNum_8(Integer.parseInt(request.getParameter("txt5N8")));
            if(datalle5.getNum_3()==datalle5.getNum_8())
                datalle5.setNum_13(1);
            else
                datalle5.setNum_13(0);
        }
        else
        {
            datalle5.setNum_3(-1);  
            datalle5.setNum_8(-1);
            datalle5.setNum_13(-1);            
        }
        
        if(request.getParameter("txt5N4") != null && request.getParameter("txt5N4") != "" &&
            request.getParameter("txt5N9") != null && request.getParameter("txt5N9") != "")
        {
            datalle5.setNum_4(Integer.parseInt(request.getParameter("txt5N4")));  
            datalle5.setNum_9(Integer.parseInt(request.getParameter("txt5N9")));
            if(datalle5.getNum_4()==datalle5.getNum_9())
                datalle5.setNum_14(1);
            else
                datalle5.setNum_14(0);
        }
        else
        {
            datalle5.setNum_4(-1);  
            datalle5.setNum_9(-1);
            datalle5.setNum_14(-1);            
        }
        
        if(request.getParameter("txt5N5") != null && request.getParameter("txt5N5") != "" &&
            request.getParameter("txt5N10") != null && request.getParameter("txt5N10") != "")
        {
            datalle5.setNum_5(Integer.parseInt(request.getParameter("txt5N5")));  
            datalle5.setNum_10(Integer.parseInt(request.getParameter("txt5N10")));
            if(datalle5.getNum_5()==datalle5.getNum_10())
                datalle5.setNum_15(1);
            else
                datalle5.setNum_15(0);
        }
        else
        {
            datalle5.setNum_5(-1);  
            datalle5.setNum_10(-1);
            datalle5.setNum_15(-1);            
        } 
        
        
        
         entidad.getList().add(datalle5);
         
         entDetalleDesbrote datalle6 = new entDetalleDesbrote();
        if(request.getParameter("txt6N1") != null && request.getParameter("txt6N1") != "" &&
            request.getParameter("txt6N6") != null && request.getParameter("txt6N6") != "")
        {
            datalle6.setNum_1(Integer.parseInt(request.getParameter("txt6N1")));  
            datalle6.setNum_6(Integer.parseInt(request.getParameter("txt6N6")));
            if(datalle6.getNum_1()==datalle6.getNum_6())
                datalle6.setNum_11(1);
            else
                datalle6.setNum_11(0);
        }
        else
        {
            datalle6.setNum_1(-1);  
            datalle6.setNum_6(-1);
            datalle6.setNum_11(-1);            
        }
        
        if(request.getParameter("txt6N2") != null && request.getParameter("txt6N2") != "" &&
            request.getParameter("txt6N7") != null && request.getParameter("txt6N7") != "")
        {
            datalle6.setNum_2(Integer.parseInt(request.getParameter("txt6N2")));  
            datalle6.setNum_7(Integer.parseInt(request.getParameter("txt6N7")));
            if(datalle6.getNum_2()==datalle6.getNum_7())
                datalle6.setNum_12(1);
            else
                datalle6.setNum_12(0);
        }
        else
        {
            datalle6.setNum_2(-1);  
            datalle6.setNum_7(-1);
            datalle6.setNum_12(-1);            
        }
        
        if(request.getParameter("txt6N3") != null && request.getParameter("txt6N3") != "" &&
            request.getParameter("txt6N8") != null && request.getParameter("txt6N8") != "")
        {
            datalle6.setNum_3(Integer.parseInt(request.getParameter("txt6N3")));  
            datalle6.setNum_8(Integer.parseInt(request.getParameter("txt6N8")));
            if(datalle6.getNum_3()==datalle6.getNum_8())
                datalle6.setNum_13(1);
            else
                datalle6.setNum_13(0);
        }
        else
        {
            datalle6.setNum_3(-1);  
            datalle6.setNum_8(-1);
            datalle6.setNum_13(-1);            
        }
        
        if(request.getParameter("txt6N4") != null && request.getParameter("txt6N4") != "" &&
            request.getParameter("txt6N9") != null && request.getParameter("txt6N9") != "")
        {
            datalle6.setNum_4(Integer.parseInt(request.getParameter("txt6N4")));  
            datalle6.setNum_9(Integer.parseInt(request.getParameter("txt6N9")));
            if(datalle6.getNum_4()==datalle6.getNum_9())
                datalle6.setNum_14(1);
            else
                datalle6.setNum_14(0);
        }
        else
        {
            datalle6.setNum_4(-1);  
            datalle6.setNum_9(-1);
            datalle6.setNum_14(-1);            
        }
        
        if(request.getParameter("txt6N5") != null && request.getParameter("txt6N5") != "" &&
            request.getParameter("txt6N10") != null && request.getParameter("txt6N10") != "")
        {
            datalle6.setNum_5(Integer.parseInt(request.getParameter("txt6N5")));  
            datalle6.setNum_10(Integer.parseInt(request.getParameter("txt6N10")));
            if(datalle6.getNum_5()==datalle6.getNum_10())
                datalle6.setNum_15(1);
            else
                datalle6.setNum_15(0);
        }
        else
        {
            datalle6.setNum_5(-1);  
            datalle6.setNum_10(-1);
            datalle6.setNum_15(-1);            
        } 
        
        
        
         entidad.getList().add(datalle6);
         
         entDetalleDesbrote datalle7 = new entDetalleDesbrote();
        if(request.getParameter("txt7N1") != null && request.getParameter("txt7N1") != "" &&
            request.getParameter("txt7N6") != null && request.getParameter("txt7N6") != "")
        {
            datalle7.setNum_1(Integer.parseInt(request.getParameter("txt7N1")));  
            datalle7.setNum_6(Integer.parseInt(request.getParameter("txt7N6")));
            if(datalle7.getNum_1()==datalle7.getNum_6())
                datalle7.setNum_11(1);
            else
                datalle7.setNum_11(0);
        }
        else
        {
            datalle7.setNum_1(-1);  
            datalle7.setNum_6(-1);
            datalle7.setNum_11(-1);            
        }
        
        if(request.getParameter("txt7N2") != null && request.getParameter("txt7N2") != "" &&
            request.getParameter("txt7N7") != null && request.getParameter("txt7N7") != "")
        {
            datalle7.setNum_2(Integer.parseInt(request.getParameter("txt7N2")));  
            datalle7.setNum_7(Integer.parseInt(request.getParameter("txt7N7")));
            if(datalle7.getNum_2()==datalle7.getNum_7())
                datalle7.setNum_12(1);
            else
                datalle7.setNum_12(0);
        }
        else
        {
            datalle7.setNum_2(-1);  
            datalle7.setNum_7(-1);
            datalle7.setNum_12(-1);            
        }
        
        if(request.getParameter("txt7N3") != null && request.getParameter("txt7N3") != "" &&
            request.getParameter("txt7N8") != null && request.getParameter("txt7N8") != "")
        {
            datalle7.setNum_3(Integer.parseInt(request.getParameter("txt7N3")));  
            datalle7.setNum_8(Integer.parseInt(request.getParameter("txt7N8")));
            if(datalle7.getNum_3()==datalle7.getNum_8())
                datalle7.setNum_13(1);
            else
                datalle7.setNum_13(0);
        }
        else
        {
            datalle7.setNum_3(-1);  
            datalle7.setNum_8(-1);
            datalle7.setNum_13(-1);            
        }
        
        if(request.getParameter("txt7N4") != null && request.getParameter("txt7N4") != "" &&
            request.getParameter("txt7N9") != null && request.getParameter("txt7N9") != "")
        {
            datalle7.setNum_4(Integer.parseInt(request.getParameter("txt7N4")));  
            datalle7.setNum_9(Integer.parseInt(request.getParameter("txt7N9")));
            if(datalle7.getNum_4()==datalle7.getNum_9())
                datalle7.setNum_14(1);
            else
                datalle7.setNum_14(0);
        }
        else
        {
            datalle7.setNum_4(-1);  
            datalle7.setNum_9(-1);
            datalle7.setNum_14(-1);            
        }
        
        if(request.getParameter("txt7N5") != null && request.getParameter("txt7N5") != "" &&
            request.getParameter("txt7N10") != null && request.getParameter("txt7N10") != "")
        {
            datalle7.setNum_5(Integer.parseInt(request.getParameter("txt7N5")));  
            datalle7.setNum_10(Integer.parseInt(request.getParameter("txt7N10")));
            if(datalle7.getNum_5()==datalle7.getNum_10())
                datalle7.setNum_15(1);
            else
                datalle7.setNum_15(0);
        }
        else
        {
            datalle7.setNum_5(-1);  
            datalle7.setNum_10(-1);
            datalle7.setNum_15(-1);            
        } 

        
         entidad.getList().add(datalle7);
         
         entDetalleDesbrote datalle8 = new entDetalleDesbrote();
        if(request.getParameter("txt8N1") != null && request.getParameter("txt8N1") != "" &&
            request.getParameter("txt8N6") != null && request.getParameter("txt8N6") != "")
        {
            datalle8.setNum_1(Integer.parseInt(request.getParameter("txt8N1")));  
            datalle8.setNum_6(Integer.parseInt(request.getParameter("txt8N6")));
            if(datalle8.getNum_1()==datalle8.getNum_6())
                datalle8.setNum_11(1);
            else
                datalle8.setNum_11(0);
        }
        else
        {
            datalle8.setNum_1(-1);  
            datalle8.setNum_6(-1);
            datalle8.setNum_11(-1);            
        }
        
        if(request.getParameter("txt8N2") != null && request.getParameter("txt8N2") != "" &&
            request.getParameter("txt8N7") != null && request.getParameter("txt8N7") != "")
        {
            datalle8.setNum_2(Integer.parseInt(request.getParameter("txt8N2")));  
            datalle8.setNum_7(Integer.parseInt(request.getParameter("txt8N7")));
            if(datalle8.getNum_2()==datalle8.getNum_7())
                datalle8.setNum_12(1);
            else
                datalle8.setNum_12(0);
        }
        else
        {
            datalle8.setNum_2(-1);  
            datalle8.setNum_7(-1);
            datalle8.setNum_12(-1);            
        }
        
        if(request.getParameter("txt8N3") != null && request.getParameter("txt8N3") != "" &&
            request.getParameter("txt8N8") != null && request.getParameter("txt8N8") != "")
        {
            datalle8.setNum_3(Integer.parseInt(request.getParameter("txt8N3")));  
            datalle8.setNum_8(Integer.parseInt(request.getParameter("txt8N8")));
            if(datalle8.getNum_3()==datalle8.getNum_8())
                datalle8.setNum_13(1);
            else
                datalle8.setNum_13(0);
        }
        else
        {
            datalle8.setNum_3(-1);  
            datalle8.setNum_8(-1);
            datalle8.setNum_13(-1);            
        }
        
        if(request.getParameter("txt8N4") != null && request.getParameter("txt8N4") != "" &&
            request.getParameter("txt8N9") != null && request.getParameter("txt8N9") != "")
        {
            datalle8.setNum_4(Integer.parseInt(request.getParameter("txt8N4")));  
            datalle8.setNum_9(Integer.parseInt(request.getParameter("txt8N9")));
            if(datalle8.getNum_4()==datalle8.getNum_9())
                datalle8.setNum_14(1);
            else
                datalle8.setNum_14(0);
        }
        else
        {
            datalle8.setNum_4(-1);  
            datalle8.setNum_9(-1);
            datalle8.setNum_14(-1);            
        }
        
        if(request.getParameter("txt8N5") != null && request.getParameter("txt8N5") != "" &&
            request.getParameter("txt8N10") != null && request.getParameter("txt8N10") != "")
        {
            datalle8.setNum_5(Integer.parseInt(request.getParameter("txt8N5")));  
            datalle8.setNum_10(Integer.parseInt(request.getParameter("txt8N10")));
            if(datalle8.getNum_5()==datalle8.getNum_10())
                datalle8.setNum_15(1);
            else
                datalle8.setNum_15(0);
        }
        else
        {
            datalle8.setNum_5(-1);  
            datalle8.setNum_10(-1);
            datalle8.setNum_15(-1);            
        } 
        
        
         entidad.getList().add(datalle8);
         
         entDetalleDesbrote datalle9 = new entDetalleDesbrote();
        if(request.getParameter("txt9N1") != null && request.getParameter("txt9N1") != "" &&
            request.getParameter("txt9N6") != null && request.getParameter("txt9N6") != "")
        {
            datalle9.setNum_1(Integer.parseInt(request.getParameter("txt9N1")));  
            datalle9.setNum_6(Integer.parseInt(request.getParameter("txt9N6")));
            if(datalle9.getNum_1()==datalle9.getNum_6())
                datalle9.setNum_11(1);
            else
                datalle9.setNum_11(0);
        }
        else
        {
            datalle9.setNum_1(-1);  
            datalle9.setNum_6(-1);
            datalle9.setNum_11(-1);            
        }
        
        if(request.getParameter("txt9N2") != null && request.getParameter("txt9N2") != "" &&
            request.getParameter("txt9N7") != null && request.getParameter("txt9N7") != "")
        {
            datalle9.setNum_2(Integer.parseInt(request.getParameter("txt9N2")));  
            datalle9.setNum_7(Integer.parseInt(request.getParameter("txt9N7")));
            if(datalle9.getNum_2()==datalle9.getNum_7())
                datalle9.setNum_12(1);
            else
                datalle9.setNum_12(0);
        }
        else
        {
            datalle9.setNum_2(-1);  
            datalle9.setNum_7(-1);
            datalle9.setNum_12(-1);            
        }
        
        if(request.getParameter("txt9N3") != null && request.getParameter("txt9N3") != "" &&
            request.getParameter("txt9N8") != null && request.getParameter("txt9N8") != "")
        {
            datalle9.setNum_3(Integer.parseInt(request.getParameter("txt9N3")));  
            datalle9.setNum_8(Integer.parseInt(request.getParameter("txt9N8")));
            if(datalle9.getNum_3()==datalle9.getNum_8())
                datalle9.setNum_13(1);
            else
                datalle9.setNum_13(0);
        }
        else
        {
            datalle9.setNum_3(-1);  
            datalle9.setNum_8(-1);
            datalle9.setNum_13(-1);            
        }
        
        if(request.getParameter("txt9N4") != null && request.getParameter("txt9N4") != "" &&
            request.getParameter("txt9N9") != null && request.getParameter("txt9N9") != "")
        {
            datalle9.setNum_4(Integer.parseInt(request.getParameter("txt9N4")));  
            datalle9.setNum_9(Integer.parseInt(request.getParameter("txt9N9")));
            if(datalle9.getNum_4()==datalle9.getNum_9())
                datalle9.setNum_14(1);
            else
                datalle9.setNum_14(0);
        }
        else
        {
            datalle9.setNum_4(-1);  
            datalle9.setNum_9(-1);
            datalle9.setNum_14(-1);            
        }
        
        if(request.getParameter("txt9N5") != null && request.getParameter("txt9N5") != "" &&
            request.getParameter("txt9N10") != null && request.getParameter("txt9N10") != "")
        {
            datalle9.setNum_5(Integer.parseInt(request.getParameter("txt9N5")));  
            datalle9.setNum_10(Integer.parseInt(request.getParameter("txt9N10")));
            if(datalle9.getNum_5()==datalle9.getNum_10())
                datalle9.setNum_15(1);
            else
                datalle9.setNum_15(0);
        }
        else
        {
            datalle9.setNum_5(-1);  
            datalle9.setNum_10(-1);
            datalle9.setNum_15(-1);            
        } 
        
        
         entidad.getList().add(datalle9);
         
         entDetalleDesbrote datalle10 = new entDetalleDesbrote();
        if(request.getParameter("txt10N1") != null && request.getParameter("txt10N1") != "" &&
            request.getParameter("txt10N6") != null && request.getParameter("txt10N6") != "")
        {
            datalle10.setNum_1(Integer.parseInt(request.getParameter("txt10N1")));  
            datalle10.setNum_6(Integer.parseInt(request.getParameter("txt10N6")));
            if(datalle10.getNum_1()==datalle10.getNum_6())
                datalle10.setNum_11(1);
            else
                datalle10.setNum_11(0);
        }
        else
        {
            datalle10.setNum_1(-1);  
            datalle10.setNum_6(-1);
            datalle10.setNum_11(-1);            
        }
        
        if(request.getParameter("txt10N2") != null && request.getParameter("txt10N2") != "" &&
            request.getParameter("txt10N7") != null && request.getParameter("txt10N7") != "")
        {
            datalle10.setNum_2(Integer.parseInt(request.getParameter("txt10N2")));  
            datalle10.setNum_7(Integer.parseInt(request.getParameter("txt10N7")));
            if(datalle10.getNum_2()==datalle10.getNum_7())
                datalle10.setNum_12(1);
            else
                datalle10.setNum_12(0);
        }
        else
        {
            datalle10.setNum_2(-1);  
            datalle10.setNum_7(-1);
            datalle10.setNum_12(-1);            
        }
        
        if(request.getParameter("txt10N3") != null && request.getParameter("txt10N3") != "" &&
            request.getParameter("txt10N8") != null && request.getParameter("txt10N8") != "")
        {
            datalle10.setNum_3(Integer.parseInt(request.getParameter("txt10N3")));  
            datalle10.setNum_8(Integer.parseInt(request.getParameter("txt10N8")));
            if(datalle10.getNum_3()==datalle10.getNum_8())
                datalle10.setNum_13(1);
            else
                datalle10.setNum_13(0);
        }
        else
        {
            datalle10.setNum_3(-1);  
            datalle10.setNum_8(-1);
            datalle10.setNum_13(-1);            
        }
        
        if(request.getParameter("txt10N4") != null && request.getParameter("txt10N4") != "" &&
            request.getParameter("txt10N9") != null && request.getParameter("txt10N9") != "")
        {
            datalle10.setNum_4(Integer.parseInt(request.getParameter("txt10N4")));  
            datalle10.setNum_9(Integer.parseInt(request.getParameter("txt10N9")));
            if(datalle10.getNum_4()==datalle10.getNum_9())
                datalle10.setNum_14(1);
            else
                datalle10.setNum_14(0);
        }
        else
        {
            datalle10.setNum_4(-1);  
            datalle10.setNum_9(-1);
            datalle10.setNum_14(-1);            
        }
        
        if(request.getParameter("txt10N5") != null && request.getParameter("txt10N5") != "" &&
            request.getParameter("txt10N10") != null && request.getParameter("txt10N10") != "")
        {
            datalle10.setNum_5(Integer.parseInt(request.getParameter("txt10N5")));  
            datalle10.setNum_10(Integer.parseInt(request.getParameter("txt10N10")));
            if(datalle10.getNum_5()==datalle10.getNum_10())
                datalle10.setNum_15(1);
            else
                datalle10.setNum_15(0);
        }
        else
        {
            datalle10.setNum_5(-1);  
            datalle10.setNum_10(-1);
            datalle10.setNum_15(-1);            
        } 
        
        
        entidad.getList().add(datalle10);
        
        entDetalleDesbrote datalle11 = new entDetalleDesbrote();
        if(request.getParameter("txt11N1") != null && request.getParameter("txt11N1") != "" &&
            request.getParameter("txt11N6") != null && request.getParameter("txt11N6") != "")
        {
            datalle11.setNum_1(Integer.parseInt(request.getParameter("txt11N1")));  
            datalle11.setNum_6(Integer.parseInt(request.getParameter("txt11N6")));
            if(datalle11.getNum_1()==datalle11.getNum_6())
                datalle11.setNum_11(1);
            else
                datalle11.setNum_11(0);
        }
        else
        {
            datalle11.setNum_1(-1);  
            datalle11.setNum_6(-1);
            datalle11.setNum_11(-1);            
        }
        
        if(request.getParameter("txt11N2") != null && request.getParameter("txt11N2") != "" &&
            request.getParameter("txt11N7") != null && request.getParameter("txt11N7") != "")
        {
            datalle11.setNum_2(Integer.parseInt(request.getParameter("txt11N2")));  
            datalle11.setNum_7(Integer.parseInt(request.getParameter("txt11N7")));
            if(datalle11.getNum_2()==datalle11.getNum_7())
                datalle11.setNum_12(1);
            else
                datalle11.setNum_12(0);
        }
        else
        {
            datalle11.setNum_2(-1);  
            datalle11.setNum_7(-1);
            datalle11.setNum_12(-1);            
        }
        
        if(request.getParameter("txt11N3") != null && request.getParameter("txt11N3") != "" &&
            request.getParameter("txt11N8") != null && request.getParameter("txt11N8") != "")
        {
            datalle11.setNum_3(Integer.parseInt(request.getParameter("txt11N3")));  
            datalle11.setNum_8(Integer.parseInt(request.getParameter("txt11N8")));
            if(datalle11.getNum_3()==datalle11.getNum_8())
                datalle11.setNum_13(1);
            else
                datalle11.setNum_13(0);
        }
        else
        {
            datalle11.setNum_3(-1);  
            datalle11.setNum_8(-1);
            datalle11.setNum_13(-1);            
        }
        
        if(request.getParameter("txt11N4") != null && request.getParameter("txt11N4") != "" &&
            request.getParameter("txt11N9") != null && request.getParameter("txt11N9") != "")
        {
            datalle11.setNum_4(Integer.parseInt(request.getParameter("txt11N4")));  
            datalle11.setNum_9(Integer.parseInt(request.getParameter("txt11N9")));
            if(datalle11.getNum_4()==datalle11.getNum_9())
                datalle11.setNum_14(1);
            else
                datalle11.setNum_14(0);
        }
        else
        {
            datalle11.setNum_4(-1);  
            datalle11.setNum_9(-1);
            datalle11.setNum_14(-1);            
        }
        
        if(request.getParameter("txt11N5") != null && request.getParameter("txt11N5") != "" &&
            request.getParameter("txt11N10") != null && request.getParameter("txt11N10") != "")
        {
            datalle11.setNum_5(Integer.parseInt(request.getParameter("txt11N5")));  
            datalle11.setNum_10(Integer.parseInt(request.getParameter("txt11N10")));
            if(datalle11.getNum_5()==datalle11.getNum_10())
                datalle11.setNum_15(1);
            else
                datalle11.setNum_15(0);
        }
        else
        {
            datalle11.setNum_5(-1);  
            datalle11.setNum_10(-1);
            datalle11.setNum_15(-1);            
        } 
        
         entidad.getList().add(datalle11);
         
         entDetalleDesbrote datalle12 = new entDetalleDesbrote();
        if(request.getParameter("txt12N1") != null && request.getParameter("txt12N1") != "" &&
            request.getParameter("txt12N6") != null && request.getParameter("txt12N6") != "")
        {
            datalle12.setNum_1(Integer.parseInt(request.getParameter("txt12N1")));  
            datalle12.setNum_6(Integer.parseInt(request.getParameter("txt12N6")));
            if(datalle12.getNum_1()==datalle12.getNum_6())
                datalle12.setNum_11(1);
            else
                datalle12.setNum_11(0);
        }
        else
        {
            datalle12.setNum_1(-1);  
            datalle12.setNum_6(-1);
            datalle12.setNum_11(-1);            
        }
        
        if(request.getParameter("txt12N2") != null && request.getParameter("txt12N2") != "" &&
            request.getParameter("txt12N7") != null && request.getParameter("txt12N7") != "")
        {
            datalle12.setNum_2(Integer.parseInt(request.getParameter("txt12N2")));  
            datalle12.setNum_7(Integer.parseInt(request.getParameter("txt12N7")));
            if(datalle12.getNum_2()==datalle12.getNum_7())
                datalle12.setNum_12(1);
            else
                datalle12.setNum_12(0);
        }
        else
        {
            datalle12.setNum_2(-1);  
            datalle12.setNum_7(-1);
            datalle12.setNum_12(-1);            
        }
        
        if(request.getParameter("txt12N3") != null && request.getParameter("txt12N3") != "" &&
            request.getParameter("txt12N8") != null && request.getParameter("txt12N8") != "")
        {
            datalle12.setNum_3(Integer.parseInt(request.getParameter("txt12N3")));  
            datalle12.setNum_8(Integer.parseInt(request.getParameter("txt12N8")));
            if(datalle12.getNum_3()==datalle12.getNum_8())
                datalle12.setNum_13(1);
            else
                datalle12.setNum_13(0);
        }
        else
        {
            datalle12.setNum_3(-1);  
            datalle12.setNum_8(-1);
            datalle12.setNum_13(-1);            
        }
        
        if(request.getParameter("txt12N4") != null && request.getParameter("txt12N4") != "" &&
            request.getParameter("txt12N9") != null && request.getParameter("txt12N9") != "")
        {
            datalle12.setNum_4(Integer.parseInt(request.getParameter("txt12N4")));  
            datalle12.setNum_9(Integer.parseInt(request.getParameter("txt12N9")));
            if(datalle12.getNum_4()==datalle12.getNum_9())
                datalle12.setNum_14(1);
            else
                datalle12.setNum_14(0);
        }
        else
        {
            datalle12.setNum_4(-1);  
            datalle12.setNum_9(-1);
            datalle12.setNum_14(-1);            
        }
        
        if(request.getParameter("txt12N5") != null && request.getParameter("txt12N5") != "" &&
            request.getParameter("txt12N10") != null && request.getParameter("txt12N10") != "")
        {
            datalle12.setNum_5(Integer.parseInt(request.getParameter("txt12N5")));  
            datalle12.setNum_10(Integer.parseInt(request.getParameter("txt12N10")));
            if(datalle12.getNum_5()==datalle12.getNum_10())
                datalle12.setNum_15(1);
            else
                datalle12.setNum_15(0);
        }
        else
        {
            datalle12.setNum_5(-1);  
            datalle12.setNum_10(-1);
            datalle12.setNum_15(-1);            
        } 

         entidad.getList().add(datalle12);
         
         entDetalleDesbrote datalle13 = new entDetalleDesbrote();
        if(request.getParameter("txt13N1") != null && request.getParameter("txt13N1") != "" &&
            request.getParameter("txt13N6") != null && request.getParameter("txt13N6") != "")
        {
            datalle13.setNum_1(Integer.parseInt(request.getParameter("txt13N1")));  
            datalle13.setNum_6(Integer.parseInt(request.getParameter("txt13N6")));
            if(datalle13.getNum_1()==datalle13.getNum_6())
                datalle13.setNum_11(1);
            else
                datalle13.setNum_11(0);
        }
        else
        {
            datalle13.setNum_1(-1);  
            datalle13.setNum_6(-1);
            datalle13.setNum_11(-1);            
        }
        
        if(request.getParameter("txt13N2") != null && request.getParameter("txt13N2") != "" &&
            request.getParameter("txt13N7") != null && request.getParameter("txt13N7") != "")
        {
            datalle13.setNum_2(Integer.parseInt(request.getParameter("txt13N2")));  
            datalle13.setNum_7(Integer.parseInt(request.getParameter("txt13N7")));
            if(datalle13.getNum_2()==datalle13.getNum_7())
                datalle13.setNum_12(1);
            else
                datalle13.setNum_12(0);
        }
        else
        {
            datalle13.setNum_2(-1);  
            datalle13.setNum_7(-1);
            datalle13.setNum_12(-1);            
        }
        
        if(request.getParameter("txt13N3") != null && request.getParameter("txt13N3") != "" &&
            request.getParameter("txt13N8") != null && request.getParameter("txt13N8") != "")
        {
            datalle13.setNum_3(Integer.parseInt(request.getParameter("txt13N3")));  
            datalle13.setNum_8(Integer.parseInt(request.getParameter("txt13N8")));
            if(datalle13.getNum_3()==datalle13.getNum_8())
                datalle13.setNum_13(1);
            else
                datalle13.setNum_13(0);
        }
        else
        {
            datalle13.setNum_3(-1);  
            datalle13.setNum_8(-1);
            datalle13.setNum_13(-1);            
        }
        
        if(request.getParameter("txt13N4") != null && request.getParameter("txt13N4") != "" &&
            request.getParameter("txt13N9") != null && request.getParameter("txt13N9") != "")
        {
            datalle13.setNum_4(Integer.parseInt(request.getParameter("txt13N4")));  
            datalle13.setNum_9(Integer.parseInt(request.getParameter("txt13N9")));
            if(datalle13.getNum_4()==datalle13.getNum_9())
                datalle13.setNum_14(1);
            else
                datalle13.setNum_14(0);
        }
        else
        {
            datalle13.setNum_4(-1);  
            datalle13.setNum_9(-1);
            datalle13.setNum_14(-1);            
        }
        
        if(request.getParameter("txt13N5") != null && request.getParameter("txt13N5") != "" &&
            request.getParameter("txt13N10") != null && request.getParameter("txt13N10") != "")
        {
            datalle13.setNum_5(Integer.parseInt(request.getParameter("txt13N5")));  
            datalle13.setNum_10(Integer.parseInt(request.getParameter("txt13N10")));
            if(datalle13.getNum_5()==datalle13.getNum_10())
                datalle13.setNum_15(1);
            else
                datalle13.setNum_15(0);
        }
        else
        {
            datalle13.setNum_5(-1);  
            datalle13.setNum_10(-1);
            datalle13.setNum_15(-1);            
        } 
         
        
         entidad.getList().add(datalle13);
         
         entDetalleDesbrote datalle14 = new entDetalleDesbrote();
        if(request.getParameter("txt14N1") != null && request.getParameter("txt14N1") != "" &&
            request.getParameter("txt14N6") != null && request.getParameter("txt14N6") != "")
        {
            datalle14.setNum_1(Integer.parseInt(request.getParameter("txt14N1")));  
            datalle14.setNum_6(Integer.parseInt(request.getParameter("txt14N6")));
            if(datalle14.getNum_1()==datalle14.getNum_6())
                datalle14.setNum_11(1);
            else
                datalle14.setNum_11(0);
        }
        else
        {
            datalle14.setNum_1(-1);  
            datalle14.setNum_6(-1);
            datalle14.setNum_11(-1);            
        }
        
        if(request.getParameter("txt14N2") != null && request.getParameter("txt14N2") != "" &&
            request.getParameter("txt14N7") != null && request.getParameter("txt14N7") != "")
        {
            datalle14.setNum_2(Integer.parseInt(request.getParameter("txt14N2")));  
            datalle14.setNum_7(Integer.parseInt(request.getParameter("txt14N7")));
            if(datalle14.getNum_2()==datalle14.getNum_7())
                datalle14.setNum_12(1);
            else
                datalle14.setNum_12(0);
        }
        else
        {
            datalle14.setNum_2(-1);  
            datalle14.setNum_7(-1);
            datalle14.setNum_12(-1);            
        }
        
        if(request.getParameter("txt14N3") != null && request.getParameter("txt14N3") != "" &&
            request.getParameter("txt14N8") != null && request.getParameter("txt14N8") != "")
        {
            datalle14.setNum_3(Integer.parseInt(request.getParameter("txt14N3")));  
            datalle14.setNum_8(Integer.parseInt(request.getParameter("txt14N8")));
            if(datalle14.getNum_3()==datalle14.getNum_8())
                datalle14.setNum_13(1);
            else
                datalle14.setNum_13(0);
        }
        else
        {
            datalle14.setNum_3(-1);  
            datalle14.setNum_8(-1);
            datalle14.setNum_13(-1);            
        }
        
        if(request.getParameter("txt14N4") != null && request.getParameter("txt14N4") != "" &&
            request.getParameter("txt14N9") != null && request.getParameter("txt14N9") != "")
        {
            datalle14.setNum_4(Integer.parseInt(request.getParameter("txt14N4")));  
            datalle14.setNum_9(Integer.parseInt(request.getParameter("txt14N9")));
            if(datalle14.getNum_4()==datalle14.getNum_9())
                datalle14.setNum_14(1);
            else
                datalle14.setNum_14(0);
        }
        else
        {
            datalle14.setNum_4(-1);  
            datalle14.setNum_9(-1);
            datalle14.setNum_14(-1);            
        }
        
        if(request.getParameter("txt14N5") != null && request.getParameter("txt14N5") != "" &&
            request.getParameter("txt14N10") != null && request.getParameter("txt14N10") != "")
        {
            datalle14.setNum_5(Integer.parseInt(request.getParameter("txt14N5")));  
            datalle14.setNum_10(Integer.parseInt(request.getParameter("txt14N10")));
            if(datalle14.getNum_5()==datalle14.getNum_10())
                datalle14.setNum_15(1);
            else
                datalle14.setNum_15(0);
        }
        else
        {
            datalle14.setNum_5(-1);  
            datalle14.setNum_10(-1);
            datalle14.setNum_15(-1);            
        } 
       
        
        
         entidad.getList().add(datalle14);
         
         
         
        if(pos>=0)
        {
            if(objSession.getObjDesbrote().getId_desbrote()>0)
            {
                entidad.setSeleccion(true);
                entidad.setId_cabecera_desbrote(objSession.getObjDesbrote().getList().get(pos).getId_cabecera_desbrote());
            }
            
            objSession.getObjDesbrote().getList().remove(pos);
            objSession.getObjDesbrote().getList().add(pos, entidad);
        }
        else
        {
            objSession.getObjDesbrote().getList().add(entidad);
        }
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);

    }
}
%>