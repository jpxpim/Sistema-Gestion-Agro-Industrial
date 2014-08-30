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
    int size=0;
    int sum1=0;
    int sum2=0;
    int sum3=0;
    int sum1Total=0;
    int sum2Total=0;
    int sum3Total=0;
    int contarTotal=0;
    int contarsi0Total=0;
    int contarsi1Total=0;
    int contarsi2Total=0;
    int contarsi3Total=0;
    int contarsi4Total=0;
    int contarsi5Total=0;
    int contarsi6Total=0;
    int contarsi7Total=0;
    int contarsi8Total=0;
    int contarsi9Total=0;
    int contarsi10Total=0;
    int contarsi11Total=0;
    int contarsi12Total=0;
    int contarsi13Total=0;
    int contarsi14Total=0;
    int contarsiTotalSuma=0;
    
    double contarsi0Promedio=0;
    double contarsi1Promedio=0;
    double contarsi2Promedio=0;
    double contarsi3Promedio=0;
    double contarsi4Promedio=0;
    double contarsi5Promedio=0;
    double contarsi6Promedio=0;
    double contarsi7Promedio=0;
    double contarsi8Promedio=0;
    double contarsi9Promedio=0;
    double contarsi10Promedio=0;
    double contarsi11Promedio=0;
    double contarsi12Promedio=0;
    double contarsi13Promedio=0;
    double contarsi14Promedio=0;
    double contarsiPromedioTotal=0;

    
    int sum42menor=0;
    int sum42menorTotal=0;
    
    int contar=0;
    int contarsi0=0;
    int contarsi1=0;
    int contarsi2=0;
    int contarsi3=0;
    int contarsi4=0;
    int contarsi5=0;
    int contarsi6=0;
    int contarsi7=0;
    int contarsi8=0;
    int contarsi9=0;
    int contarsi10=0;
    int contarsi11=0;
    int contarsi12=0;
    int contarsi13=0;
    int contarsi14=0;
    int contarsiTotal=0;
%>
<div id="frame">


    
    
<div class="row-fluid">
    
<div class="span12">			
     <button class="btn btn-invert" onclick="clear_all()" type="button">Volver a las lista</button>
