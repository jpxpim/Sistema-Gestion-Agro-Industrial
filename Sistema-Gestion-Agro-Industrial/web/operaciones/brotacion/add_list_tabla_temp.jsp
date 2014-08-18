

<%@page import="Entidades.entDetalleBrotacion"%>
<%@page import="Entidades.entCabeceraBrotacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entBrotacion"%>
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
        if(objSession.getObjBotacion()==null)
        {
            objSession.setObjBotacion(new entBrotacion());
            if(objSession.getObjBotacion().getList()==null)
                objSession.getObjBotacion().setList(new ArrayList<entCabeceraBrotacion>());
        }
        
        
        entCabeceraBrotacion entidad=new entCabeceraBrotacion();
        

        
        entidad.setNum_salida_planta(Integer.parseInt(request.getParameter("txtNSP")));
        entidad.setNum_planta(Integer.parseInt(request.getParameter("txtNP")));
        entidad.setNum_hilera(Integer.parseInt(request.getParameter("txtNH")));
        entidad.setNum_cargador_planta(Integer.parseInt(request.getParameter("txtNCP")));
        
        entidad.setList(new ArrayList<entDetalleBrotacion>());
        
        
        entDetalleBrotacion datalle0 = new entDetalleBrotacion();
        
        if(request.getParameter("txt0N1") != null && request.getParameter("txt0N1") != "" )
        datalle0.setNum_1(Integer.parseInt(request.getParameter("txt0N1")));
        
        if(request.getParameter("txt0N2") != null && request.getParameter("txt0N2") != "" )
        datalle0.setNum_2(Integer.parseInt(request.getParameter("txt0N2")));
        
        if(request.getParameter("txt0N3") != null && request.getParameter("txt0N3") != "" )
        datalle0.setNum_3(Integer.parseInt(request.getParameter("txt0N3")));
        
        if(request.getParameter("txt0N4") != null && request.getParameter("txt0N4") != "" )
        datalle0.setNum_4(Integer.parseInt(request.getParameter("txt0N4")));
        
        if(request.getParameter("txt0N5") != null && request.getParameter("txt0N5") != "" )
        datalle0.setNum_5(Integer.parseInt(request.getParameter("txt0N5")));
        
        if(request.getParameter("txt0N6") != null && request.getParameter("txt0N6") != "" )
        datalle0.setNum_6(Integer.parseInt(request.getParameter("txt0N6")));
        
        if(request.getParameter("txt0N7") != null && request.getParameter("txt0N7") != "" )
        datalle0.setNum_7(Integer.parseInt(request.getParameter("txt0N7")));
        
        if(request.getParameter("txt0N8") != null && request.getParameter("txt0N8") != "" )
        datalle0.setNum_8(Integer.parseInt(request.getParameter("txt0N8")));
         
        if(request.getParameter("txt0N9") != null && request.getParameter("txt0N9") != "" )
        datalle0.setNum_9(Integer.parseInt(request.getParameter("txt0N9")));
        
        if(request.getParameter("txt0N10") != null && request.getParameter("txt0N10") != "" )
        datalle0.setNum_10(Integer.parseInt(request.getParameter("txt0N10")));
        
        if(request.getParameter("txt0N11") != null && request.getParameter("txt0N11") != "" )
        datalle0.setNum_11(Integer.parseInt(request.getParameter("txt0N11")));
        
        if(request.getParameter("txt0N12") != null && request.getParameter("txt0N12") != "" )
        datalle0.setNum_12(Integer.parseInt(request.getParameter("txt0N12")));
        
         entidad.getList().add(datalle0);
         
        entDetalleBrotacion datalle1 = new entDetalleBrotacion();
        
        if(request.getParameter("txt1N1") != null && request.getParameter("txt1N1") != "" )
        datalle1.setNum_1(Integer.parseInt(request.getParameter("txt1N1")));
        
        if(request.getParameter("txt1N2") != null && request.getParameter("txt1N2") != "" )
        datalle1.setNum_2(Integer.parseInt(request.getParameter("txt1N2")));
        
        if(request.getParameter("txt1N3") != null && request.getParameter("txt1N3") != "" )
        datalle1.setNum_3(Integer.parseInt(request.getParameter("txt1N3")));
        
        if(request.getParameter("txt1N4") != null && request.getParameter("txt1N4") != "" )
        datalle1.setNum_4(Integer.parseInt(request.getParameter("txt1N4")));
        
        if(request.getParameter("txt1N5") != null && request.getParameter("txt1N5") != "" )
        datalle1.setNum_5(Integer.parseInt(request.getParameter("txt1N5")));
        
        if(request.getParameter("txt1N6") != null && request.getParameter("txt1N6") != "" )
        datalle1.setNum_6(Integer.parseInt(request.getParameter("txt1N6")));
        
        if(request.getParameter("txt1N7") != null && request.getParameter("txt1N7") != "" )
        datalle1.setNum_7(Integer.parseInt(request.getParameter("txt1N7")));
        
        if(request.getParameter("txt1N8") != null && request.getParameter("txt1N8") != "" )
        datalle1.setNum_8(Integer.parseInt(request.getParameter("txt1N8")));
         
        if(request.getParameter("txt1N9") != null && request.getParameter("txt1N9") != "" )
        datalle1.setNum_9(Integer.parseInt(request.getParameter("txt1N9")));
        
        if(request.getParameter("txt1N10") != null && request.getParameter("txt1N10") != "" )
        datalle1.setNum_10(Integer.parseInt(request.getParameter("txt1N10")));
        
        if(request.getParameter("txt1N11") != null && request.getParameter("txt1N11") != "" )
        datalle1.setNum_11(Integer.parseInt(request.getParameter("txt1N11")));
        
        if(request.getParameter("txt1N12") != null && request.getParameter("txt1N12") != "" )
        datalle1.setNum_12(Integer.parseInt(request.getParameter("txt1N12")));
        
         entidad.getList().add(datalle1);
         
         entDetalleBrotacion datalle2 = new entDetalleBrotacion();
        
        if(request.getParameter("txt2N1") != null && request.getParameter("txt2N1") != "" )
        datalle2.setNum_1(Integer.parseInt(request.getParameter("txt2N1")));
        
        if(request.getParameter("txt2N2") != null && request.getParameter("txt2N2") != "" )
        datalle2.setNum_2(Integer.parseInt(request.getParameter("txt2N2")));
        
        if(request.getParameter("txt2N3") != null && request.getParameter("txt2N3") != "" )
        datalle2.setNum_3(Integer.parseInt(request.getParameter("txt2N3")));
        
        if(request.getParameter("txt2N4") != null && request.getParameter("txt2N4") != "" )
        datalle2.setNum_4(Integer.parseInt(request.getParameter("txt2N4")));
        
        if(request.getParameter("txt2N5") != null && request.getParameter("txt2N5") != "" )
        datalle2.setNum_5(Integer.parseInt(request.getParameter("txt2N5")));
        
        if(request.getParameter("txt2N6") != null && request.getParameter("txt2N6") != "" )
        datalle2.setNum_6(Integer.parseInt(request.getParameter("txt2N6")));
        
        if(request.getParameter("txt2N7") != null && request.getParameter("txt2N7") != "" )
        datalle2.setNum_7(Integer.parseInt(request.getParameter("txt2N7")));
        
        if(request.getParameter("txt2N8") != null && request.getParameter("txt2N8") != "" )
        datalle2.setNum_8(Integer.parseInt(request.getParameter("txt2N8")));
         
        if(request.getParameter("txt2N9") != null && request.getParameter("txt2N9") != "" )
        datalle2.setNum_9(Integer.parseInt(request.getParameter("txt2N9")));
        
        if(request.getParameter("txt2N10") != null && request.getParameter("txt2N10") != "" )
        datalle2.setNum_10(Integer.parseInt(request.getParameter("txt2N10")));
        
        if(request.getParameter("txt2N11") != null && request.getParameter("txt2N11") != "" )
        datalle2.setNum_11(Integer.parseInt(request.getParameter("txt2N11")));
        
        if(request.getParameter("txt2N12") != null && request.getParameter("txt2N12") != "" )
        datalle2.setNum_12(Integer.parseInt(request.getParameter("txt2N12")));
        
         entidad.getList().add(datalle2);
         
         entDetalleBrotacion datalle3 = new entDetalleBrotacion();
        
        if(request.getParameter("txt3N1") != null && request.getParameter("txt3N1") != "" )
        datalle3.setNum_1(Integer.parseInt(request.getParameter("txt3N1")));
        
        if(request.getParameter("txt3N2") != null && request.getParameter("txt3N2") != "" )
        datalle3.setNum_2(Integer.parseInt(request.getParameter("txt3N2")));
        
        if(request.getParameter("txt3N3") != null && request.getParameter("txt3N3") != "" )
        datalle3.setNum_3(Integer.parseInt(request.getParameter("txt3N3")));
        
        if(request.getParameter("txt3N4") != null && request.getParameter("txt3N4") != "" )
        datalle3.setNum_4(Integer.parseInt(request.getParameter("txt3N4")));
        
        if(request.getParameter("txt3N5") != null && request.getParameter("txt3N5") != "" )
        datalle3.setNum_5(Integer.parseInt(request.getParameter("txt3N5")));
        
        if(request.getParameter("txt3N6") != null && request.getParameter("txt3N6") != "" )
        datalle3.setNum_6(Integer.parseInt(request.getParameter("txt3N6")));
        
        if(request.getParameter("txt3N7") != null && request.getParameter("txt3N7") != "" )
        datalle3.setNum_7(Integer.parseInt(request.getParameter("txt3N7")));
        
        if(request.getParameter("txt3N8") != null && request.getParameter("txt3N8") != "" )
        datalle3.setNum_8(Integer.parseInt(request.getParameter("txt3N8")));
         
        if(request.getParameter("txt3N9") != null && request.getParameter("txt3N9") != "" )
        datalle3.setNum_9(Integer.parseInt(request.getParameter("txt3N9")));
        
        if(request.getParameter("txt3N10") != null && request.getParameter("txt3N10") != "" )
        datalle3.setNum_10(Integer.parseInt(request.getParameter("txt3N10")));
        
        if(request.getParameter("txt3N11") != null && request.getParameter("txt3N11") != "" )
        datalle3.setNum_11(Integer.parseInt(request.getParameter("txt3N11")));
        
        if(request.getParameter("txt3N12") != null && request.getParameter("txt3N12") != "" )
        datalle3.setNum_12(Integer.parseInt(request.getParameter("txt3N12")));
        
         entidad.getList().add(datalle3);
         
         entDetalleBrotacion datalle4 = new entDetalleBrotacion();
        
        if(request.getParameter("txt4N1") != null && request.getParameter("txt4N1") != "" )
        datalle4.setNum_1(Integer.parseInt(request.getParameter("txt4N1")));
        
        if(request.getParameter("txt4N2") != null && request.getParameter("txt4N2") != "" )
        datalle4.setNum_2(Integer.parseInt(request.getParameter("txt4N2")));
        
        if(request.getParameter("txt4N3") != null && request.getParameter("txt4N3") != "" )
        datalle4.setNum_3(Integer.parseInt(request.getParameter("txt4N3")));
        
        if(request.getParameter("txt4N4") != null && request.getParameter("txt4N4") != "" )
        datalle4.setNum_4(Integer.parseInt(request.getParameter("txt4N4")));
        
        if(request.getParameter("txt4N5") != null && request.getParameter("txt4N5") != "" )
        datalle4.setNum_5(Integer.parseInt(request.getParameter("txt4N5")));
        
        if(request.getParameter("txt4N6") != null && request.getParameter("txt4N6") != "" )
        datalle4.setNum_6(Integer.parseInt(request.getParameter("txt4N6")));
        
        if(request.getParameter("txt4N7") != null && request.getParameter("txt4N7") != "" )
        datalle4.setNum_7(Integer.parseInt(request.getParameter("txt4N7")));
        
        if(request.getParameter("txt4N8") != null && request.getParameter("txt4N8") != "" )
        datalle4.setNum_8(Integer.parseInt(request.getParameter("txt4N8")));
         
        if(request.getParameter("txt4N9") != null && request.getParameter("txt4N9") != "" )
        datalle4.setNum_9(Integer.parseInt(request.getParameter("txt4N9")));
        
        if(request.getParameter("txt4N10") != null && request.getParameter("txt4N10") != "" )
        datalle4.setNum_10(Integer.parseInt(request.getParameter("txt4N10")));
        
        if(request.getParameter("txt4N11") != null && request.getParameter("txt4N11") != "" )
        datalle4.setNum_11(Integer.parseInt(request.getParameter("txt4N11")));
        
        if(request.getParameter("txt4N12") != null && request.getParameter("txt4N12") != "" )
        datalle4.setNum_12(Integer.parseInt(request.getParameter("txt4N12")));
        
         entidad.getList().add(datalle4);
         
        entDetalleBrotacion datalle5 = new entDetalleBrotacion();
        
        if(request.getParameter("txt5N1") != null && request.getParameter("txt5N1") != "" )
        datalle5.setNum_1(Integer.parseInt(request.getParameter("txt5N1")));
        
        if(request.getParameter("txt5N2") != null && request.getParameter("txt5N2") != "" )
        datalle5.setNum_2(Integer.parseInt(request.getParameter("txt5N2")));
        
        if(request.getParameter("txt5N3") != null && request.getParameter("txt5N3") != "" )
        datalle5.setNum_3(Integer.parseInt(request.getParameter("txt5N3")));
        
        if(request.getParameter("txt5N4") != null && request.getParameter("txt5N4") != "" )
        datalle5.setNum_4(Integer.parseInt(request.getParameter("txt5N4")));
        
        if(request.getParameter("txt5N5") != null && request.getParameter("txt5N5") != "" )
        datalle5.setNum_5(Integer.parseInt(request.getParameter("txt5N5")));
        
        if(request.getParameter("txt5N6") != null && request.getParameter("txt5N6") != "" )
        datalle5.setNum_6(Integer.parseInt(request.getParameter("txt5N6")));
        
        if(request.getParameter("txt5N7") != null && request.getParameter("txt5N7") != "" )
        datalle5.setNum_7(Integer.parseInt(request.getParameter("txt5N7")));
        
        if(request.getParameter("txt5N8") != null && request.getParameter("txt5N8") != "" )
        datalle5.setNum_8(Integer.parseInt(request.getParameter("txt5N8")));
         
        if(request.getParameter("txt5N9") != null && request.getParameter("txt5N9") != "" )
        datalle5.setNum_9(Integer.parseInt(request.getParameter("txt5N9")));
        
        if(request.getParameter("txt5N10") != null && request.getParameter("txt5N10") != "" )
        datalle5.setNum_10(Integer.parseInt(request.getParameter("txt5N10")));
        
        if(request.getParameter("txt5N11") != null && request.getParameter("txt5N11") != "" )
        datalle5.setNum_11(Integer.parseInt(request.getParameter("txt5N11")));
        
        if(request.getParameter("txt5N12") != null && request.getParameter("txt5N12") != "" )
        datalle5.setNum_12(Integer.parseInt(request.getParameter("txt5N12")));
        
         entidad.getList().add(datalle5);
         
         entDetalleBrotacion datalle6 = new entDetalleBrotacion();
        
        if(request.getParameter("txt6N1") != null && request.getParameter("txt6N1") != "" )
        datalle6.setNum_1(Integer.parseInt(request.getParameter("txt6N1")));
        
        if(request.getParameter("txt6N2") != null && request.getParameter("txt6N2") != "" )
        datalle6.setNum_2(Integer.parseInt(request.getParameter("txt6N2")));
        
        if(request.getParameter("txt6N3") != null && request.getParameter("txt6N3") != "" )
        datalle6.setNum_3(Integer.parseInt(request.getParameter("txt6N3")));
        
        if(request.getParameter("txt6N4") != null && request.getParameter("txt6N4") != "" )
        datalle6.setNum_4(Integer.parseInt(request.getParameter("txt6N4")));
        
        if(request.getParameter("txt6N5") != null && request.getParameter("txt6N5") != "" )
        datalle6.setNum_5(Integer.parseInt(request.getParameter("txt6N5")));
        
        if(request.getParameter("txt6N6") != null && request.getParameter("txt6N6") != "" )
        datalle6.setNum_6(Integer.parseInt(request.getParameter("txt6N6")));
        
        if(request.getParameter("txt6N7") != null && request.getParameter("txt6N7") != "" )
        datalle6.setNum_7(Integer.parseInt(request.getParameter("txt6N7")));
        
        if(request.getParameter("txt6N8") != null && request.getParameter("txt6N8") != "" )
        datalle6.setNum_8(Integer.parseInt(request.getParameter("txt6N8")));
         
        if(request.getParameter("txt6N9") != null && request.getParameter("txt6N9") != "" )
        datalle6.setNum_9(Integer.parseInt(request.getParameter("txt6N9")));
        
        if(request.getParameter("txt6N10") != null && request.getParameter("txt6N10") != "" )
        datalle6.setNum_10(Integer.parseInt(request.getParameter("txt6N10")));
        
        if(request.getParameter("txt6N11") != null && request.getParameter("txt6N11") != "" )
        datalle6.setNum_11(Integer.parseInt(request.getParameter("txt6N11")));
        
        if(request.getParameter("txt6N12") != null && request.getParameter("txt6N12") != "" )
        datalle6.setNum_12(Integer.parseInt(request.getParameter("txt6N12")));
        
         entidad.getList().add(datalle6);
         
         entDetalleBrotacion datalle7 = new entDetalleBrotacion();
        
        if(request.getParameter("txt7N1") != null && request.getParameter("txt7N1") != "" )
        datalle7.setNum_1(Integer.parseInt(request.getParameter("txt7N1")));
        
        if(request.getParameter("txt7N2") != null && request.getParameter("txt7N2") != "" )
        datalle7.setNum_2(Integer.parseInt(request.getParameter("txt7N2")));
        
        if(request.getParameter("txt7N3") != null && request.getParameter("txt7N3") != "" )
        datalle7.setNum_3(Integer.parseInt(request.getParameter("txt7N3")));
        
        if(request.getParameter("txt7N4") != null && request.getParameter("txt7N4") != "" )
        datalle7.setNum_4(Integer.parseInt(request.getParameter("txt7N4")));
        
        if(request.getParameter("txt7N5") != null && request.getParameter("txt7N5") != "" )
        datalle7.setNum_5(Integer.parseInt(request.getParameter("txt7N5")));
        
        if(request.getParameter("txt7N6") != null && request.getParameter("txt7N6") != "" )
        datalle7.setNum_6(Integer.parseInt(request.getParameter("txt7N6")));
        
        if(request.getParameter("txt7N7") != null && request.getParameter("txt7N7") != "" )
        datalle7.setNum_7(Integer.parseInt(request.getParameter("txt7N7")));
        
        if(request.getParameter("txt7N8") != null && request.getParameter("txt7N8") != "" )
        datalle7.setNum_8(Integer.parseInt(request.getParameter("txt7N8")));
         
        if(request.getParameter("txt7N9") != null && request.getParameter("txt7N9") != "" )
        datalle7.setNum_9(Integer.parseInt(request.getParameter("txt7N9")));
        
        if(request.getParameter("txt7N10") != null && request.getParameter("txt7N10") != "" )
        datalle7.setNum_10(Integer.parseInt(request.getParameter("txt7N10")));
        
        if(request.getParameter("txt7N11") != null && request.getParameter("txt7N11") != "" )
        datalle7.setNum_11(Integer.parseInt(request.getParameter("txt7N11")));
        
        if(request.getParameter("txt7N12") != null && request.getParameter("txt7N12") != "" )
        datalle7.setNum_12(Integer.parseInt(request.getParameter("txt7N12")));
        
         entidad.getList().add(datalle7);
         
         entDetalleBrotacion datalle8 = new entDetalleBrotacion();
        
        if(request.getParameter("txt8N1") != null && request.getParameter("txt8N1") != "" )
        datalle8.setNum_1(Integer.parseInt(request.getParameter("txt8N1")));
        
        if(request.getParameter("txt8N2") != null && request.getParameter("txt8N2") != "" )
        datalle8.setNum_2(Integer.parseInt(request.getParameter("txt8N2")));
        
        if(request.getParameter("txt8N3") != null && request.getParameter("txt8N3") != "" )
        datalle8.setNum_3(Integer.parseInt(request.getParameter("txt8N3")));
        
        if(request.getParameter("txt8N4") != null && request.getParameter("txt8N4") != "" )
        datalle8.setNum_4(Integer.parseInt(request.getParameter("txt8N4")));
        
        if(request.getParameter("txt8N5") != null && request.getParameter("txt8N5") != "" )
        datalle8.setNum_5(Integer.parseInt(request.getParameter("txt8N5")));
        
        if(request.getParameter("txt8N6") != null && request.getParameter("txt8N6") != "" )
        datalle8.setNum_6(Integer.parseInt(request.getParameter("txt8N6")));
        
        if(request.getParameter("txt8N7") != null && request.getParameter("txt8N7") != "" )
        datalle8.setNum_7(Integer.parseInt(request.getParameter("txt8N7")));
        
        if(request.getParameter("txt8N8") != null && request.getParameter("txt8N8") != "" )
        datalle8.setNum_8(Integer.parseInt(request.getParameter("txt8N8")));
         
        if(request.getParameter("txt8N9") != null && request.getParameter("txt8N9") != "" )
        datalle8.setNum_9(Integer.parseInt(request.getParameter("txt8N9")));
        
        if(request.getParameter("txt8N10") != null && request.getParameter("txt8N10") != "" )
        datalle8.setNum_10(Integer.parseInt(request.getParameter("txt8N10")));
        
        if(request.getParameter("txt8N11") != null && request.getParameter("txt8N11") != "" )
        datalle8.setNum_11(Integer.parseInt(request.getParameter("txt8N11")));
        
        if(request.getParameter("txt8N12") != null && request.getParameter("txt8N12") != "" )
        datalle8.setNum_12(Integer.parseInt(request.getParameter("txt8N12")));
        
         entidad.getList().add(datalle8);
         
         entDetalleBrotacion datalle9 = new entDetalleBrotacion();
        
        if(request.getParameter("txt9N1") != null && request.getParameter("txt9N1") != "" )
        datalle9.setNum_1(Integer.parseInt(request.getParameter("txt9N1")));
        
        if(request.getParameter("txt9N2") != null && request.getParameter("txt9N2") != "" )
        datalle9.setNum_2(Integer.parseInt(request.getParameter("txt9N2")));
        
        if(request.getParameter("txt9N3") != null && request.getParameter("txt9N3") != "" )
        datalle9.setNum_3(Integer.parseInt(request.getParameter("txt9N3")));
        
        if(request.getParameter("txt9N4") != null && request.getParameter("txt9N4") != "" )
        datalle9.setNum_4(Integer.parseInt(request.getParameter("txt9N4")));
        
        if(request.getParameter("txt9N5") != null && request.getParameter("txt9N5") != "" )
        datalle9.setNum_5(Integer.parseInt(request.getParameter("txt9N5")));
        
        if(request.getParameter("txt9N6") != null && request.getParameter("txt9N6") != "" )
        datalle9.setNum_6(Integer.parseInt(request.getParameter("txt9N6")));
        
        if(request.getParameter("txt9N7") != null && request.getParameter("txt9N7") != "" )
        datalle9.setNum_7(Integer.parseInt(request.getParameter("txt9N7")));
        
        if(request.getParameter("txt9N8") != null && request.getParameter("txt9N8") != "" )
        datalle9.setNum_8(Integer.parseInt(request.getParameter("txt9N8")));
         
        if(request.getParameter("txt9N9") != null && request.getParameter("txt9N9") != "" )
        datalle9.setNum_9(Integer.parseInt(request.getParameter("txt9N9")));
        
        if(request.getParameter("txt9N10") != null && request.getParameter("txt9N10") != "" )
        datalle9.setNum_10(Integer.parseInt(request.getParameter("txt9N10")));
        
        if(request.getParameter("txt9N11") != null && request.getParameter("txt9N11") != "" )
        datalle9.setNum_11(Integer.parseInt(request.getParameter("txt9N11")));
        
        if(request.getParameter("txt9N12") != null && request.getParameter("txt9N12") != "" )
        datalle9.setNum_12(Integer.parseInt(request.getParameter("txt9N12")));
        
         entidad.getList().add(datalle9);
         
         entDetalleBrotacion datalle10 = new entDetalleBrotacion();
        
        if(request.getParameter("txt10N1") != null && request.getParameter("txt10N1") != "" )
        datalle10.setNum_1(Integer.parseInt(request.getParameter("txt10N1")));
        
        if(request.getParameter("txt10N2") != null && request.getParameter("txt10N2") != "" )
        datalle10.setNum_2(Integer.parseInt(request.getParameter("txt10N2")));
        
        if(request.getParameter("txt10N3") != null && request.getParameter("txt10N3") != "" )
        datalle10.setNum_3(Integer.parseInt(request.getParameter("txt10N3")));
        
        if(request.getParameter("txt10N4") != null && request.getParameter("txt10N4") != "" )
        datalle10.setNum_4(Integer.parseInt(request.getParameter("txt10N4")));
        
        if(request.getParameter("txt10N5") != null && request.getParameter("txt10N5") != "" )
        datalle10.setNum_5(Integer.parseInt(request.getParameter("txt10N5")));
        
        if(request.getParameter("txt10N6") != null && request.getParameter("txt10N6") != "" )
        datalle10.setNum_6(Integer.parseInt(request.getParameter("txt10N6")));
        
        if(request.getParameter("txt10N7") != null && request.getParameter("txt10N7") != "" )
        datalle10.setNum_7(Integer.parseInt(request.getParameter("txt10N7")));
        
        if(request.getParameter("txt10N8") != null && request.getParameter("txt10N8") != "" )
        datalle10.setNum_8(Integer.parseInt(request.getParameter("txt10N8")));
         
        if(request.getParameter("txt10N9") != null && request.getParameter("txt10N9") != "" )
        datalle10.setNum_9(Integer.parseInt(request.getParameter("txt10N9")));
        
        if(request.getParameter("txt10N10") != null && request.getParameter("txt10N10") != "" )
        datalle10.setNum_10(Integer.parseInt(request.getParameter("txt10N10")));
        
        if(request.getParameter("txt10N11") != null && request.getParameter("txt10N11") != "" )
        datalle10.setNum_11(Integer.parseInt(request.getParameter("txt10N11")));
        
        if(request.getParameter("txt10N12") != null && request.getParameter("txt10N12") != "" )
        datalle10.setNum_12(Integer.parseInt(request.getParameter("txt10N12")));        
        
        entidad.getList().add(datalle10);
        
        entDetalleBrotacion datalle11 = new entDetalleBrotacion();
        
        if(request.getParameter("txt11N1") != null && request.getParameter("txt11N1") != "" )
        datalle11.setNum_1(Integer.parseInt(request.getParameter("txt11N1")));
        
        if(request.getParameter("txt11N2") != null && request.getParameter("txt11N2") != "" )
        datalle11.setNum_2(Integer.parseInt(request.getParameter("txt11N2")));
        
        if(request.getParameter("txt11N3") != null && request.getParameter("txt11N3") != "" )
        datalle11.setNum_3(Integer.parseInt(request.getParameter("txt11N3")));
        
        if(request.getParameter("txt11N4") != null && request.getParameter("txt11N4") != "" )
        datalle11.setNum_4(Integer.parseInt(request.getParameter("txt11N4")));
        
        if(request.getParameter("txt11N5") != null && request.getParameter("txt11N5") != "" )
        datalle11.setNum_5(Integer.parseInt(request.getParameter("txt11N5")));
        
        if(request.getParameter("txt11N6") != null && request.getParameter("txt11N6") != "" )
        datalle11.setNum_6(Integer.parseInt(request.getParameter("txt11N6")));
        
        if(request.getParameter("txt11N7") != null && request.getParameter("txt11N7") != "" )
        datalle11.setNum_7(Integer.parseInt(request.getParameter("txt11N7")));
        
        if(request.getParameter("txt11N8") != null && request.getParameter("txt11N8") != "" )
        datalle11.setNum_8(Integer.parseInt(request.getParameter("txt11N8")));
         
        if(request.getParameter("txt11N9") != null && request.getParameter("txt11N9") != "" )
        datalle11.setNum_9(Integer.parseInt(request.getParameter("txt11N9")));
        
        if(request.getParameter("txt11N10") != null && request.getParameter("txt11N10") != "" )
        datalle11.setNum_10(Integer.parseInt(request.getParameter("txt11N10")));
        
        if(request.getParameter("txt11N11") != null && request.getParameter("txt11N11") != "" )
        datalle11.setNum_11(Integer.parseInt(request.getParameter("txt11N11")));
        
        if(request.getParameter("txt11N12") != null && request.getParameter("txt11N12") != "" )
        datalle11.setNum_12(Integer.parseInt(request.getParameter("txt11N12")));
        
         entidad.getList().add(datalle11);
         
         entDetalleBrotacion datalle12 = new entDetalleBrotacion();
        
        if(request.getParameter("txt12N1") != null && request.getParameter("txt12N1") != "" )
        datalle12.setNum_1(Integer.parseInt(request.getParameter("txt12N1")));
        
        if(request.getParameter("txt12N2") != null && request.getParameter("txt12N2") != "" )
        datalle12.setNum_2(Integer.parseInt(request.getParameter("txt12N2")));
        
        if(request.getParameter("txt12N3") != null && request.getParameter("txt12N3") != "" )
        datalle12.setNum_3(Integer.parseInt(request.getParameter("txt12N3")));
        
        if(request.getParameter("txt12N4") != null && request.getParameter("txt12N4") != "" )
        datalle12.setNum_4(Integer.parseInt(request.getParameter("txt12N4")));
        
        if(request.getParameter("txt12N5") != null && request.getParameter("txt12N5") != "" )
        datalle12.setNum_5(Integer.parseInt(request.getParameter("txt12N5")));
        
        if(request.getParameter("txt12N6") != null && request.getParameter("txt12N6") != "" )
        datalle12.setNum_6(Integer.parseInt(request.getParameter("txt12N6")));
        
        if(request.getParameter("txt12N7") != null && request.getParameter("txt12N7") != "" )
        datalle12.setNum_7(Integer.parseInt(request.getParameter("txt12N7")));
        
        if(request.getParameter("txt12N8") != null && request.getParameter("txt12N8") != "" )
        datalle12.setNum_8(Integer.parseInt(request.getParameter("txt12N8")));
         
        if(request.getParameter("txt12N9") != null && request.getParameter("txt12N9") != "" )
        datalle12.setNum_9(Integer.parseInt(request.getParameter("txt12N9")));
        
        if(request.getParameter("txt12N10") != null && request.getParameter("txt12N10") != "" )
        datalle12.setNum_10(Integer.parseInt(request.getParameter("txt12N10")));
        
        if(request.getParameter("txt12N11") != null && request.getParameter("txt12N11") != "" )
        datalle12.setNum_11(Integer.parseInt(request.getParameter("txt12N11")));
        
        if(request.getParameter("txt12N12") != null && request.getParameter("txt12N12") != "" )
        datalle12.setNum_12(Integer.parseInt(request.getParameter("txt12N12")));
        
         entidad.getList().add(datalle12);
         
         entDetalleBrotacion datalle13 = new entDetalleBrotacion();
        
        if(request.getParameter("txt13N1") != null && request.getParameter("txt13N1") != "" )
        datalle13.setNum_1(Integer.parseInt(request.getParameter("txt13N1")));
        
        if(request.getParameter("txt13N2") != null && request.getParameter("txt13N2") != "" )
        datalle13.setNum_2(Integer.parseInt(request.getParameter("txt13N2")));
        
        if(request.getParameter("txt13N3") != null && request.getParameter("txt13N3") != "" )
        datalle13.setNum_3(Integer.parseInt(request.getParameter("txt13N3")));
        
        if(request.getParameter("txt13N4") != null && request.getParameter("txt13N4") != "" )
        datalle13.setNum_4(Integer.parseInt(request.getParameter("txt13N4")));
        
        if(request.getParameter("txt13N5") != null && request.getParameter("txt13N5") != "" )
        datalle13.setNum_5(Integer.parseInt(request.getParameter("txt13N5")));
        
        if(request.getParameter("txt13N6") != null && request.getParameter("txt13N6") != "" )
        datalle13.setNum_6(Integer.parseInt(request.getParameter("txt13N6")));
        
        if(request.getParameter("txt13N7") != null && request.getParameter("txt13N7") != "" )
        datalle13.setNum_7(Integer.parseInt(request.getParameter("txt13N7")));
        
        if(request.getParameter("txt13N8") != null && request.getParameter("txt13N8") != "" )
        datalle13.setNum_8(Integer.parseInt(request.getParameter("txt13N8")));
         
        if(request.getParameter("txt13N9") != null && request.getParameter("txt13N9") != "" )
        datalle13.setNum_9(Integer.parseInt(request.getParameter("txt13N9")));
        
        if(request.getParameter("txt13N10") != null && request.getParameter("txt13N10") != "" )
        datalle13.setNum_10(Integer.parseInt(request.getParameter("txt13N10")));
        
        if(request.getParameter("txt13N11") != null && request.getParameter("txt13N11") != "" )
        datalle13.setNum_11(Integer.parseInt(request.getParameter("txt13N11")));
        
        if(request.getParameter("txt13N12") != null && request.getParameter("txt13N12") != "" )
        datalle13.setNum_12(Integer.parseInt(request.getParameter("txt13N12")));
        
         entidad.getList().add(datalle13);
         
         entDetalleBrotacion datalle14 = new entDetalleBrotacion();
        
        if(request.getParameter("txt14N1") != null && request.getParameter("txt14N1") != "" )
        datalle14.setNum_1(Integer.parseInt(request.getParameter("txt14N1")));
        
        if(request.getParameter("txt14N2") != null && request.getParameter("txt14N2") != "" )
        datalle14.setNum_2(Integer.parseInt(request.getParameter("txt14N2")));
        
        if(request.getParameter("txt14N3") != null && request.getParameter("txt14N3") != "" )
        datalle14.setNum_3(Integer.parseInt(request.getParameter("txt14N3")));
        
        if(request.getParameter("txt14N4") != null && request.getParameter("txt14N4") != "" )
        datalle14.setNum_4(Integer.parseInt(request.getParameter("txt14N4")));
        
        if(request.getParameter("txt14N5") != null && request.getParameter("txt14N5") != "" )
        datalle14.setNum_5(Integer.parseInt(request.getParameter("txt14N5")));
        
        if(request.getParameter("txt14N6") != null && request.getParameter("txt14N6") != "" )
        datalle14.setNum_6(Integer.parseInt(request.getParameter("txt14N6")));
        
        if(request.getParameter("txt14N7") != null && request.getParameter("txt14N7") != "" )
        datalle14.setNum_7(Integer.parseInt(request.getParameter("txt14N7")));
        
        if(request.getParameter("txt14N8") != null && request.getParameter("txt14N8") != "" )
        datalle14.setNum_8(Integer.parseInt(request.getParameter("txt14N8")));
         
        if(request.getParameter("txt14N9") != null && request.getParameter("txt14N9") != "" )
        datalle14.setNum_9(Integer.parseInt(request.getParameter("txt14N9")));
        
        if(request.getParameter("txt14N10") != null && request.getParameter("txt14N10") != "" )
        datalle14.setNum_10(Integer.parseInt(request.getParameter("txt14N10")));
        
        if(request.getParameter("txt14N11") != null && request.getParameter("txt14N11") != "" )
        datalle14.setNum_11(Integer.parseInt(request.getParameter("txt14N11")));
        
        if(request.getParameter("txt14N12") != null && request.getParameter("txt14N12") != "" )
        datalle14.setNum_12(Integer.parseInt(request.getParameter("txt14N12")));
        
         entidad.getList().add(datalle14);
         
         
         
        if(pos>=0)
        {
            if(objSession.getObjBotacion().getId_brotacion()>0)
            {
                entidad.setSeleccion(true);
                entidad.setId_cabecera_brotacion(objSession.getObjBotacion().getList().get(pos).getId_cabecera_brotacion());
            }
            
            objSession.getObjBotacion().getList().remove(pos);
            objSession.getObjBotacion().getList().add(pos, entidad);
        }
        else
        {
            objSession.getObjBotacion().getList().add(entidad);
        }
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);

    }
}
%>