<%@page import="Com.Operaciones"%>
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entDetalleDesbrote"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
if(request.getParameter("posicion") != null && request.getParameter("posicion") != "" )
{
 String Titulo="Grabar";
 String Boton="Limpiar";
 String nEvaluador="Nombre";   
 String cEvluador="Código ERP";   
 String idEvaluador="value=''"; 
 String idEvaluadorL="";  
 
 String nLote="Lote";   
 String nCamapania="Campaña";  
 String idCampaniaLote="value=''"; 
 String idCampaniaLoteL="";
 
 String estadoL="$('input:radio[name=rbEstado]').attr('checked',false);";
 String eActivo="";
 String eDesactivo="";
 if(objSession.getObjDesbrote()!=null)
 {
     if(objSession.getObjDesbrote().getId_desbrote()>0)
     {
         Titulo="Editar";
         Boton="Restaurar";
         nEvaluador=objSession.getObjDesbrote().getObjEvaluador().getNombre()+" "+objSession.getObjDesbrote().getObjEvaluador().getApellido();
         cEvluador=objSession.getObjDesbrote().getObjEvaluador().getCodigo_erp();
         idEvaluador="value='"+objSession.getObjDesbrote().getObjEvaluador().getId_evaluador()+"'";
         idEvaluadorL=""+objSession.getObjDesbrote().getObjEvaluador().getId_evaluador();
         
         nLote="Lote: "+objSession.getObjDesbrote().getObjCampaniaLote().getObjLote().getNombre();
         nCamapania="Campaña: "+objSession.getObjDesbrote().getObjCampaniaLote().getObjCampania().getNombre();
         idCampaniaLote="value='"+objSession.getObjDesbrote().getObjCampaniaLote().getId_campania_lote()+"'"; 
         idCampaniaLoteL=""+objSession.getObjDesbrote().getObjCampaniaLote().getId_campania_lote(); 
         if(objSession.getObjDesbrote().isEstado())
         {
            eActivo="checked='true'";
            estadoL="$('input:radio[name=rbEstado]')[0].checked = true;";
         }
         else
         {
              estadoL="$('input:radio[name=rbEstado]')[1].checked = true;";
              eDesactivo="checked='true'";
         }
                                              
     }
 }
 
int pos = Integer.parseInt(request.getParameter("posicion"))-1;    
%>
<div id="frame">


    
    
<div class="row-fluid">
    
<div class="span12">			
     <button class="btn btn-invert" onclick="clear_all()" type="button">Cancelar y Volver a las lista</button>
<form  method="get" id="reg_form_tabla">   
<table id="lista" class="table table-bordered table-striped table_vam">
<thead>
<tr>
        <th>Nº M</th>
        <th>Nº H</th>
        <th>Nº P</th>
        <th>N° S/P</th>
        <th>N° C/P</th>
        <th>1</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
        <th>5</th>
        <th>6</th>
        <th>7</th>
        <th>8</th>
        <th>9</th>
        <th>10</th>
        <th>11</th>
        <th>12</th>
        <th>13</th>
        <th>14</th>
        <th>15</th>
        <th>Acciones</th>

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjDesbrote()!=null)
for(int i=0;i<objSession.getObjDesbrote().getList().size();i++)
{
if(pos==i)
{
%>    
<tr>
<td><%=(i+1)%></td>
<td><input type="text" style="width:15px;" id="txtNH" name="txtNH" value="<%=objSession.getObjDesbrote().getList().get(i).getNum_hilera()%>" /></td>
<td><input type="text" style="width:15px;"  id="txtNP" name="txtNP" value="<%=objSession.getObjDesbrote().getList().get(i).getNum_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNSP" name="txtNSP" value="<%=objSession.getObjDesbrote().getList().get(i).getNum_salida_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNCP" name="txtNCP" value="<%=objSession.getObjDesbrote().getList().get(i).getNum_cargador_planta()%>"/></td>                                                                                                        

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N1" name="txt0N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N2" name="txt0N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N3" name="txt0N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N4" name="txt0N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N5" name="txt0N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N6" name="txt0N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N7" name="txt0N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N8" name="txt0N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N9" name="txt0N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt0N10" name="txt0N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(0).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N1" name="txt1N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N2" name="txt1N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N3" name="txt1N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N4" name="txt1N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N5" name="txt1N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N6" name="txt1N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N7" name="txt1N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N8" name="txt1N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N9" name="txt1N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt1N10" name="txt1N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(1).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N1" name="txt2N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N2" name="txt2N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N3" name="txt2N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N4" name="txt2N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N5" name="txt2N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N6" name="txt2N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N7" name="txt2N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N8" name="txt2N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N9" name="txt2N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt2N10" name="txt2N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(2).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N1" name="txt3N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N2" name="txt3N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N3" name="txt3N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N4" name="txt3N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N5" name="txt3N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N6" name="txt3N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N7" name="txt3N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N8" name="txt3N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N9" name="txt3N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt3N10" name="txt3N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(3).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N1" name="txt4N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N2" name="txt4N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N3" name="txt4N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N4" name="txt4N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N5" name="txt4N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N6" name="txt4N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N7" name="txt4N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N8" name="txt4N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N9" name="txt4N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt4N10" name="txt4N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(4).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N1" name="txt5N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N2" name="txt5N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N3" name="txt5N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N4" name="txt5N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N5" name="txt5N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N6" name="txt5N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N7" name="txt5N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N8" name="txt5N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N9" name="txt5N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt5N10" name="txt5N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(5).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N1" name="txt6N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N2" name="txt6N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N3" name="txt6N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N4" name="txt6N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N5" name="txt6N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N6" name="txt6N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N7" name="txt6N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N8" name="txt6N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N9" name="txt6N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt6N10" name="txt6N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(6).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N1" name="txt7N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N2" name="txt7N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N3" name="txt7N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N4" name="txt7N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N5" name="txt7N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N6" name="txt7N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N7" name="txt7N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N8" name="txt7N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N9" name="txt7N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt7N10" name="txt7N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(7).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N1" name="txt8N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N2" name="txt8N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N3" name="txt8N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N4" name="txt8N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N5" name="txt8N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N6" name="txt8N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N7" name="txt8N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N8" name="txt8N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N9" name="txt8N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt8N10" name="txt8N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(8).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N1" name="txt9N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N2" name="txt9N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N3" name="txt9N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N4" name="txt9N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N5" name="txt9N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N6" name="txt9N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N7" name="txt9N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N8" name="txt9N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N9" name="txt9N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt9N10" name="txt9N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(9).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N1" name="txt10N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N2" name="txt10N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N3" name="txt10N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N4" name="txt10N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N5" name="txt10N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N6" name="txt10N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N7" name="txt10N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N8" name="txt10N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N9" name="txt10N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt10N10" name="txt10N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(10).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N1" name="txt11N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N2" name="txt11N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N3" name="txt11N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N4" name="txt11N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N5" name="txt11N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N6" name="txt11N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N7" name="txt11N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N8" name="txt11N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N9" name="txt11N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt11N10" name="txt11N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(11).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N1" name="txt12N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N2" name="txt12N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N3" name="txt12N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N4" name="txt12N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N5" name="txt12N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N6" name="txt12N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N7" name="txt12N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N8" name="txt12N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N9" name="txt12N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt12N10" name="txt12N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(12).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
     <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N1" name="txt13N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N2" name="txt13N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N3" name="txt13N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N4" name="txt13N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N5" name="txt13N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N6" name="txt13N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N7" name="txt13N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N8" name="txt13N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N9" name="txt13N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt13N10" name="txt13N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(13).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N1" name="txt14N1" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_1()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_1()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N2" name="txt14N2" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_2()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_2()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N3" name="txt14N3" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_3()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_3()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N4" name="txt14N4" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_4()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_4()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N5" name="txt14N5" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_5()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_5()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N6" name="txt14N6" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_6()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_6()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N7" name="txt14N7" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_7()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_7()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N8" name="txt14N8" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_8()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_8()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N9" name="txt14N9" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_9()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_9()+"'");%>/></td>
            <td><input type="text" style="width:10px;" id="txt14N10" name="txt14N10" <%if(objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_10()>-1) out.print("value='"+objSession.getObjDesbrote().getList().get(i).getList().get(14).getNum_10()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>

<td>

    <button class="comp_edit btn btn-primary btn-mini" type="submit">Grabar</button><br><br>

<button class="comp_edit btn btn-success btn-mini" onclick="tablaTemp(0)" type="button">Cancelar</button>
</td>

</tr>
<%
}else
{
%> 

<tr>
<td><%=(i+1)%></td>
<td><%=objSession.getObjDesbrote().getList().get(i).getNum_hilera()%></td>
<td><%=objSession.getObjDesbrote().getList().get(i).getNum_planta()%></td>
<td><%=objSession.getObjDesbrote().getList().get(i).getNum_salida_planta()%></td>
<td><%=objSession.getObjDesbrote().getList().get(i).getNum_cargador_planta()%></td>


<%for(entDetalleDesbrote entidad : objSession.getObjDesbrote().getList().get(i).getList())
{
%>
        
<td>
    <table class="table table-bordered table-striped table_vam">
        <tr>
            <td><%if(entidad.getNum_1()>-1) out.print(entidad.getNum_1());%></td>
            <td><%if(entidad.getNum_2()>-1) out.print(entidad.getNum_2());%></td>
            <td><%if(entidad.getNum_3()>-1) out.print(entidad.getNum_3());%></td>
            <td><%if(entidad.getNum_4()>-1) out.print(entidad.getNum_4());%></td>
            <td><%if(entidad.getNum_5()>-1) out.print(entidad.getNum_5());%></td>
        </tr>
        <tr>
            <td><%if(entidad.getNum_6()>-1) out.print(entidad.getNum_6());%></td>
            <td><%if(entidad.getNum_7()>-1) out.print(entidad.getNum_7());%></td>
            <td><%if(entidad.getNum_8()>-1) out.print(entidad.getNum_8());%></td>
            <td><%if(entidad.getNum_9()>-1) out.print(entidad.getNum_9());%></td>
            <td><%if(entidad.getNum_10()>-1) out.print(entidad.getNum_10());%></td>
        </tr>
        <tr>
            <td><%if(entidad.getNum_11()>-1) out.print(entidad.getNum_11());%></td>
            <td><%if(entidad.getNum_12()>-1) out.print(entidad.getNum_12());%></td>
            <td><%if(entidad.getNum_13()>-1) out.print(entidad.getNum_13());%></td>
            <td><%if(entidad.getNum_14()>-1) out.print(entidad.getNum_14());%></td>
            <td><%if(entidad.getNum_15()>-1) out.print(entidad.getNum_15());%></td>
        </tr>

    </table>
</td>
<%}%>

<td>
<button class="comp_edit btn btn-warning btn-mini" onclick="tablaTemp(<%=(i+1)%>)" type="button">Editar</button>
</td>

</tr> 
<%
}

}
if(pos==-1){
%>  
    
    
<tr>
<td></td>
<td><input type="text" style="width:15px;" id="txtNH" name="txtNH" /></td>
<td><input type="text" style="width:15px;"  id="txtNP" name="txtNP" /></td>
<td><input type="text" style="width:15px;"  id="txtNSP" name="txtNSP" /></td>
<td><input type="text" style="width:15px;"  id="txtNCP" name="txtNCP" /></td>                                                                                                        

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N1" name="txt0N1" /></td>
            <td><input type="text" style="width:10px;" id="txt0N2" name="txt0N2" /></td>
            <td><input type="text" style="width:10px;" id="txt0N3" name="txt0N3" /></td>
            <td><input type="text" style="width:10px;" id="txt0N4" name="txt0N4" /></td>
            <td><input type="text" style="width:10px;" id="txt0N5" name="txt0N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt0N6" name="txt0N6" /></td>
            <td><input type="text" style="width:10px;" id="txt0N7" name="txt0N7" /></td>
            <td><input type="text" style="width:10px;" id="txt0N8" name="txt0N8" /></td>
            <td><input type="text" style="width:10px;" id="txt0N9" name="txt0N9" /></td>
            <td><input type="text" style="width:10px;" id="txt0N10" name="txt0N10" /></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N1" name="txt1N1" /></td>
            <td><input type="text" style="width:10px;" id="txt1N2" name="txt1N2" /></td>
            <td><input type="text" style="width:10px;" id="txt1N3" name="txt1N3" /></td>
            <td><input type="text" style="width:10px;" id="txt1N4" name="txt1N4" /></td>
            <td><input type="text" style="width:10px;" id="txt1N5" name="txt1N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt1N6" name="txt1N6" /></td>
            <td><input type="text" style="width:10px;" id="txt1N7" name="txt1N7" /></td>
            <td><input type="text" style="width:10px;" id="txt1N8" name="txt1N8" /></td>
            <td><input type="text" style="width:10px;" id="txt1N9" name="txt1N9" /></td>
            <td><input type="text" style="width:10px;" id="txt1N10" name="txt1N10" /></td>
        </tr>
       
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N1" name="txt2N1" /></td>
            <td><input type="text" style="width:10px;" id="txt2N2" name="txt2N2" /></td>
            <td><input type="text" style="width:10px;" id="txt2N3" name="txt2N3" /></td>
            <td><input type="text" style="width:10px;" id="txt2N4" name="txt2N4" /></td>
            <td><input type="text" style="width:10px;" id="txt2N5" name="txt2N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt2N6" name="txt2N6" /></td>
            <td><input type="text" style="width:10px;" id="txt2N7" name="txt2N7" /></td>
            <td><input type="text" style="width:10px;" id="txt2N8" name="txt2N8" /></td>
            <td><input type="text" style="width:10px;" id="txt2N9" name="txt2N9" /></td>
            <td><input type="text" style="width:10px;" id="txt2N10" name="txt2N10" /></td>
        </tr>
        
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N1" name="txt3N1" /></td>
            <td><input type="text" style="width:10px;" id="txt3N2" name="txt3N2" /></td>
            <td><input type="text" style="width:10px;" id="txt3N3" name="txt3N3" /></td>
            <td><input type="text" style="width:10px;" id="txt3N4" name="txt3N4" /></td>
             <td><input type="text" style="width:10px;" id="txt3N5" name="txt3N5" /></td>
        </tr>
        <tr>           
            <td><input type="text" style="width:10px;" id="txt3N6" name="txt3N6" /></td>
            <td><input type="text" style="width:10px;" id="txt3N7" name="txt3N7" /></td>
            <td><input type="text" style="width:10px;" id="txt3N8" name="txt3N8" /></td>
            <td><input type="text" style="width:10px;" id="txt3N9" name="txt3N9" /></td>
            <td><input type="text" style="width:10px;" id="txt3N10" name="txt3N10" /></td>
        </tr>
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N1" name="txt4N1" /></td>
            <td><input type="text" style="width:10px;" id="txt4N2" name="txt4N2" /></td>
            <td><input type="text" style="width:10px;" id="txt4N3" name="txt4N3" /></td>
            <td><input type="text" style="width:10px;" id="txt4N4" name="txt4N4" /></td>
            <td><input type="text" style="width:10px;" id="txt4N5" name="txt4N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt4N6" name="txt4N6" /></td>
            <td><input type="text" style="width:10px;" id="txt4N7" name="txt4N7" /></td>
            <td><input type="text" style="width:10px;" id="txt4N8" name="txt4N8" /></td>
            <td><input type="text" style="width:10px;" id="txt4N9" name="txt4N9" /></td>
            <td><input type="text" style="width:10px;" id="txt4N10" name="txt4N10" /></td>
        </tr>
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N1" name="txt5N1" /></td>
            <td><input type="text" style="width:10px;" id="txt5N2" name="txt5N2" /></td>
            <td><input type="text" style="width:10px;" id="txt5N3" name="txt5N3" /></td>
            <td><input type="text" style="width:10px;" id="txt5N4" name="txt5N4" /></td>
            <td><input type="text" style="width:10px;" id="txt5N5" name="txt5N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt5N6" name="txt5N6" /></td>
            <td><input type="text" style="width:10px;" id="txt5N7" name="txt5N7" /></td>
            <td><input type="text" style="width:10px;" id="txt5N8" name="txt5N8" /></td>
            <td><input type="text" style="width:10px;" id="txt5N9" name="txt5N9" /></td>
            <td><input type="text" style="width:10px;" id="txt5N10" name="txt5N10" /></td>
        </tr>
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N1" name="txt6N1" /></td>
            <td><input type="text" style="width:10px;" id="txt6N2" name="txt6N2" /></td>
            <td><input type="text" style="width:10px;" id="txt6N3" name="txt6N3" /></td>
            <td><input type="text" style="width:10px;" id="txt6N4" name="txt6N4" /></td>
            <td><input type="text" style="width:10px;" id="txt6N5" name="txt6N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt6N6" name="txt6N6" /></td>
            <td><input type="text" style="width:10px;" id="txt6N7" name="txt6N7" /></td>
            <td><input type="text" style="width:10px;" id="txt6N8" name="txt6N8" /></td>
            <td><input type="text" style="width:10px;" id="txt6N9" name="txt6N9" /></td>
            <td><input type="text" style="width:10px;" id="txt6N10" name="txt6N10" /></td>
        </tr>
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N1" name="txt7N1" /></td>
            <td><input type="text" style="width:10px;" id="txt7N2" name="txt7N2" /></td>
            <td><input type="text" style="width:10px;" id="txt7N3" name="txt7N3" /></td>
            <td><input type="text" style="width:10px;" id="txt7N4" name="txt7N4" /></td>
            <td><input type="text" style="width:10px;" id="txt7N5" name="txt7N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt7N6" name="txt7N6" /></td>
            <td><input type="text" style="width:10px;" id="txt7N7" name="txt7N7" /></td>
            <td><input type="text" style="width:10px;" id="txt7N8" name="txt7N8" /></td>
            <td><input type="text" style="width:10px;" id="txt7N9" name="txt7N9" /></td>
            <td><input type="text" style="width:10px;" id="txt7N10" name="txt7N10" /></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N1" name="txt8N1" /></td>
            <td><input type="text" style="width:10px;" id="txt8N2" name="txt8N2" /></td>
            <td><input type="text" style="width:10px;" id="txt8N3" name="txt8N3" /></td>
            <td><input type="text" style="width:10px;" id="txt8N4" name="txt8N4" /></td>
             <td><input type="text" style="width:10px;" id="txt8N5" name="txt8N5" /></td>
        </tr>
        <tr>           
            <td><input type="text" style="width:10px;" id="txt8N6" name="txt8N6" /></td>
            <td><input type="text" style="width:10px;" id="txt8N7" name="txt8N7" /></td>
            <td><input type="text" style="width:10px;" id="txt8N8" name="txt8N8" /></td>
            <td><input type="text" style="width:10px;" id="txt8N9" name="txt8N9" /></td>
            <td><input type="text" style="width:10px;" id="txt8N10" name="txt8N10" /></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N1" name="txt9N1" /></td>
            <td><input type="text" style="width:10px;" id="txt9N2" name="txt9N2" /></td>
            <td><input type="text" style="width:10px;" id="txt9N3" name="txt9N3" /></td>
            <td><input type="text" style="width:10px;" id="txt9N4" name="txt9N4" /></td>
            <td><input type="text" style="width:10px;" id="txt9N5" name="txt9N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt9N6" name="txt9N6" /></td>
            <td><input type="text" style="width:10px;" id="txt9N7" name="txt9N7" /></td>
            <td><input type="text" style="width:10px;" id="txt9N8" name="txt9N8" /></td>
            <td><input type="text" style="width:10px;" id="txt9N9" name="txt9N9" /></td>
            <td><input type="text" style="width:10px;" id="txt9N10" name="txt9N10" /></td>
        </tr>
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N1" name="txt10N1" /></td>
            <td><input type="text" style="width:10px;" id="txt10N2" name="txt10N2" /></td>
            <td><input type="text" style="width:10px;" id="txt10N3" name="txt10N3" /></td>
            <td><input type="text" style="width:10px;" id="txt10N4" name="txt10N4" /></td>
            <td><input type="text" style="width:10px;" id="txt10N5" name="txt10N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt10N6" name="txt10N6" /></td>
            <td><input type="text" style="width:10px;" id="txt10N7" name="txt10N7" /></td>
            <td><input type="text" style="width:10px;" id="txt10N8" name="txt10N8" /></td>
            <td><input type="text" style="width:10px;" id="txt10N9" name="txt10N9" /></td>
            <td><input type="text" style="width:10px;" id="txt10N10" name="txt10N10" /></td>
        </tr>
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N1" name="txt11N1" /></td>
            <td><input type="text" style="width:10px;" id="txt11N2" name="txt11N2" /></td>
            <td><input type="text" style="width:10px;" id="txt11N3" name="txt11N3" /></td>
            <td><input type="text" style="width:10px;" id="txt11N4" name="txt11N4" /></td>
            <td><input type="text" style="width:10px;" id="txt11N5" name="txt11N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt11N6" name="txt11N6" /></td>
            <td><input type="text" style="width:10px;" id="txt11N7" name="txt11N7" /></td>
            <td><input type="text" style="width:10px;" id="txt11N8" name="txt11N8" /></td>
            <td><input type="text" style="width:10px;" id="txt11N9" name="txt11N9" /></td>
            <td><input type="text" style="width:10px;" id="txt11N10" name="txt11N10" /></td>
        </tr>
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N1" name="txt12N1" /></td>
            <td><input type="text" style="width:10px;" id="txt12N2" name="txt12N2" /></td>
            <td><input type="text" style="width:10px;" id="txt12N3" name="txt12N3" /></td>
            <td><input type="text" style="width:10px;" id="txt12N4" name="txt12N4" /></td>
            <td><input type="text" style="width:10px;" id="txt12N5" name="txt12N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt12N6" name="txt12N6" /></td>
            <td><input type="text" style="width:10px;" id="txt12N7" name="txt12N7" /></td>
            <td><input type="text" style="width:10px;" id="txt12N8" name="txt12N8" /></td>
            <td><input type="text" style="width:10px;" id="txt12N9" name="txt12N9" /></td>
            <td><input type="text" style="width:10px;" id="txt12N10" name="txt12N10" /></td>
        </tr>
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N1" name="txt13N1" /></td>
            <td><input type="text" style="width:10px;" id="txt13N2" name="txt13N2" /></td>
            <td><input type="text" style="width:10px;" id="txt13N3" name="txt13N3" /></td>
            <td><input type="text" style="width:10px;" id="txt13N4" name="txt13N4" /></td>
            <td><input type="text" style="width:10px;" id="txt13N5" name="txt13N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt13N6" name="txt13N6" /></td>
            <td><input type="text" style="width:10px;" id="txt13N7" name="txt13N7" /></td>
            <td><input type="text" style="width:10px;" id="txt13N8" name="txt13N8" /></td>
            <td><input type="text" style="width:10px;" id="txt13N9" name="txt13N9" /></td>
            <td><input type="text" style="width:10px;" id="txt13N10" name="txt13N10" /></td>
        </tr>
    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N1" name="txt14N1" /></td>
            <td><input type="text" style="width:10px;" id="txt14N2" name="txt14N2" /></td>
            <td><input type="text" style="width:10px;" id="txt14N3" name="txt14N3" /></td>
            <td><input type="text" style="width:10px;" id="txt14N4" name="txt14N4" /></td>
            <td><input type="text" style="width:10px;" id="txt14N5" name="txt14N5" /></td>
        </tr>
        <tr>            
            <td><input type="text" style="width:10px;" id="txt14N6" name="txt14N6" /></td>
            <td><input type="text" style="width:10px;" id="txt14N7" name="txt14N7" /></td>
            <td><input type="text" style="width:10px;" id="txt14N8" name="txt14N8" /></td>
            <td><input type="text" style="width:10px;" id="txt14N9" name="txt14N9" /></td>
            <td><input type="text" style="width:10px;" id="txt14N10" name="txt14N10" /></td>
        </tr>      
    </table>
</td>


<td>

    <button class="comp_edit btn btn-primary btn-mini" type="submit">Grabar</button><br><br>

<button class="comp_edit btn btn-danger btn-mini" onclick="tablaTemp(0)" type="button">Limpiar</button>
</td>

</tr>
<%
}
%>


</tbody>

</table>
<input type="hidden" id="posicion"  name="posicion" value="<%=pos%>" />
</form>

</div>
      
</div>

<%
if(objSession.getObjDesbrote()!=null)
{

%>


<div class="row-fluid">
    <div class="span4">	

    </div> 	
      <div class="span4">                       
                            <div class="row-fluid" id="g-map-top">
                                    <div class="span12">   
                                             <form  method="get" id="reg_form">
                                                  <div class="location_add_form well">
                                                      <div class="formSep">
                                                          <h3 class="heading"><%=Titulo%> Desbrote</h3>  
                                                          <div class="input-prepend">
                                                            <di id='Evaluador'>
                                                                  <blockquote >
                                                                      <p><%=nEvaluador%>
                                                                            <span class='add-on'>
                                                                                <a data-toggle='modal' data-backdrop='static' href='#ModalEvaluador'><i class='splashy-zoom'></i></a>
                                                                            </span> 
                                                                      </p>
                                                                      <blockquote><p><%=cEvluador%></p></blockquote>
                                                                  </blockquote>
                                                            </di>
                                                              <input type="text" id="idEvaluador"  name="idEvaluador" <%=idEvaluador%>/>
                                                          </div>
                                                          <div class="input-prepend">
                                                            <di id='CampaniaLote'>
                                                                    <blockquote >
                                                                        <p><%=nLote%>
                                                                              <span class='add-on'>
                                                                                  <a data-toggle='modal' data-backdrop='static' href='#ModalCampaniaLote'><i class='splashy-zoom'></i></a>
                                                                              </span> 
                                                                        </p>
                                                                        <blockquote><p><%=nCamapania%></p></blockquote>
                                                                    </blockquote>
                                                              </di>
                                                            <input type="text" id="idLoteCanpania"  name="idLoteCanpania" <%=idCampaniaLote%>/>
                                                           </div>
                                                           <div class="input-prepend">
                                                                <label>Estado</label>
                                                                <label class="radio inline">
                                                                    <input type="radio" value="1" id="rbEstado" name="rbEstado" <%=eActivo%>/>
                                                                    Activo
                                                                </label>
                                                                <label class="radio inline">
                                                                        <input type="radio" value="0" id="rbEstado" name="rbEstado" <%=eDesactivo%>/>
                                                                        Desactivado
                                                                </label>
                                                            </div>
                                                    </div>

                                                        <input type="hidden" id="IdDesbrote"  name="IdDesbrote" value="<%=objSession.getObjDesbrote().getId_desbrote()%>" />

                                                        <button class="btn btn-invert" type="submit"><%=Titulo%></button>

                                                        <button class="btn btn-invert" onclick="clear_form()" type="button"><%=Boton%></button>
                                                        
                                                        <%
                                                         if(objSession.getObjDesbrote()!=null)
                                                             if(objSession.getObjDesbrote().getId_desbrote()>0)
                                                             out.print("<button class='btn btn-invert' onclick='restaurar("+objSession.getObjDesbrote().getId_desbrote()+")' type='button'>Restaurar Todo</button>");
                                                        %>
                                                        
                                                 </div>
                                            </form>
                                    </div>
                            </div>
                    </div>
</div>
   


<%
}
%>


</div>

    <!-- Modal Evaluador -->	
<div class="modal hide fade" id="ModalEvaluador" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Evaluador</h3>
    </div>
    <div class="modal-body">
        <table id="tablaEvaluador" class="table table-striped location_table">
            <thead>
                    <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Código ERP</th>
                            <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            List<entEvaluador> lista=clsGestor.ListarEvaluador(false);
            if(lista!=null)
            for(entEvaluador entidad : lista)
            {
            %>

                <tr>
                    <td><%=entidad.getId_evaluador()%></td>
                    <td><%=entidad.getNombre()%></td>
                    <td><%=entidad.getApellido()%></td>
                    <td><%=entidad.getCodigo_erp()%></td>
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectEvaluador(<%=entidad.getId_evaluador()%>,'<%=entidad.getNombre()%> <%=entidad.getApellido()%>','<%=entidad.getCodigo_erp()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

                    </td>
                </tr>                                                            
            <%
            }
            %>
            </tbody>
        </table>

    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
    </div>
</div>     
            
 <!-- Modal Lote Campaña -->	
<div class="modal hide fade" id="ModalCampaniaLote" >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">×</button>
        <h3>Buscar Campaña de un Lote</h3>
    </div>
    <div class="modal-body">
        <table id="tablaCampaniaLote" class="table table-striped location_table">
            <thead>
                    <tr>
                           <th>Id</th>
                           <th>Lote</th>
                           <th>Campaña</th>
                           <th>Número de Plantas</th>
                           <th>Fecha de Poda</th>                          
                           <th>Acciones</th>
                    </tr>
            </thead> 
            <tbody>    
            <%
            SimpleDateFormat  fecha=new SimpleDateFormat("dd/MM/yyyy");
            List<entCampaniaLote> list=clsGestor.ListarCampaniaLote();
            if(lista!=null)
            for(entCampaniaLote entidad : list)
            {
            %>

                <tr>
                    <td><%=entidad.getId_campania_lote()%></td>
                    <td><%=entidad.getObjLote().getNombre()%></td>
                    <td><%=entidad.getObjCampania().getNombre()%></td>
                    <td><%=entidad.getNumero_plantas()%></td>
                    <td><%=fecha.format(entidad.getFechaPodaFormacion())%></td>                    
                    <td>
                        <a href="javascript:void(0)" data-dismiss="modal" onclick="selectCampaniaLote(<%=entidad.getId_campania_lote()%>,'<%=entidad.getObjLote().getNombre()%>','<%=entidad.getObjCampania().getNombre()%>')" class="comp_edit btn btn-success btn-mini">Seleccionar</a>

                    </td>
                </tr>                                                            
            <%
            }
            %>
            </tbody>
        </table>

    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" href="javascript:void(0)" class="btn">Cerrar</a>
    </div>
</div>                 
            
<script type="text/javascript">
function clear_all()
{
    smoke.confirm('Desea Cancelar Todo',function(e){
        if (!e){            
            clear();
        }
    }, {ok:"No", cancel:"Si"});
           

};
function restaurar(id)
{
    smoke.confirm('Desea Restaurar Todo',function(e){
        if (!e){            
            editar(id,0);
        }
    }, {ok:"No", cancel:"Si"});
           

};
function clear()
{
    $("#abrirCarga").click();                
  $.ajax({
            url: 'operaciones/desbrote/limpiar_tabla_temp.jsp',
            type: 'POST',
            success: function () {     
                    tabla();
            },
            contentType: false,
            processData: false
    });  
};
function clear_form()
{
 <%=estadoL%>
 $('#idEvaluador').val("<%=idEvaluadorL%>");               
 $('#Evaluador').html("<di id='Evaluador'><blockquote><p><%=nEvaluador%><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalEvaluador'><i class='splashy-zoom'></i></a></span></p><blockquote><p><%=cEvluador%></p></blockquote> </blockquote></di>");  
 $('#idLoteCanpania').val("<%=idCampaniaLoteL%>");                    
 $('#CampaniaLote').html("<di id='CampaniaLote'><blockquote><p><%=nLote%><span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalCampaniaLote'><i class='splashy-zoom'></i></a></span></p><blockquote><p><%=nCamapania%></p></blockquote> </blockquote></di>");  

};
function selectEvaluador(id,nombre,codigo)
{
  $('#idEvaluador').val(id);  
                                            
 $('#Evaluador').html("<di id='Evaluador'><blockquote><p>"+nombre+"  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalEvaluador'><i class='splashy-zoom'></i></a></span></p><blockquote><p>"+codigo+"</p></blockquote> </blockquote></di>");  
};
function selectCampaniaLote(id,lote,campania)
{
  $('#idLoteCanpania').val(id);  
                                            
 $('#CampaniaLote').html("<di id='CampaniaLote'><blockquote><p>Lote: "+lote+"  <span class='add-on'><a data-toggle='modal' data-backdrop='static' href='#ModalCampaniaLote'><i class='splashy-zoom'></i></a></span></p><blockquote><p>Campaña: "+campania+"</p></blockquote> </blockquote></di>");  
};
$(function () { 
  $("#cerrarCarga").trigger("click");
  $( "#idEvaluador" ).hide();
  $( "#idLoteCanpania" ).hide();
  
$('#tablaEvaluador').dataTable({
      "sDom": "<'row'<'span4'><'span4'f>r>t<'row'<'span4'i><'span4'>S>",
                                            "bDeferRender": true
}); 
$('#tablaCampaniaLote').dataTable({
"sDom": "<'row'<'span4'><'span4'f>r>t<'row'<'span4'i><'span4'>S>",
                                            "bDeferRender": true
}); 

$('#lista').dataTable({
       "sDom": "<'row'<'span2'><'span2'f>r>t<'row'<'span2'i><'span2'>S>",
       "sScrollX": "100%",
       "bDestrox": true,
        "bDeferRender": true
}); 


$('#reg_form_tabla').validate({
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
        highlight: function(element) {
                $(element).closest('div').addClass("f_error");
        },
        unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
        },
        submitHandler: function() {       
                var url = "operaciones/desbrote/add_list_tabla_temp.jsp"; 
                
                $.ajax({
                       type: "POST",
                       url: url,
                       data: $("#reg_form_tabla").serialize(), 
                       success: function()
                       {
                            tablaTemp(0);
                       }
                     });    
        },
    rules: {
            txtNH: { required: true, digits:true },
            txtNP: { required: true, digits:true },
            txtNSP: { required: true, digits:true },
            txtNCP: { required: true, digits:true },
            txt0N1: { digits:true  },
            txt0N2: { digits:true  },
            txt0N3: { digits:true  },
            txt0N4: { digits:true  },
            txt0N5: { digits:true  },
            txt0N6: { digits:true  },
            txt0N7: { digits:true  },
            txt0N8: { digits:true  },
            txt0N9: { digits:true  },
            txt0N10: { digits:true  },

            txt1N1: { digits:true  },
            txt1N2: { digits:true  },
            txt1N3: { digits:true  },
            txt1N4: { digits:true  },
            txt1N5: { digits:true  },
            txt1N6: { digits:true  },
            txt1N7: { digits:true  },
            txt1N8: { digits:true  },
            txt1N9: { digits:true  },
            txt1N10: { digits:true  },

            txt2N1: { digits:true  },
            txt2N2: { digits:true  },
            txt2N3: { digits:true  },
            txt2N4: { digits:true  },
            txt2N5: { digits:true  },
            txt2N6: { digits:true  },
            txt2N7: { digits:true  },
            txt2N8: { digits:true  },
            txt2N9: { digits:true  },
            txt2N10: { digits:true  },

            txt3N1: { digits:true  },
            txt3N2: { digits:true  },
            txt3N3: { digits:true  },
            txt3N4: { digits:true  },
            txt3N5: { digits:true  },
            txt3N6: { digits:true  },
            txt3N7: { digits:true  },
            txt3N8: { digits:true  },
            txt3N9: { digits:true  },
            txt3N10: { digits:true  },

            txt4N1: { digits:true  },
            txt4N2: { digits:true  },
            txt4N3: { digits:true  },
            txt4N4: { digits:true  },
            txt4N5: { digits:true  },
            txt4N6: { digits:true  },
            txt4N7: { digits:true  },
            txt4N8: { digits:true  },
            txt4N9: { digits:true  },
            txt4N10: { digits:true  },

            txt5N1: { digits:true  },
            txt5N2: { digits:true  },
            txt5N3: { digits:true  },
            txt5N4: { digits:true  },
            txt5N5: { digits:true  },
            txt5N6: { digits:true  },
            txt5N7: { digits:true  },
            txt5N8: { digits:true  },
            txt5N9: { digits:true  },
            txt5N10: { digits:true  },

            txt6N1: { digits:true  },
            txt6N2: { digits:true  },
            txt6N3: { digits:true  },
            txt6N4: { digits:true  },
            txt6N5: { digits:true  },
            txt6N6: { digits:true  },
            txt6N7: { digits:true  },
            txt6N8: { digits:true  },
            txt6N9: { digits:true  },
            txt6N10: { digits:true  },

            txt7N1: { digits:true  },
            txt7N2: { digits:true  },
            txt7N3: { digits:true  },
            txt7N4: { digits:true  },
            txt7N5: { digits:true  },
            txt7N6: { digits:true  },
            txt7N7: { digits:true  },
            txt7N8: { digits:true  },
            txt7N9: { digits:true  },
            txt7N10: { digits:true  },

            txt8N1: { digits:true  },
            txt8N2: { digits:true  },
            txt8N3: { digits:true  },
            txt8N4: { digits:true  },
            txt8N5: { digits:true  },
            txt8N6: { digits:true  },
            txt8N7: { digits:true  },
            txt8N8: { digits:true  },
            txt8N9: { digits:true  },
            txt8N10: { digits:true  },

            txt9N1: { digits:true  },
            txt9N2: { digits:true  },
            txt9N3: { digits:true  },
            txt9N4: { digits:true  },
            txt9N5: { digits:true  },
            txt9N6: { digits:true  },
            txt9N7: { digits:true  },
            txt9N8: { digits:true  },
            txt9N9: { digits:true  },
            txt9N10: { digits:true  },

            txt10N1: { digits:true  },
            txt10N2: { digits:true  },
            txt10N3: { digits:true  },
            txt10N4: { digits:true  },
            txt10N5: { digits:true  },
            txt10N6: { digits:true  },
            txt10N7: { digits:true  },
            txt10N8: { digits:true  },
            txt10N9: { digits:true  },
            txt10N10: { digits:true  },

            txt11N1: { digits:true  },
            txt11N2: { digits:true  },
            txt11N3: { digits:true  },
            txt11N4: { digits:true  },
            txt11N5: { digits:true  },
            txt11N6: { digits:true  },
            txt11N7: { digits:true  },
            txt11N8: { digits:true  },
            txt11N9: { digits:true  },
            txt11N10: { digits:true  },

            txt12N1: { digits:true  },
            txt12N2: { digits:true  },
            txt12N3: { digits:true  },
            txt12N4: { digits:true  },
            txt12N5: { digits:true  },
            txt12N6: { digits:true  },
            txt12N7: { digits:true  },
            txt12N8: { digits:true  },
            txt12N9: { digits:true  },
            txt12N10: { digits:true  },

            txt13N1: { digits:true  },
            txt13N2: { digits:true  },
            txt13N3: { digits:true  },
            txt13N4: { digits:true  },
            txt13N5: { digits:true  },
            txt13N6: { digits:true  },
            txt13N7: { digits:true  },
            txt13N8: { digits:true  },
            txt13N9: { digits:true  },
            txt13N10: { digits:true  },

            txt14N1: { digits:true  },
            txt14N2: { digits:true  },
            txt14N3: { digits:true  },
            txt14N4: { digits:true  },
            txt14N5: { digits:true  },
            txt14N6: { digits:true  },
            txt14N7: { digits:true  },
            txt14N8: { digits:true  },
            txt14N9: { digits:true  },
            txt14N10: { digits:true  }

    },
    invalidHandler: function(form, validator) {
    $.sticky("Hay algunos errores. Por favor corrijalos e intente de nuevo.", {autoclose : 5000, position: "top-right", type: "st-error" });
},
errorPlacement: function(error, element) {
    // Set positioning based on the elements position in the form
    var elem = $(element);

    // Check we have a valid error message
    if(!error.is(':empty')) {
            if( (elem.is(':checkbox')) || (elem.is(':radio')) ) {
                    // Apply the tooltip only if it isn't valid
                    elem.filter(':not(.valid)').parent('label').parent('div').find('.error_placement').qtip({
                            overwrite: false,
                            content: error,
                            position: {
                                    my: 'left bottom',
                                    at: 'center right',
                                    viewport: $(window),
                                    adjust: {
                                            x: 6
                                    }
                            },
                            show: {
                                    event: false,
                                    ready: true
                            },
                            hide: false,
                            style: {
                                    classes: 'ui-tooltip-red ui-tooltip-rounded' // Make it red... the classic error colour!
                            }
                    })
                    // If we have a tooltip on this element already, just update its content
                    .qtip('option', 'content.text', error);
            } else {
                    // Apply the tooltip only if it isn't valid
                    elem.filter(':not(.valid)').qtip({
                            overwrite: false,
                            content: error,
                            position: {
                                    my: 'bottom left',
                                    at: 'top right',
                                    viewport: $(window),
adjust: { x: -8, y: 6 }
                            },
                            show: {
                                    event: false,
                                    ready: true
                            },
                            hide: false,
                            style: {
                                    classes: 'ui-tooltip-red ui-tooltip-rounded' // Make it red... the classic error colour!
                            }
                    })
                    // If we have a tooltip on this element already, just update its content
                    .qtip('option', 'content.text', error);
            };

    }
    // If the error is empty, remove the qTip
    else {
            if( (elem.is(':checkbox')) || (elem.is(':radio')) ) {
                    elem.parent('label').parent('div').find('.error_placement').qtip('destroy');
            } else {
                    elem.qtip('destroy');
            }
    }
},
success: $.noop // Odd workaround for errorPlacement not firing!
});
 

    $('#reg_form').validate({
        lang: 'es',
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
        ignore: ".ignore",
            submitHandler: function() {    
                
                smoke.confirm('Desea <%=Titulo%> ',function(e){
                if (!e){   
                    $("#abrirCarga").click();                    
                    var url = "operaciones/desbrote/insert.jsp"; 

                    $.ajax({
                           type: "POST",
                           url: url,
                           data: $("#reg_form").serialize(), 
                           success: function(data)
                           {
                               if(data==-1)
                                 $.sticky("Error al Registrar.", {autoclose : 5000, position: "top-center" });
                                else if(data==0)
                                {
                                   $.sticky("Se Actualizo Correctamente.", {autoclose : 5000, position: "top-center" });

                               }
                                else if(data>0)
                                {
                                    tabla();
                                   $.sticky("Se Registro Correctamente.", {autoclose : 5000, position: "top-center" });  

                                }
                               $("#cerrarCarga").trigger("click");
                           }
                         });    
                                         }
                }, {ok:"No", cancel:"Si"});
     
            },
        rules: {
                idEvaluador: { required: true},
                idLoteCanpania: { required: true},
                rbEstado: { required: true }
        },
        highlight: function(element) {
                $(element).closest('div').addClass("f_error");
        },
        unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
        },
        errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
        }
    });
});
</script>

<%}}%>  
           