<table id="lista" class="table table-bordered table-striped table_vam">
<thead>
<tr>
        <th>Nº M</th>
        <th>Nº H</th>
        <th>N ºP</th>
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
        <th>ANTES</th>
        <th>N°BR (Desp)</th>
        <th><=42</th>
        <th>Cumple</th>
        <th>TOTAL</th>
        <th>0 R/C</th>
        <th>1 R/C</th>
        <th>2 R/C</th>
        <th>3 R/C</th>
        <th>4 R/C</th>
        <th>5 R/C</th>
        <th>6 R/C</th>
        <th>7 R/C</th>
        <th>8 R/C</th>
        <th>9 R/C</th>
        <th>10 R/C</th>
        <th>11 R/C</th>
        <th>12 R/C</th>
        <th>13 R/C</th>
        <th>14 R/C</th>        
        <th>SUMA</th>        

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjDesbrote()!=null)
{
    size=objSession.getObjDesbrote().getList().size();
for(int i=0;i<size;i++)
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
    if(entidad.getNum_1()>-1)
        sum1+=entidad.getNum_1();
    if(entidad.getNum_2()>-1)
        sum1+=entidad.getNum_2();
    if(entidad.getNum_3()>-1)
        sum1+=entidad.getNum_3();
    if(entidad.getNum_4()>-1)
        sum1+=entidad.getNum_4();
    if(entidad.getNum_5()>-1)
        sum1+=entidad.getNum_5();
    
    if(entidad.getNum_6()>-1)
    {
       if(entidad.getNum_6()==0)
           contarsi0++;
       else if(entidad.getNum_6()==1)
           contarsi1++;
       else if(entidad.getNum_6()==2)
           contarsi2++;
       else if(entidad.getNum_6()==3)
           contarsi3++;
       else if(entidad.getNum_6()==4)
           contarsi4++;
       else if(entidad.getNum_6()==5)
           contarsi5++;
       else if(entidad.getNum_6()==6)
           contarsi6++;
       else if(entidad.getNum_6()==7)
           contarsi7++;
       else if(entidad.getNum_6()==8)
           contarsi8++;
       else if(entidad.getNum_6()==9)
           contarsi9++;
       else if(entidad.getNum_6()==10)
           contarsi10++;
       else if(entidad.getNum_6()==11)
           contarsi11++;
       else if(entidad.getNum_6()==12)
           contarsi12++;
       else if(entidad.getNum_6()==13)
           contarsi13++;
       else if(entidad.getNum_6()==14)
           contarsi14++;
       sum2+=entidad.getNum_6(); 
    }
        
    if(entidad.getNum_7()>-1)
    {
       if(entidad.getNum_7()==0)
           contarsi0++;
       else if(entidad.getNum_7()==1)
           contarsi1++;
       else if(entidad.getNum_7()==2)
           contarsi2++;
       else if(entidad.getNum_7()==3)
           contarsi3++;
       else if(entidad.getNum_7()==4)
           contarsi4++;
       else if(entidad.getNum_7()==5)
           contarsi5++;
       else if(entidad.getNum_7()==6)
           contarsi6++;
       else if(entidad.getNum_7()==7)
           contarsi7++;
       else if(entidad.getNum_7()==8)
           contarsi8++;
       else if(entidad.getNum_7()==9)
           contarsi9++;
       else if(entidad.getNum_7()==10)
           contarsi10++;
       else if(entidad.getNum_7()==11)
           contarsi11++;
       else if(entidad.getNum_7()==12)
           contarsi12++;
       else if(entidad.getNum_7()==13)
           contarsi13++;
       else if(entidad.getNum_7()==14)
           contarsi14++;
       sum2+=entidad.getNum_7(); 
    }
    if(entidad.getNum_8()>-1)
    {
        if(entidad.getNum_8()==0)
           contarsi0++;
       else if(entidad.getNum_8()==1)
           contarsi1++;
       else if(entidad.getNum_8()==2)
           contarsi2++;
       else if(entidad.getNum_8()==3)
           contarsi3++;
       else if(entidad.getNum_8()==4)
           contarsi4++;
       else if(entidad.getNum_8()==5)
           contarsi5++;
       else if(entidad.getNum_8()==6)
           contarsi6++;
       else if(entidad.getNum_8()==7)
           contarsi7++;
       else if(entidad.getNum_8()==8)
           contarsi8++;
       else if(entidad.getNum_8()==9)
           contarsi9++;
       else if(entidad.getNum_8()==10)
           contarsi10++;
       else if(entidad.getNum_8()==11)
           contarsi11++;
       else if(entidad.getNum_8()==12)
           contarsi12++;
       else if(entidad.getNum_8()==13)
           contarsi13++;
       else if(entidad.getNum_8()==14)
           contarsi14++;
       sum2+=entidad.getNum_8(); 
    }
    if(entidad.getNum_9()>-1)
    {
        if(entidad.getNum_9()==0)
           contarsi0++;
       else if(entidad.getNum_9()==1)
           contarsi1++;
       else if(entidad.getNum_9()==2)
           contarsi2++;
       else if(entidad.getNum_9()==3)
           contarsi3++;
       else if(entidad.getNum_9()==4)
           contarsi4++;
       else if(entidad.getNum_9()==5)
           contarsi5++;
       else if(entidad.getNum_9()==6)
           contarsi6++;
       else if(entidad.getNum_9()==7)
           contarsi7++;
       else if(entidad.getNum_9()==8)
           contarsi8++;
       else if(entidad.getNum_9()==9)
           contarsi9++;
       else if(entidad.getNum_9()==10)
           contarsi10++;
       else if(entidad.getNum_9()==11)
           contarsi11++;
       else if(entidad.getNum_9()==12)
           contarsi12++;
       else if(entidad.getNum_9()==13)
           contarsi13++;
       else if(entidad.getNum_9()==14)
           contarsi14++;
       sum2+=entidad.getNum_9(); 
    }
    if(entidad.getNum_10()>-1)
    {
        if(entidad.getNum_10()==0)
           contarsi0++;
       else if(entidad.getNum_10()==1)
           contarsi1++;
       else if(entidad.getNum_10()==2)
           contarsi2++;
       else if(entidad.getNum_10()==3)
           contarsi3++;
       else if(entidad.getNum_10()==4)
           contarsi4++;
       else if(entidad.getNum_10()==5)
           contarsi5++;
       else if(entidad.getNum_10()==6)
           contarsi6++;
       else if(entidad.getNum_10()==7)
           contarsi7++;
       else if(entidad.getNum_10()==8)
           contarsi8++;
       else if(entidad.getNum_10()==9)
           contarsi9++;
       else if(entidad.getNum_10()==10)
           contarsi10++;
       else if(entidad.getNum_10()==11)
           contarsi11++;
       else if(entidad.getNum_10()==12)
           contarsi12++;
       else if(entidad.getNum_10()==13)
           contarsi13++;
       else if(entidad.getNum_10()==14)
           contarsi14++;
       sum2+=entidad.getNum_10(); 
    }
    
    
    if(entidad.getNum_11()>-1)
    {
        contar++;
        sum3+=entidad.getNum_11();
    }
        
    if(entidad.getNum_12()>-1)
    {
        contar++;
        sum3+=entidad.getNum_12();
    }
        
    if(entidad.getNum_13()>-1)
    {
        contar++;
        sum3+=entidad.getNum_13();
    }
        
    if(entidad.getNum_14()>-1)
    {
        contar++;
        sum3+=entidad.getNum_14();
    }
        
    if(entidad.getNum_15()>-1)
    {
       contar++;
       sum3+=entidad.getNum_15(); 
    }
        
    contarsiTotal=contarsi0+contarsi1+contarsi2+contarsi3+contarsi4+contarsi5+contarsi6+contarsi7+contarsi8+contarsi9+contarsi10+contarsi11+contarsi12+contarsi13+contarsi14; 
    if(sum2<=42)
        sum42menor=sum2;
    else
        sum42menor=42;
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
        <table class="table table-bordered table-striped table_vam">
            <tr>
                <td><%=sum1%></td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
        </table>
    </td>
    <td>
         <table class="table table-bordered table-striped table_vam">
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td><%=sum2%></td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
        </table>
    </td>
    <td>
         <table class="table table-bordered table-striped table_vam">
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td><%=sum42menor%></td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
        </table>
    </td>
    <td>
         <table class="table table-bordered table-striped table_vam">
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td><%=sum3%></td>
            </tr>
        </table>
    </td>
    <td>
         <table class="table table-bordered table-striped table_vam">
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td><%=contar%></td>
            </tr>
        </table>
    </td>
    <td>
        <%=contarsi0%>
    </td>
    <td>
        <%=contarsi1%>
    </td>
    <td>
         <%=contarsi2%>
    </td>
    <td>
         <%=contarsi3%>
    </td>
    <td>
         <%=contarsi4%>
    </td>
    <td>
         <%=contarsi5%>
    </td>
    <td>
         <%=contarsi6%>
    </td>
    <td>
         <%=contarsi7%>
    </td>
    <td>
         <%=contarsi8%>
    </td>
    <td>
         <%=contarsi9%>
    </td>
    <td>
         <%=contarsi10%>
    </td>
    <td>
         <%=contarsi11%>
    </td>
    <td>
         <%=contarsi12%>
    </td>
    <td>
         <%=contarsi13%>
    </td>
    <td>
         <%=contarsi14%>
    </td>
    <td>
         <%=contarsiTotal%>
    </td>    
</tr> 
<%


sum1Total+=sum1;
sum2Total+=sum2;
sum3Total+=sum3;
sum42menorTotal+=sum42menor;
contarTotal+=contar;

sum1=0;
sum2=0;
sum3=0;
sum42menor=0;
contar=0;


contarsi0Total+=contarsi0;
contarsi1Total+=contarsi1;
contarsi2Total+=contarsi2;
contarsi3Total+=contarsi3;
contarsi4Total+=contarsi4;
contarsi5Total+=contarsi5;
contarsi6Total+=contarsi6;
contarsi7Total+=contarsi7;
contarsi8Total+=contarsi8;
contarsi9Total+=contarsi9;
contarsi10Total+=contarsi10;
contarsi11Total+=contarsi11;
contarsi12Total+=contarsi12;
contarsi13Total+=contarsi13;
contarsi14Total+=contarsi14;



contarsi0=0;
contarsi1=0;
contarsi2=0;
contarsi3=0;
contarsi4=0;
contarsi5=0;
contarsi6=0;
contarsi7=0;
contarsi8=0;
contarsi9=0;
contarsi10=0;
contarsi11=0;
contarsi12=0;
contarsi13=0;
contarsi14=0;
contarsiTotal=0;
}
}
contarsi1Total=(contarsi1Total*1);
contarsi2Total=(contarsi2Total*2);
contarsi3Total=(contarsi3Total*3);
contarsiTotalSuma=contarsi0Total+contarsi1Total+contarsi2Total+contarsi3Total+contarsi4Total+contarsi5Total+contarsi6Total+contarsi7Total+contarsi8Total+contarsi9Total+contarsi10Total+contarsi11Total+contarsi12Total+contarsi13Total+contarsi14Total;

