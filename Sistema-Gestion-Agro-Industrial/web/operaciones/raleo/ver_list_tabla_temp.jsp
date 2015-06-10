<%@page import="Com.Operaciones"%>
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSesion"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{  
    int size=0;
    int rr=0;
    int ra=0;
    int rb=0;
    double rrPorctaje=0;
    double raPorctaje=0;
    double rbPorctaje=0;
    int crContar=0;
    int nrSum=0;
    int nbSum=0;
    int rango1=0;
    int rango2=0;
    int rango3=0;
    int rangoTotal=0;
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
        <th>Nº P</th>
        <th>N° R/P</th>
        <th>N° B</th>
        <th>TIPO DE RACIMO</th>
        <th>CR</th>
        <th>LR</th>
        <th>OBSERVACIONES</th>    

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjRaleo()!=null)
{
    size=objSession.getObjRaleo().getList().size();
for(int i=0;i<size;i++)
{
    if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_1()==0)
        rr++;
    else if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_1()==2)
        ra++;
    
    if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_2()==0)
        rr++;
     else if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_2()==2)
        ra++;
    
    if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_3()==0)
        rr++;
     else if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_3()==2)
        ra++;
    
    if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_1()>-1)
    crContar++;
    if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_2()>-1)
    crContar++;
    if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_3()>-1)
    crContar++;
      
    nrSum+=objSession.getObjRaleo().getList().get(i).getNum_racimo_planta();
    
    if(objSession.getObjRaleo().getList().get(i).getNum_baya_1()>-1)
    nbSum+=objSession.getObjRaleo().getList().get(i).getNum_baya_1();
    
    if(objSession.getObjRaleo().getList().get(i).getNum_baya_2()>-1)
    nbSum+=objSession.getObjRaleo().getList().get(i).getNum_baya_2();
    
    if(objSession.getObjRaleo().getList().get(i).getNum_baya_3()>-1)
    nbSum+=objSession.getObjRaleo().getList().get(i).getNum_baya_3();
    
    if(objSession.getObjRaleo().getList().get(i).getNum_baya_1()>-1 && objSession.getObjRaleo().getList().get(i).getNum_baya_1()<40 )
     rango1++;      
    else if(objSession.getObjRaleo().getList().get(i).getNum_baya_1()>39 && objSession.getObjRaleo().getList().get(i).getNum_baya_1()<91 )
     rango2++;
    else if(objSession.getObjRaleo().getList().get(i).getNum_baya_1()>90 )
     rango3++;
    
    if(objSession.getObjRaleo().getList().get(i).getNum_baya_2()>-1 && objSession.getObjRaleo().getList().get(i).getNum_baya_2()<40 )
     rango1++;      
    else if(objSession.getObjRaleo().getList().get(i).getNum_baya_2()>39 && objSession.getObjRaleo().getList().get(i).getNum_baya_2()<91 )
     rango2++;
    else if(objSession.getObjRaleo().getList().get(i).getNum_baya_2()>90 )
     rango3++;
    
    if(objSession.getObjRaleo().getList().get(i).getNum_baya_3()>-1 && objSession.getObjRaleo().getList().get(i).getNum_baya_3()<40 )
     rango1++;      
    else if(objSession.getObjRaleo().getList().get(i).getNum_baya_3()>39 && objSession.getObjRaleo().getList().get(i).getNum_baya_3()<91 )
     rango2++;
    else if(objSession.getObjRaleo().getList().get(i).getNum_baya_3()>90 )
     rango3++;
%> 

<tr>
<td><%=(i+1)%></td>
<td><%=objSession.getObjRaleo().getList().get(i).getNum_hilera()%></td>
<td><%=objSession.getObjRaleo().getList().get(i).getNum_planta()%></td>
<td><%=objSession.getObjRaleo().getList().get(i).getNum_racimo_planta()%></td>

<td>
    <table>
        <tr>
            <td>
                <%if(objSession.getObjRaleo().getList().get(i).getNum_baya_1()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getNum_baya_1());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
            <td>
                 <%if(objSession.getObjRaleo().getList().get(i).getNum_baya_2()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getNum_baya_2());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
            <td>
                 <%if(objSession.getObjRaleo().getList().get(i).getNum_baya_3()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getNum_baya_3());
                    else
                    out.print("-");%>
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <center>
    <table>
        <tr>
            <td>
                 <%if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==0)
                     out.print("-");                    
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==1)
                        out.print("ALADO");
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==2)
                        out.print("SEMIALADO");
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==3)
                        out.print("CILINDRICO");%>
            </td>
        </tr>
        <tr>
            <td>
                <%if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==0)
                     out.print("-");                    
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==1)
                        out.print("ALADO");
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==2)
                        out.print("SEMIALADO");
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==3)
                        out.print("CILINDRICO");%>
            </td>
        </tr>
        <tr>
            <td>
                <%if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==0)
                     out.print("-");                    
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==1)
                        out.print("ALADO");
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==2)
                        out.print("SEMIALADO");
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==3)
                        out.print("CILINDRICO");%>
            </td>
        </tr>                                                                                               
    </table>
     </center>
