<%@page import="Entidades.entDetalleBrotacion"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
if(request.getParameter("posicion") != null && request.getParameter("posicion") != "" )
{
int pos = Integer.parseInt(request.getParameter("posicion"))-1;    

%>
<div id="tabla">
<form  method="get" id="reg_form_tabla">   
<table id="lista" class="table table-bordered table-striped table_vam">
<thead>
<tr>
        <th>NºM</th>
        <th>NºH</th>
        <th>NºP</th>
        <th>N°S/P</th>
        <th>N°C/P</th>
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
        <th>16</th>

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjBotacion()!=null)
for(int i=0;i<objSession.getObjBotacion().getList().size();i++)
{
if(pos==i)
{
%>    
<tr>
<td><%=(i+1)%></td>
<td><input type="text" style="width:15px;" id="txtNH" name="txtNH" value="<%=objSession.getObjBotacion().getList().get(i).getNum_hilera()%>" /></td>
<td><input type="text" style="width:15px;"  id="txtNP" name="txtNP" value="<%=objSession.getObjBotacion().getList().get(i).getNum_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNSP" name="txtNSP" value="<%=objSession.getObjBotacion().getList().get(i).getNum_salida_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNCP" name="txtNCP" value="<%=objSession.getObjBotacion().getList().get(i).getNum_cargador_planta()%>"/></td>                                                                                                        


<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N1" name="txt0N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_1()%>"  /></td>
            <td><input type="text" style="width:10px;" id="txt0N2" name="txt0N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N3" name="txt0N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N4" name="txt0N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N5" name="txt0N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N6" name="txt0N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N7" name="txt0N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N8" name="txt0N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N9" name="txt0N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N10" name="txt0N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N11" name="txt0N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt0N12" name="txt0N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(0).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N1" name="txt1N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N2" name="txt1N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N3" name="txt1N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N4" name="txt1N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N5" name="txt1N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N6" name="txt1N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N7" name="txt1N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N8" name="txt1N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N9" name="txt1N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N10" name="txt1N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N11" name="txt1N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N12" name="txt1N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(1).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N1" name="txt2N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N2" name="txt2N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N3" name="txt2N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N4" name="txt2N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_4()%>" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N5" name="txt2N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N6" name="txt2N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N7" name="txt2N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N8" name="txt2N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N9" name="txt2N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N10" name="txt2N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N11" name="txt2N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt2N12" name="txt2N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(2).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N1" name="txt3N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N2" name="txt3N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N3" name="txt3N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N4" name="txt3N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N5" name="txt3N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N6" name="txt3N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N7" name="txt3N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N8" name="txt3N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N9" name="txt3N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N10" name="txt3N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N11" name="txt3N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt3N12" name="txt3N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(3).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N1" name="txt4N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N2" name="txt4N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N3" name="txt4N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N4" name="txt4N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N5" name="txt4N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N6" name="txt4N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N7" name="txt4N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N8" name="txt4N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N9" name="txt4N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N10" name="txt4N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N11" name="txt4N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt4N12" name="txt4N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(4).getNum_12()%>"/></td>
        </tr>

    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N1" name="txt5N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N2" name="txt5N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N3" name="txt5N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N4" name="txt5N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N5" name="txt5N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N6" name="txt5N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N7" name="txt5N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N8" name="txt5N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N9" name="txt5N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N10" name="txt5N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N11" name="txt5N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt5N12" name="txt5N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(5).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N1" name="txt6N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N2" name="txt6N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N3" name="txt6N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N4" name="txt6N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N5" name="txt6N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N6" name="txt6N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N7" name="txt6N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N8" name="txt6N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N9" name="txt6N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N10" name="txt6N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N11" name="txt6N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt6N12" name="txt6N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(6).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N1" name="txt7N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N2" name="txt7N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N3" name="txt7N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N4" name="txt7N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N5" name="txt7N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N6" name="txt7N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N7" name="txt7N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N8" name="txt7N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N9" name="txt7N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N10" name="txt7N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N11" name="txt7N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt7N12" name="txt7N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(7).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N1" name="txt8N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N2" name="txt8N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N3" name="txt8N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N4" name="txt8N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N5" name="txt8N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N6" name="txt8N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N7" name="txt8N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N8" name="txt8N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N9" name="txt8N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N10" name="txt8N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N11" name="txt8N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt8N12" name="txt8N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(8).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N1" name="txt9N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N2" name="txt9N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N3" name="txt9N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N4" name="txt9N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N5" name="txt9N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N6" name="txt9N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N7" name="txt9N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N8" name="txt9N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N9" name="txt9N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N10" name="txt9N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N11" name="txt9N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt9N12" name="txt9N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(9).getNum_12()%>"/></td>
        </tr>

    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N1" name="txt10N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N2" name="txt10N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N3" name="txt10N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N4" name="txt10N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N5" name="txt10N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N6" name="txt10N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N7" name="txt10N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N8" name="txt10N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N9" name="txt10N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N10" name="txt10N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N11" name="txt10N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt10N12" name="txt10N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(10).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N1" name="txt11N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N2" name="txt11N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N3" name="txt11N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N4" name="txt11N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N5" name="txt11N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N6" name="txt11N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N7" name="txt11N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N8" name="txt11N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N9" name="txt11N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N10" name="txt11N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt1N11" name="txt11N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt11N12" name="txt11N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(11).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N1" name="txt12N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N2" name="txt12N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N3" name="txt12N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N4" name="txt12N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N5" name="txt12N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N6" name="txt12N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N7" name="txt12N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N8" name="txt12N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N9" name="txt12N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N10" name="txt12N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N11" name="txt12N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt12N12" name="txt12N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(12).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N1" name="txt13N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N2" name="txt13N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N3" name="txt13N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N4" name="txt13N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N5" name="txt13N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N6" name="txt13N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N7" name="txt13N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N8" name="txt13N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N9" name="txt13N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N10" name="txt13N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N11" name="txt13N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt13N12" name="txt13N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(13).getNum_12()%>"/></td>
        </tr>

    </table>
</td>

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N1" name="txt14N1" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_1()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N2" name="txt14N2" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_2()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N3" name="txt14N3" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_3()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N4" name="txt14N4" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_4()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N5" name="txt14N5" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_5()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N6" name="txt14N6" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_6()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N7" name="txt14N7" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_7()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N8" name="txt14N8" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_8()%>"/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N9" name="txt14N9" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_9()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N10" name="txt14N10" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_10()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N11" name="txt14N11" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_11()%>"/></td>
            <td><input type="text" style="width:10px;" id="txt14N12" name="txt14N12" value="<%=objSession.getObjBotacion().getList().get(i).getList().get(14).getNum_12()%>"/></td>
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
<td><%=objSession.getObjBotacion().getList().get(i).getNum_hilera()%></td>
<td><%=objSession.getObjBotacion().getList().get(i).getNum_planta()%></td>
<td><%=objSession.getObjBotacion().getList().get(i).getNum_salida_planta()%></td>
<td><%=objSession.getObjBotacion().getList().get(i).getNum_cargador_planta()%></td>


<%for(entDetalleBrotacion entidad : objSession.getObjBotacion().getList().get(i).getList())
{%>
        
<td>
    <table class="table table-bordered table-striped table_vam">
        <tr>
            <td><%=entidad.getNum_1()%></td>
            <td><%=entidad.getNum_2()%></td>
            <td><%=entidad.getNum_3()%></td>
            <td><%=entidad.getNum_4()%></td>
        </tr>
        <tr>
            <td><%=entidad.getNum_5()%></td>
            <td><%=entidad.getNum_6()%></td>
            <td><%=entidad.getNum_7()%></td>
            <td><%=entidad.getNum_8()%></td>
        </tr>
        <tr>
            <td><%=entidad.getNum_9()%></td>
            <td><%=entidad.getNum_10()%></td>
            <td><%=entidad.getNum_11()%></td>
            <td><%=entidad.getNum_12()%></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N5" name="txt0N5" /></td>
            <td><input type="text" style="width:10px;" id="txt0N6" name="txt0N6" /></td>
            <td><input type="text" style="width:10px;" id="txt0N7" name="txt0N7" /></td>
            <td><input type="text" style="width:10px;" id="txt0N8" name="txt0N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt0N9" name="txt0N9" /></td>
            <td><input type="text" style="width:10px;" id="txt0N10" name="txt0N10" /></td>
            <td><input type="text" style="width:10px;" id="txt0N11" name="txt0N11" /></td>
            <td><input type="text" style="width:10px;" id="txt0N12" name="txt0N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N5" name="txt1N5" /></td>
            <td><input type="text" style="width:10px;" id="txt1N6" name="txt1N6" /></td>
            <td><input type="text" style="width:10px;" id="txt1N7" name="txt1N7" /></td>
            <td><input type="text" style="width:10px;" id="txt1N8" name="txt1N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt1N9" name="txt1N9" /></td>
            <td><input type="text" style="width:10px;" id="txt1N10" name="txt1N10" /></td>
            <td><input type="text" style="width:10px;" id="txt1N11" name="txt1N11" /></td>
            <td><input type="text" style="width:10px;" id="txt1N12" name="txt1N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N5" name="txt2N5" /></td>
            <td><input type="text" style="width:10px;" id="txt2N6" name="txt2N6" /></td>
            <td><input type="text" style="width:10px;" id="txt2N7" name="txt2N7" /></td>
            <td><input type="text" style="width:10px;" id="txt2N8" name="txt2N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt2N9" name="txt2N9" /></td>
            <td><input type="text" style="width:10px;" id="txt2N10" name="txt2N10" /></td>
            <td><input type="text" style="width:10px;" id="txt2N11" name="txt2N11" /></td>
            <td><input type="text" style="width:10px;" id="txt2N12" name="txt2N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N5" name="txt3N5" /></td>
            <td><input type="text" style="width:10px;" id="txt3N6" name="txt3N6" /></td>
            <td><input type="text" style="width:10px;" id="txt3N7" name="txt3N7" /></td>
            <td><input type="text" style="width:10px;" id="txt3N8" name="txt3N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt3N9" name="txt3N9" /></td>
            <td><input type="text" style="width:10px;" id="txt3N10" name="txt3N10" /></td>
            <td><input type="text" style="width:10px;" id="txt3N11" name="txt3N11" /></td>
            <td><input type="text" style="width:10px;" id="txt3N12" name="txt3N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N5" name="txt4N5" /></td>
            <td><input type="text" style="width:10px;" id="txt4N6" name="txt4N6" /></td>
            <td><input type="text" style="width:10px;" id="txt4N7" name="txt4N7" /></td>
            <td><input type="text" style="width:10px;" id="txt4N8" name="txt4N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt4N9" name="txt4N9" /></td>
            <td><input type="text" style="width:10px;" id="txt4N10" name="txt4N10" /></td>
            <td><input type="text" style="width:10px;" id="txt4N11" name="txt4N11" /></td>
            <td><input type="text" style="width:10px;" id="txt4N12" name="txt4N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N5" name="txt5N5" /></td>
            <td><input type="text" style="width:10px;" id="txt5N6" name="txt5N6" /></td>
            <td><input type="text" style="width:10px;" id="txt5N7" name="txt5N7" /></td>
            <td><input type="text" style="width:10px;" id="txt5N8" name="txt5N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt5N9" name="txt5N9" /></td>
            <td><input type="text" style="width:10px;" id="txt5N10" name="txt5N10" /></td>
            <td><input type="text" style="width:10px;" id="txt5N11" name="txt5N11" /></td>
            <td><input type="text" style="width:10px;" id="txt5N12" name="txt5N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N5" name="txt6N5" /></td>
            <td><input type="text" style="width:10px;" id="txt6N6" name="txt6N6" /></td>
            <td><input type="text" style="width:10px;" id="txt6N7" name="txt6N7" /></td>
            <td><input type="text" style="width:10px;" id="txt6N8" name="txt6N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt6N9" name="txt6N9" /></td>
            <td><input type="text" style="width:10px;" id="txt6N10" name="txt6N10" /></td>
            <td><input type="text" style="width:10px;" id="txt6N11" name="txt6N11" /></td>
            <td><input type="text" style="width:10px;" id="txt6N12" name="txt6N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N5" name="txt7N5" /></td>
            <td><input type="text" style="width:10px;" id="txt7N6" name="txt7N6" /></td>
            <td><input type="text" style="width:10px;" id="txt7N7" name="txt7N7" /></td>
            <td><input type="text" style="width:10px;" id="txt7N8" name="txt7N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt7N9" name="txt7N9" /></td>
            <td><input type="text" style="width:10px;" id="txt7N10" name="txt7N10" /></td>
            <td><input type="text" style="width:10px;" id="txt7N11" name="txt7N11" /></td>
            <td><input type="text" style="width:10px;" id="txt7N12" name="txt7N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N5" name="txt8N5" /></td>
            <td><input type="text" style="width:10px;" id="txt8N6" name="txt8N6" /></td>
            <td><input type="text" style="width:10px;" id="txt8N7" name="txt8N7" /></td>
            <td><input type="text" style="width:10px;" id="txt8N8" name="txt8N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt8N9" name="txt8N9" /></td>
            <td><input type="text" style="width:10px;" id="txt8N10" name="txt8N10" /></td>
            <td><input type="text" style="width:10px;" id="txt8N11" name="txt8N11" /></td>
            <td><input type="text" style="width:10px;" id="txt8N12" name="txt8N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N5" name="txt9N5" /></td>
            <td><input type="text" style="width:10px;" id="txt9N6" name="txt9N6" /></td>
            <td><input type="text" style="width:10px;" id="txt9N7" name="txt9N7" /></td>
            <td><input type="text" style="width:10px;" id="txt9N8" name="txt9N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt9N9" name="txt9N9" /></td>
            <td><input type="text" style="width:10px;" id="txt9N10" name="txt9N10" /></td>
            <td><input type="text" style="width:10px;" id="txt9N11" name="txt9N11" /></td>
            <td><input type="text" style="width:10px;" id="txt9N12" name="txt9N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N5" name="txt10N5" /></td>
            <td><input type="text" style="width:10px;" id="txt10N6" name="txt10N6" /></td>
            <td><input type="text" style="width:10px;" id="txt10N7" name="txt10N7" /></td>
            <td><input type="text" style="width:10px;" id="txt10N8" name="txt10N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt10N9" name="txt10N9" /></td>
            <td><input type="text" style="width:10px;" id="txt10N10" name="txt10N10" /></td>
            <td><input type="text" style="width:10px;" id="txt10N11" name="txt10N11" /></td>
            <td><input type="text" style="width:10px;" id="txt10N12" name="txt10N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N5" name="txt11N5" /></td>
            <td><input type="text" style="width:10px;" id="txt11N6" name="txt11N6" /></td>
            <td><input type="text" style="width:10px;" id="txt11N7" name="txt11N7" /></td>
            <td><input type="text" style="width:10px;" id="txt11N8" name="txt11N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt11N9" name="txt11N9" /></td>
            <td><input type="text" style="width:10px;" id="txt11N10" name="txt11N10" /></td>
            <td><input type="text" style="width:10px;" id="txt1N11" name="txt11N11" /></td>
            <td><input type="text" style="width:10px;" id="txt11N12" name="txt11N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N5" name="txt12N5" /></td>
            <td><input type="text" style="width:10px;" id="txt12N6" name="txt12N6" /></td>
            <td><input type="text" style="width:10px;" id="txt12N7" name="txt12N7" /></td>
            <td><input type="text" style="width:10px;" id="txt12N8" name="txt12N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt12N9" name="txt12N9" /></td>
            <td><input type="text" style="width:10px;" id="txt12N10" name="txt12N10" /></td>
            <td><input type="text" style="width:10px;" id="txt12N11" name="txt12N11" /></td>
            <td><input type="text" style="width:10px;" id="txt12N12" name="txt12N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N5" name="txt13N5" /></td>
            <td><input type="text" style="width:10px;" id="txt13N6" name="txt13N6" /></td>
            <td><input type="text" style="width:10px;" id="txt13N7" name="txt13N7" /></td>
            <td><input type="text" style="width:10px;" id="txt13N8" name="txt13N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt13N9" name="txt13N9" /></td>
            <td><input type="text" style="width:10px;" id="txt13N10" name="txt13N10" /></td>
            <td><input type="text" style="width:10px;" id="txt13N11" name="txt13N11" /></td>
            <td><input type="text" style="width:10px;" id="txt13N12" name="txt13N12" /></td>
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
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N5" name="txt14N5" /></td>
            <td><input type="text" style="width:10px;" id="txt14N6" name="txt14N6" /></td>
            <td><input type="text" style="width:10px;" id="txt14N7" name="txt14N7" /></td>
            <td><input type="text" style="width:10px;" id="txt14N8" name="txt14N8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txt14N9" name="txt14N9" /></td>
            <td><input type="text" style="width:10px;" id="txt14N10" name="txt14N10" /></td>
            <td><input type="text" style="width:10px;" id="txt14N11" name="txt14N11" /></td>
            <td><input type="text" style="width:10px;" id="txt14N12" name="txt14N12" /></td>
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

<script type="text/javascript">
$(function () { 

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
                   //$("#abrirCarga").click();
                var url = "operaciones/brotacion/add_list_tabla_temp.jsp"; 
                
                $.ajax({
                       type: "POST",
                       url: url,
                       data: $("#reg_form_tabla").serialize(), 
                       success: function(data)
                       {
                         tablaTemp(0);
                            // $("#cerrarCarga").trigger("click");
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
            txt0N11: { digits:true  },
            txt0N12: { digits:true  },

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
            txt1N11: { digits:true  },
            txt1N12: { digits:true  },

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
            txt2N11: { digits:true  },
            txt2N12: { digits:true  },

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
            txt3N11: { digits:true  },
            txt3N12: { digits:true  },

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
            txt4N11: { digits:true  },
            txt4N12: { digits:true  },

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
            txt5N11: { digits:true  },
            txt5N12: { digits:true  },

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
            txt6N11: { digits:true  },
            txt6N12: { digits:true  },

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
            txt7N11: { digits:true  },
            txt7N12: { digits:true  },

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
            txt8N11: { digits:true  },
            txt8N12: { digits:true  },

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
            txt9N11: { digits:true  },
            txt9N12: { digits:true  },

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
            txt10N11: { digits:true  },
            txt10N12: { digits:true  },

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
            txt11N11: { digits:true  },
            txt11N12: { digits:true  },

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
            txt12N11: { digits:true  },
            txt12N12: { digits:true  },

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
            txt13N11: { digits:true  },
            txt13N12: { digits:true  },

            txt14N1: { digits:true  },
            txt14N2: { digits:true  },
            txt14N3: { digits:true  },
            txt14N4: { digits:true  },
            txt14N5: { digits:true  },
            txt14N6: { digits:true  },
            txt14N7: { digits:true  },
            txt14N8: { digits:true  },
            txt14N9: { digits:true  },
            txt14N10: { digits:true  },
            txt14N11: { digits:true  },
            txt14N12: { digits:true  }

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
 
});
</script>

<%}}%>  
           