contarsi0Promedio=Operaciones.Redondear(((double)contarsi0Total/(double)contarsiTotalSuma)*100,2);
contarsi1Promedio=Operaciones.Redondear(((double)contarsi1Total/(double)contarsiTotalSuma)*100,2);
contarsi2Promedio=Operaciones.Redondear(((double)contarsi2Total/(double)contarsiTotalSuma)*100,2);
contarsi3Promedio=Operaciones.Redondear(((double)contarsi3Total/(double)contarsiTotalSuma)*100,2);
contarsi4Promedio=Operaciones.Redondear(((double)contarsi4Total/(double)contarsiTotalSuma)*100,2);
contarsi5Promedio=Operaciones.Redondear(((double)contarsi5Total/(double)contarsiTotalSuma)*100,2);
contarsi6Promedio=Operaciones.Redondear(((double)contarsi6Total/(double)contarsiTotalSuma)*100,2);
contarsi7Promedio=Operaciones.Redondear(((double)contarsi7Total/(double)contarsiTotalSuma)*100,2);
contarsi8Promedio=Operaciones.Redondear(((double)contarsi8Total/(double)contarsiTotalSuma)*100,2);
contarsi9Promedio=Operaciones.Redondear(((double)contarsi9Total/(double)contarsiTotalSuma)*100,2);
contarsi10Promedio=Operaciones.Redondear(((double)contarsi10Total/(double)contarsiTotalSuma)*100,2);
contarsi11Promedio=Operaciones.Redondear(((double)contarsi11Total/(double)contarsiTotalSuma)*100,2);
contarsi12Promedio=Operaciones.Redondear(((double)contarsi12Total/(double)contarsiTotalSuma)*100,2);
contarsi13Promedio=Operaciones.Redondear(((double)contarsi13Total/(double)contarsiTotalSuma)*100,2);
contarsi14Promedio=Operaciones.Redondear(((double)contarsi14Total/(double)contarsiTotalSuma)*100,2);
contarsiPromedioTotal=contarsi0Promedio+contarsi1Promedio+contarsi2Promedio+contarsi3Promedio+contarsi4Promedio+contarsi5Promedio+contarsi6Promedio+contarsi7Promedio+contarsi8Promedio+contarsi9Promedio+contarsi10Promedio+contarsi11Promedio+contarsi12Promedio+contarsi13Promedio+contarsi14Promedio;
double t2=contarsi1Promedio+contarsi2Promedio+contarsi3Promedio;
double t3=contarsi4Promedio+contarsi5Promedio+contarsi6Promedio+contarsi7Promedio+contarsi8Promedio+contarsi9Promedio+contarsi10Promedio+contarsi11Promedio+contarsi12Promedio+contarsi13Promedio+contarsi14Promedio;
        
