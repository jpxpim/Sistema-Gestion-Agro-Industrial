<%@page import="Entidades.entDetallePrePoda"%>
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
    int menor=2147483647;
    int mayor=0;
    int size=0;
    int sum1=0;
    int sum2=0;
    int sum3=0;
    int sum4=0;
    int cp=0;
    int tf=0;
    double fc=0;
    
    int sum1Total=0;
    int sum2Total=0;
    int sum3Total=0;
    int sum4Total=0;
    int cpTotal=0;
    int tfTotal=0;
    double fcTotal=0;
    
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
        <th>N° S/P</th>
        <th></th>
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
        <th>17</th>
        <th>18</th>
        <th>19</th>
        <th>20</th>
        <th>21</th>
        <th>22</th>
        <th>23</th>
        <th>24</th>
        <th>25</th>
        <th>26</th>
        <th>27</th>
        <th>28</th>
        <th>29</th>
        <th>30</th>
        <th>31</th>
        <th>32</th>
        <th>33</th>
        <th>34</th>
        <th>35</th>
        <th>36</th>
        <th>37</th>
        <th>38</th>
        <th>39</th>
        <th>40</th>
        <th>41</th>
        <th>42</th>
        <th>43</th>
        <th>44</th>
        <th>45</th>
        <th><7</th>     
        <th>7-9</th>     
        <th>10-12</th>     
        <th>>12</th>     
        <th>C/P</th>     
        <th>TF/P</th> 
        <th>F/C</th> 
       
</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjPrePoda()!=null)
{
    size=objSession.getObjPrePoda().getList().size();
    
for(int i=0;i<size;i++)
{

%> 

<tr>
<td><%=(i+1)%></td>
<td><%=objSession.getObjPrePoda().getList().get(i).getNum_hilera()%></td>
<td><%=objSession.getObjPrePoda().getList().get(i).getNum_planta()%></td>
<td><%=objSession.getObjPrePoda().getList().get(i).getNum_salida_planta()%></td>
<td>
     <table class="table table-bordered table-striped table_vam">
        <tr>
            <td>Diámetro</td>
        </tr>
        <tr>
            <td>Feminela</td>
        </tr>
    </table>
</td>

<%for(entDetallePrePoda entidad : objSession.getObjPrePoda().getList().get(i).getList())
{
     if(entidad.getDiametro()>0)
        cp++;
     
     if(entidad.getFeminela()>0)
        tf+=entidad.getFeminela();
     
     if(entidad.getDiametro()>0 &&entidad.getDiametro()<7)
        sum1++;
     else if(entidad.getDiametro()>6 &&entidad.getDiametro()<10)
         sum2++;
     else if(entidad.getDiametro()>9 &&entidad.getDiametro()<13)
         sum3++;
     else if(entidad.getDiametro()>12)
         sum4++;
     
     

%>
        
<td>
     <table class="table table-bordered table-striped table_vam">
        <tr>
            <td><%if(entidad.getDiametro()>0) out.print(entidad.getDiametro()); else out.print("-");%></td>
        </tr>
        <tr>
            <td><%if(entidad.getFeminela()>0) out.print(entidad.getFeminela()); else out.print("-");%></td>
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
        </table>
    </td>
    <td>
        <table class="table table-bordered table-striped table_vam">
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
                <td><%=sum3%></td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
        </table>
    </td>
    <td>
        <table class="table table-bordered table-striped table_vam">
            <tr>
                <td><%=sum4%></td>
            </tr>
            <tr>
                <td>-</td>
            </tr>
        </table>
    </td>
    <td>
        <table class="table table-bordered table-striped table_vam">
            <tr>
                <td><%=cp%></td>
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
                <td><%=tf%></td>
            </tr>
        </table>
    </td>
     <td>
        <table class="table table-bordered table-striped table_vam">
            <tr>
                <td>-</td>
            </tr>
            <tr>
                <td><%=Operaciones.Redondear(fc=(double)tf/(double)cp, 2)%></td>
            </tr>
        </table>
    </td>
    
</tr> 
<%

sum1Total+=sum1;
sum2Total+=sum2;
sum3Total+=sum3;
sum4Total+=sum4;
cpTotal+=cp;
tfTotal+=tf;
fcTotal+=fc;
if(cp>mayor)
mayor=cp;

if(cp<menor)
menor=cp;

sum1=0;
sum2=0;
sum3=0;
sum4=0;
cp=0;
tf=0;
fc=0;
}
}
int sumTotal=sum1Total+sum2Total+sum3Total+sum4Total;
double p1=Operaciones.Redondear((double)sum1Total/(double)sumTotal*100,2);
double p2=Operaciones.Redondear((double)sum2Total/(double)sumTotal*100,2);
double p3=Operaciones.Redondear((double)sum3Total/(double)sumTotal*100,2);
double p4=Operaciones.Redondear((double)sum4Total/(double)sumTotal*100,2);
double pTotal=Operaciones.Redondear(p1+p2+p3+p4,2);
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
                <td colspan="5">
                   
                </td>
                <th >
                   C/P
                </th>   
                <th >
                   F/P
                </th>   
                <th >
                  F/C
                </th>   
            </tr>
            <tr>
                <th>TOTAL</th>
               <td >
                   <%=sum1Total%>
                </td>
                 <td>
                   <%=sum2Total%>
                </td>
                <td >
                    <%=sum3Total%>
                </td>
                 <td>
                    <%=sum4Total%>
                </td>
                <td >
                   <%=sumTotal%>
                </td>   
                <td colspan="2" rowspan="2">
                </td>   
            </tr>
             <tr>
                <th>PORCENTAJES</th>
                <td >
                   <%=p1%>%
                </td>
                 <td>
                   <%=p2%>%
                </td>
                <td >
                   <%=p3%>%
                </td>
                 <td>
                  <%=p4%>%
                </td>
                <td >
                  <%=pTotal%>%
                </td>    
            </tr>
             <tr>
                 <th>
                   PROMEDIO
                </th>
                <td colspan="4" rowspan="3">
                   
                </td>
                <th >
                    <%=Operaciones.Redondear(cpTotal/(double)size,2)%>
                </th>   
                <th >
                    <%=Operaciones.Redondear(tfTotal/(double)size,2)%>
                </th>   
                <th >
                    <%=Operaciones.Redondear(fcTotal/(double)size,2)%>
                </th>   
            </tr>
             <tr>
                 <th>
                   MAYOR
                </th>
                <th >
                  <%=mayor%>
                </th>   
                <td colspan="2" rowspan="3">
                    
                </td>   
            </tr>
             <tr>
                 <th>
                   MENOR
                </th>
                <th >
                   <%=menor%>
                </th>                   
            </tr>
            </thead>          
    </table>
      
    </div> 
     <div class="span2"/>            
    <div class="span3"> 
    <h3 class="heading">Diámetro (mm)</h3>  
    <div id="pie_pre_poda_diametro"></div>

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
            url: 'operaciones/pre_poda/limpiar_tabla_temp.jsp',
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


$('#lista').dataTable({
       "sPaginationType": "bootstrap",
       "sScrollX": "100%",
       "bDestrox": true,
        "bDeferRender": true
}); 
$.ajax({
    url: 'operaciones/graficos/pie_pre_poda_diametro.jsp?s1=<%=sum1Total%>&s2=<%=sum2Total%>&s3=<%=sum3Total%>&s4=<%=sum4Total%>',
    type: 'POST',
    success: function (data) {     
             $('#pie_pre_poda_diametro').html(data);
    },
    contentType: false,
    processData: false
});

});
</script>

<%}%>  
           