</td>
<td>
    <table>
        <tr>
            <td>
                <%if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_1()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_1());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
            <td>
               <%if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_2()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_2());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
            <td>
                <%if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_3()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_3());
                    else
                    out.print("-");%>
            </td>
        </tr>                                                                                            
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
                <%if(objSession.getObjRaleo().getList().get(i).getLargo_racimo_1()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getLargo_racimo_1());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
            <td>
               <%if(objSession.getObjRaleo().getList().get(i).getLargo_racimo_2()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getLargo_racimo_2());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
            <td>
                <%if(objSession.getObjRaleo().getList().get(i).getLargo_racimo_3()>-1)
                    out.print(objSession.getObjRaleo().getList().get(i).getLargo_racimo_3());
                    else
                    out.print("-");%>
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
<center>
    <table>
        <tr>
            <td>
                <%if(!objSession.getObjRaleo().getList().get(i).getObservaciones_1().equals(""))
                    out.print(objSession.getObjRaleo().getList().get(i).getObservaciones_1());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
             <td>
                <%if(!objSession.getObjRaleo().getList().get(i).getObservaciones_2().equals(""))
                    out.print(objSession.getObjRaleo().getList().get(i).getObservaciones_2());
                    else
                    out.print("-");%>
            </td>
        </tr>
        <tr>
            <td>
                <%if(!objSession.getObjRaleo().getList().get(i).getObservaciones_3().equals(""))
                    out.print(objSession.getObjRaleo().getList().get(i).getObservaciones_3());
                    else
                    out.print("-");%>
            </td>
        </tr>                                                                                               
    </table>
</center>
</td>
</tr> 
<%


}
}

rb=crContar-(rr+ra);



rrPorctaje=Operaciones.Redondear((double)rr*100/(double)crContar, 2);
raPorctaje=Operaciones.Redondear((double)ra*100/(double)crContar, 2);
rbPorctaje=Operaciones.Redondear((double)rb*100/(double)crContar, 2);

rangoTotal=rango1+rango2+rango3;

double rango1Porcentaje=Operaciones.Redondear((double)rango1*100/(double)rangoTotal, 2);
double rango2Porcentaje=Operaciones.Redondear((double)rango2*100/(double)rangoTotal, 2);
double rango3Porcentaje=Operaciones.Redondear((double)rango3*100/(double)rangoTotal, 2);
%>


</tbody>

</table>


</div>
      
</div>

<div class="row-fluid">
    <div class="span12">	
           <table class="table table-bordered table-striped table_vam" >
            <thead>
            <tr>
                <th>TOTAL</th>
                <th>% RACIMOS RALOS</th>
                <th>% RACIMOS BIEN ARREGLADOS</th>
                <th>% RACIMOS APRETADOS</th>
                <th>CR</th>
            </tr>
            <tr>
                <td><%=crContar%></td>
                <td><%=rr%></td>
                <td><%=rb%></td>
                <td><%=ra%></td>
                <td></td>
            </tr>
            <tr>
                <td></td>                
                <th><%=rrPorctaje%></th>
                <th><%=rbPorctaje%></th>
                <th><%=raPorctaje%></th>
                <th><%=Operaciones.Redondear(raPorctaje+rbPorctaje+rrPorctaje,1)%></th>
            </tr>
            </thead>          
    </table>
      
    </div>         
 </div> 
                              
                
<div class="row-fluid">
    <div class="span4">	
        <table class="table table-bordered table-striped table_vam" >
            <thead>
            <tr>
                <th>PROMEDIO</th>
                <td><%=Operaciones.Redondear((double)nrSum/(double)size, 2)%> </td>
                <td><%=Operaciones.Redondear((double)nbSum/(double)crContar, 2)%></td>
            </tr>
            <tr>
                <th>Rango Nº bayas</th>
                <th>Nº racimos</th>
                <th></th>
            </tr>
            <tr>
                <td>x < 40</td>
                <td><%=rango1%> </td>
                <td><%=rango1Porcentaje%></td>
            </tr>
            <tr>
                <td>40 <= x <= 90</td>
                <td><%=rango2%> </td>
               <td><%=rango2Porcentaje%></td>
            </tr>
            <tr>
                <td>x > 90</td>
                <td><%=rango3%> </td>
               <td><%=rango3Porcentaje%></td>
            </tr>
             <tr>
                <th>TOTAL</th>
                <th><%=rangoTotal%></th>
                <th><%=Operaciones.Redondear(rango1Porcentaje+rango2Porcentaje+rango3Porcentaje,1)%></th>
            </tr>
            </thead>          
        </table>      
    </div>         
    <div class="span4">	
        	<h3 class="heading">% Cumplimiento Calidad</h3>  
                 <div id="pie_raleo"></div>
    </div>   
    <div class="span4">	
                <h3 class="heading">Rango Nº bayas (%)</h3>  
                 <div id="barra_raleo"></div>
    </div>   
 </div> 
                              
                              
    

</div>

        
<script type="text/javascript">
function clear_all()
{
    smoke.confirm('Desea Volver',function(e){
        if (e){            
            clear();
        }
    }, {cancel:"No",ok:"Si"});
           

};

function clear()
{
    $("#myModal").modal('show');                 
  $.ajax({
            url: 'operaciones/raleo/limpiar_tabla_temp.jsp',
            type: 'POST',
            success: function () {     
                    tabla();
            },
            contentType: false,
            processData: false
    });  
};

$(function () { 
  $('#myModal').modal('hide');
  
    $.ajax({
            url: 'operaciones/graficos/pie_raleo_cumplimineto_calidad.jsp?s1=<%=rrPorctaje%>&s2=<%=rbPorctaje%>&s3=<%=raPorctaje%>',
            type: 'POST',
            success: function (data) {     
                     $('#pie_raleo').html(data);
            },
            contentType: false,
            processData: false
        });
        
        $.ajax({
            url: 'operaciones/graficos/barras_raleo_rango_bayas.jsp?s1=<%=rango1Porcentaje%>&s2=<%=rango2Porcentaje%>&s3=<%=rango3Porcentaje%>',
            type: 'POST',
            success: function (data) {     
                     $('#barra_raleo').html(data);
            },
            contentType: false,
            processData: false
        });

$('#lista').dataTable({
       "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
       "sScrollX": "100%",
       "bDestrox": true,
        "bDeferRender": true
}); 


});
</script>

<%}%>  
           