%>


</tbody>

</table>


</div>
      
</div>

<div class="row-fluid">
    <div class="span4">	
           <table class="table table-bordered table-striped table_vam" >
            <thead>
            <tr>
                <th colspan="2">ANTES</th>
                
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                   SUMA
                </td>
                <td >
                   <%=sum1Total%>
                </td>
            </tr>
            <tr>
                <td>
                    PROMEDIO (RACIMOS/PLANTA)
                </td>
                <td >
                    <%=Operaciones.Redondear(((double)sum1Total/size),0)%>
                    
                </td>
            </tr>
            </tbody>
    </table>
      
    </div> 
     <div class="span4">	
         <table class="table table-bordered table-striped table_vam" >
            <thead>
            <tr>
                <th colspan="3">DESPUES</th>               
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="2">
                   SUMA
                </td>
                <td >
                   <%=sum2Total%>
                </td>
            </tr>
            <tr>
                <td>
                    PROMEDIO (RACIMOS/PLANTA)
                </td>
                <td >
                    <%=Operaciones.Redondear(((double)sum2Total/size),0)%>
                </td>
                 <td >
                     <%=Operaciones.Redondear(((double)sum42menorTotal/size),0)%>
                </td>
            </tr>
             <tr>
                <td colspan="2">
                    CUMPLIMIENTO
                </td>
                <td >
                    <%=Operaciones.Redondear(((double)sum3Total/(double)contarTotal)*100,0)%>%
                </td>
            </tr>
            </tbody>
        </table>
    </div>            
 </div> 
                              
                

<div class="row-fluid">
    <div class="span12">	
         <table class="table table-bordered table-striped table_vam" >
            <thead>
                <tr>      
                    <th>0 R/C</th>
                    <th>1 R/C</th>
                    <th>2 R/C</th>
                    <th>3 R/C</th>
                    <th>4 R/C</th>
                    <th>5 R/C</th>
                    <th>6 R/C</th>
                    <th>7 R/C</th>
                    <th>8 R/C</th>
                    <th>9 R/C</th>
                    <th>10 R/C</th>
                    <th>11 R/C</th>
                    <th>12 R/C</th>
                    <th>13 R/C</th>
                    <th>14 R/C</th>        
                    <th>SUMA</th>  
                </tr>
            </thead>
            <tbody>
               <tr>
                    <td><%=contarsi0Total%></td>
                    <td><%=contarsi1Total%></td>
                    <td><%=contarsi2Total%></td>
                    <td><%=contarsi3Total%></td>
                    <td><%=contarsi4Total%></td>
                    <td><%=contarsi5Total%></td>
                    <td><%=contarsi6Total%></td>
                    <td><%=contarsi7Total%></td>
                    <td><%=contarsi8Total%></td>
                    <td><%=contarsi9Total%></td>
                    <td><%=contarsi10Total%></td>
                    <td><%=contarsi11Total%></td>
                    <td><%=contarsi12Total%></td>
                    <td><%=contarsi13Total%></td>
                    <td><%=contarsi14Total%></td>
                    <td><%=contarsiTotalSuma%></td>
               </tr>
               <tr>
                    <td><%=contarsi0Promedio%>%</td>
                    <td><%=contarsi1Promedio%></td>
                    <td><%=contarsi2Promedio%></td>
                    <td><%=contarsi3Promedio%></td>
                    <td><%=contarsi4Promedio%></td>
                    <td><%=contarsi5Promedio%></td>
                    <td><%=contarsi6Promedio%></td>
                    <td><%=contarsi7Promedio%></td>
                    <td><%=contarsi8Promedio%></td>
                    <td><%=contarsi9Promedio%></td>
                    <td><%=contarsi10Promedio%></td>
                    <td><%=contarsi11Promedio%></td>
                    <td><%=contarsi12Promedio%></td>
                    <td><%=contarsi13Promedio%></td>
                    <td><%=contarsi14Promedio%></td>
                    <td><%=Operaciones.Redondear(contarsiPromedioTotal,0)%>%</td>
                    
               </tr>
            </tbody>
            <thead>
                 <tr>
                    <th><%=contarsi0Promedio%>%</th>
                    <th colspan="3">
                        <%=Operaciones.Redondear(t2,2)%>%                    
                    </th>                    
                    <th colspan="11"> 
                       <%=Operaciones.Redondear(t3,2)%>%                    
                    </th>
                    <td> </td>
               </tr>
            </thead>
        </table>
    </div> 
 </div> 
                              
    

</div>

        
<script type="text/javascript">
function clear_all()
{
    smoke.confirm('Desea Volver',function(e){
        if (!e){            
            clear();
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

$(function () { 
  $("#cerrarCarga").trigger("click");


$('#lista').dataTable({
       "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
       "sScrollX": "100%",
       "bDestrox": true,
        "bDeferRender": true
}); 


});
</script>

<%}%>  
           