<%@page import="Entidades.entDetallePoda"%>
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
 int yp=0;
 int cpTotal=0;
 int spTotal=0;
 int ypTotal=0;
 int size=0;
 double yc=0;
 double ycTotal=0;
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
 if(objSession.getObjPoda()!=null)
 {
     if(objSession.getObjPoda().getId_poda()>0)
     {
         Titulo="Editar";
         Boton="Restaurar";
         nEvaluador=objSession.getObjPoda().getObjEvaluador().getNombre()+" "+objSession.getObjPoda().getObjEvaluador().getApellido();
         cEvluador=objSession.getObjPoda().getObjEvaluador().getCodigo_erp();
         idEvaluador="value='"+objSession.getObjPoda().getObjEvaluador().getId_evaluador()+"'";
         idEvaluadorL=""+objSession.getObjPoda().getObjEvaluador().getId_evaluador();
         
         nLote="Lote: "+objSession.getObjPoda().getObjCampaniaLote().getObjLote().getNombre();
         nCamapania="Campaña: "+objSession.getObjPoda().getObjCampaniaLote().getObjCampania().getNombre();
         idCampaniaLote="value='"+objSession.getObjPoda().getObjCampaniaLote().getId_campania_lote()+"'"; 
         idCampaniaLoteL=""+objSession.getObjPoda().getObjCampaniaLote().getId_campania_lote(); 
         if(objSession.getObjPoda().isEstado())
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
        <th>46</th>
        <th>47</th>
        <th>48</th>
        <th>49</th>
        <th>50</th>
        <th>TOTAL Y/P</th>
        <th>Y/C PROM</th>
        <th>Acciones</th>

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjPoda()!=null)
{
size=objSession.getObjPoda().getList().size();

for(int i=0;i<size;i++)
{
if(pos==i)
{
%>    
<tr>
<td><%=(i+1)%></td>

<td><input type="text" style="width:15px;" id="txtNH" name="txtNH" value="<%=objSession.getObjPoda().getList().get(i).getNum_hilera()%>" /></td>
<td><input type="text" style="width:15px;"  id="txtNP" name="txtNP" value="<%=objSession.getObjPoda().getList().get(i).getNum_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNSP" name="txtNSP" value="<%=objSession.getObjPoda().getList().get(i).getNum_salida_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNCP" name="txtNCP" value="<%=objSession.getObjPoda().getList().get(i).getNum_cargador_planta()%>"/></td>                                                                                                                                                                                                               

<td>
   <input type="text" style="width:15px;" id="txt0" name="txt0" <%if(objSession.getObjPoda().getList().get(i).getList().get(0).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(0).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt1" name="txt1" <%if(objSession.getObjPoda().getList().get(i).getList().get(1).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(1).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt2" name="txt2" <%if(objSession.getObjPoda().getList().get(i).getList().get(2).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(2).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt3" name="txt3" <%if(objSession.getObjPoda().getList().get(i).getList().get(3).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(3).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt4" name="txt4" <%if(objSession.getObjPoda().getList().get(i).getList().get(4).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(4).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt5" name="txt5" <%if(objSession.getObjPoda().getList().get(i).getList().get(5).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(5).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt6" name="txt6" <%if(objSession.getObjPoda().getList().get(i).getList().get(6).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(6).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt7" name="txt7" <%if(objSession.getObjPoda().getList().get(i).getList().get(7).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(7).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt8" name="txt8" <%if(objSession.getObjPoda().getList().get(i).getList().get(8).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(8).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt9" name="txt9" <%if(objSession.getObjPoda().getList().get(i).getList().get(9).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(9).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt10" name="txt10" <%if(objSession.getObjPoda().getList().get(i).getList().get(10).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(10).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt11" name="txt11" <%if(objSession.getObjPoda().getList().get(i).getList().get(11).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(11).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt12" name="txt12" <%if(objSession.getObjPoda().getList().get(i).getList().get(12).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(12).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt13" name="txt13" <%if(objSession.getObjPoda().getList().get(i).getList().get(13).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(13).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt14" name="txt14" <%if(objSession.getObjPoda().getList().get(i).getList().get(14).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(14).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt15" name="txt15" <%if(objSession.getObjPoda().getList().get(i).getList().get(15).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(15).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt16" name="txt16" <%if(objSession.getObjPoda().getList().get(i).getList().get(16).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(16).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt17" name="txt17" <%if(objSession.getObjPoda().getList().get(i).getList().get(17).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(17).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt18" name="txt18" <%if(objSession.getObjPoda().getList().get(i).getList().get(18).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(18).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt19" name="txt19" <%if(objSession.getObjPoda().getList().get(i).getList().get(19).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(19).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt20" name="txt20" <%if(objSession.getObjPoda().getList().get(i).getList().get(20).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(20).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt21" name="txt21" <%if(objSession.getObjPoda().getList().get(i).getList().get(21).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(21).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt22" name="txt22" <%if(objSession.getObjPoda().getList().get(i).getList().get(22).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(22).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt23" name="txt23" <%if(objSession.getObjPoda().getList().get(i).getList().get(23).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(23).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt24" name="txt24" <%if(objSession.getObjPoda().getList().get(i).getList().get(24).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(24).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt25" name="txt25" <%if(objSession.getObjPoda().getList().get(i).getList().get(25).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(25).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt26" name="txt26" <%if(objSession.getObjPoda().getList().get(i).getList().get(26).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(26).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt27" name="txt27" <%if(objSession.getObjPoda().getList().get(i).getList().get(27).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(27).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt28" name="txt28" <%if(objSession.getObjPoda().getList().get(i).getList().get(28).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(28).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt29" name="txt29" <%if(objSession.getObjPoda().getList().get(i).getList().get(29).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(29).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt30" name="txt30" <%if(objSession.getObjPoda().getList().get(i).getList().get(30).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(30).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt31" name="txt31" <%if(objSession.getObjPoda().getList().get(i).getList().get(31).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(31).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt32" name="txt32" <%if(objSession.getObjPoda().getList().get(i).getList().get(32).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(32).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt33" name="txt33" <%if(objSession.getObjPoda().getList().get(i).getList().get(33).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(33).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt34" name="txt34" <%if(objSession.getObjPoda().getList().get(i).getList().get(34).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(34).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt35" name="txt35" <%if(objSession.getObjPoda().getList().get(i).getList().get(35).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(35).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt36" name="txt36" <%if(objSession.getObjPoda().getList().get(i).getList().get(36).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(36).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt37" name="txt37" <%if(objSession.getObjPoda().getList().get(i).getList().get(37).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(37).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt38" name="txt38" <%if(objSession.getObjPoda().getList().get(i).getList().get(38).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(38).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt39" name="txt39" <%if(objSession.getObjPoda().getList().get(i).getList().get(39).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(39).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt40" name="txt40" <%if(objSession.getObjPoda().getList().get(i).getList().get(40).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(40).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt41" name="txt41" <%if(objSession.getObjPoda().getList().get(i).getList().get(41).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(41).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt42" name="txt42" <%if(objSession.getObjPoda().getList().get(i).getList().get(42).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(42).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt43" name="txt43" <%if(objSession.getObjPoda().getList().get(i).getList().get(43).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(43).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt44" name="txt44" <%if(objSession.getObjPoda().getList().get(i).getList().get(44).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(44).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt45" name="txt45" <%if(objSession.getObjPoda().getList().get(i).getList().get(45).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(45).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt46" name="txt46" <%if(objSession.getObjPoda().getList().get(i).getList().get(46).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(46).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt47" name="txt47" <%if(objSession.getObjPoda().getList().get(i).getList().get(47).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(47).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt48" name="txt48" <%if(objSession.getObjPoda().getList().get(i).getList().get(48).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(48).getCantidad()+"'");%>/>
</td>
<td>
   <input type="text" style="width:15px;" id="txt49" name="txt49" <%if(objSession.getObjPoda().getList().get(i).getList().get(49).getCantidad()>-0) out.print("value='"+objSession.getObjPoda().getList().get(i).getList().get(49).getCantidad()+"'");%>/>
</td>
<td>

</td>
<td>

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
<td><%=objSession.getObjPoda().getList().get(i).getNum_hilera()%></td>
<td><%=objSession.getObjPoda().getList().get(i).getNum_planta()%></td>
<td><%=objSession.getObjPoda().getList().get(i).getNum_salida_planta()%></td>
<td><%=objSession.getObjPoda().getList().get(i).getNum_cargador_planta()%></td>


<%
cpTotal+=objSession.getObjPoda().getList().get(i).getNum_cargador_planta();
spTotal+=objSession.getObjPoda().getList().get(i).getNum_salida_planta();
for(entDetallePoda entidad : objSession.getObjPoda().getList().get(i).getList())
{
    yc=Operaciones.Redondear((double)yp/(double)objSession.getObjPoda().getList().get(i).getNum_cargador_planta(),2);
     if(entidad.getCantidad()>0)
        yp+=entidad.getCantidad();
    
%>
        
<td>
    <%if(entidad.getCantidad()>0) out.print(entidad.getCantidad());%>   
</td>
<%} 
%>


<td>
<%=yp%>
</td>
<td>
<%=yc%>
</td>
<td>
<button class="comp_edit btn btn-warning btn-mini" onclick="tablaTemp(<%=(i+1)%>)" type="button">Editar</button>
</td>

</tr> 
<%
ypTotal+=yp;
ycTotal+=yc;
yp=0;
}
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
   <input type="text" style="width:15px;" id="txt0" name="txt0" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt1" name="txt1" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt2" name="txt2" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt3" name="txt3" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt4" name="txt4" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt5" name="txt5" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt6" name="txt6" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt7" name="txt7" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt8" name="txt8" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt9" name="txt9" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt10" name="txt10" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt11" name="txt11" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt12" name="txt12" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt13" name="txt13" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt14" name="txt14" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt15" name="txt15" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt16" name="txt16" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt17" name="txt17" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt18" name="txt18" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt19" name="txt19" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt20" name="txt20" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt21" name="txt21" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt22" name="txt22" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt23" name="txt23" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt24" name="txt24" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt25" name="txt25" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt26" name="txt26" />
<td>
   <input type="text" style="width:15px;" id="txt27" name="txt27" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt28" name="txt28" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt29" name="txt29" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt30" name="txt30" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt31" name="txt31" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt32" name="txt32" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt33" name="txt33" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt34" name="txt34" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt35" name="txt35" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt36" name="txt36" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt37" name="txt37" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt38" name="txt38" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt39" name="txt39" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt40" name="txt40" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt41" name="txt41" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt42" name="txt42" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt43" name="txt43" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt44" name="txt44" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt45" name="txt45" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt46" name="txt46" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt47" name="txt47" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt48" name="txt48" />
</td>
<td>
   <input type="text" style="width:15px;" id="txt49" name="txt49" />
</td>
<td>

</td>
<td>

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
if(objSession.getObjPoda()!=null)
{

%>


<div class="row-fluid">
     <div class="span3">	
         <table class="table table-bordered table-striped table_vam" >
            <thead>
            <tr>
                <th>SUMA</th>
                <td><%=ypTotal%></td>
                <td rowspan="2"></td>
            </tr>
             <tr>
                <th>PROMEDIO Y/P</th>
                <td><%=Operaciones.Redondear((double)ypTotal/(double)size, 2)%></td>
            </tr>
            <tr>
                <th>PROMEDIO Y/C</th>
                <td><%=Operaciones.Redondear(ycTotal/(double)size, 2)%></td>
                <th><%=Operaciones.Redondear((double)ypTotal/(double)cpTotal, 2)%></th>
            </tr>           
            </thead> 
    </table>
            
        <table class="table table-bordered table-striped table_vam" >
            <thead>
            <tr>
                <th>PLANTAS EVALUADAS</th>
                <td><%=size%></td>
            </tr>
             <tr>
                <th>S/P PROMEDIO</th>
                <td><%=Operaciones.Redondear((double)spTotal/(double)size, 2)%></td>
            </tr>
            <tr>
                <th>C/P PROMEDIO</th>
                <td><%=Operaciones.Redondear((double)cpTotal/(double)size, 2)%></td>
            </tr>
            <tr>
                <th>Y/P PROMEDIO</th>
                <td><%=Operaciones.Redondear((double)ypTotal/(double)size, 2)%></td>
            </tr>
            <tr>
                <th>Y/C PROMEDIO</th>
                <td><%=Operaciones.Redondear((double)ycTotal/(double)size, 2)%></td>
            </tr>
            </thead> 
    </table>
   
    </div> 
    <div class="span2">	
      
    </div>		
      <div class="span4">                       
                            <div class="row-fluid" id="g-map-top">
                                    <div class="span12">   
                                             <form  method="get" id="reg_form">
                                                  <div class="location_add_form well">
                                                      <div class="formSep">
                                                          <h3 class="heading"><%=Titulo%> Poda</h3>  
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

                                                        <input type="hidden" id="IdPoda"  name="IdPoda" value="<%=objSession.getObjPoda().getId_poda()%>" />

                                                        <button class="btn btn-invert" type="submit"><%=Titulo%></button>

                                                        <button class="btn btn-invert" onclick="clear_form()" type="button"><%=Boton%></button>
                                                        
                                                        <%
                                                         if(objSession.getObjPoda()!=null)
                                                             if(objSession.getObjPoda().getId_poda()>0)
                                                             out.print("<button class='btn btn-invert' onclick='restaurar("+objSession.getObjPoda().getId_poda()+")' type='button'>Restaurar Todo</button>");
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
        if (e){            
            clear();
        }
    }, {cancel:"No",ok:"Si"});
           

};
function restaurar(id)
{
    smoke.confirm('Desea Restaurar Todo',function(e){
        if (e){            
            editar(id);
        }
    }, {cancel:"No",ok:"Si"});
           

};
function clear()
{
    $("#abrirCarga").click();                
  $.ajax({
            url: 'operaciones/poda/limpiar_tabla_temp.jsp',
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
     "sPaginationType": "bootstrap",
                                            "bDeferRender": true
}); 
$('#tablaCampaniaLote').dataTable({
"sPaginationType": "bootstrap",
                                            "bDeferRender": true
}); 

$('#lista').dataTable({
       "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
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
                var url = "operaciones/poda/add_list_tabla_temp.jsp"; 
                
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
            txt0: { digits:true  },
            txt1: { digits:true  },
            txt2: { digits:true  },
            txt3: { digits:true  },
            txt4: { digits:true  },
            txt5: { digits:true  },
            txt6: { digits:true  },
            txt7: { digits:true  },
            txt8: { digits:true  },
            txt9: { digits:true  },
            txt10: { digits:true  },
            txt11: { digits:true  },
            txt12: { digits:true  },
            txt13: { digits:true  },
            txt14: { digits:true  },
            txt15: { digits:true  },
            txt16: { digits:true  },
            txt17: { digits:true  },
            txt18: { digits:true  },
            txt19: { digits:true  },
            txt20: { digits:true  },
            txt21: { digits:true  },
            txt22: { digits:true  },
            txt23: { digits:true  },
            txt24: { digits:true  },
            txt25: { digits:true  },
            txt26: { digits:true  },
            txt27: { digits:true  },
            txt28: { digits:true  },
            txt29: { digits:true  },
            txt30: { digits:true  },
            txt31: { digits:true  },
            txt32: { digits:true  },
            txt33: { digits:true  },
            txt34: { digits:true  },
            txt35: { digits:true  },
            txt36: { digits:true  },
            txt37: { digits:true  },
            txt38: { digits:true  },
            txt39: { digits:true  },
            txt40: { digits:true  },
            txt41: { digits:true  },
            txt42: { digits:true  },
            txt43: { digits:true  },
            txt44: { digits:true  },
            txt45: { digits:true  },
            txt46: { digits:true  },
            txt47: { digits:true  },
            txt48: { digits:true  },
            txt49: { digits:true  }

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
                if (e){   
                    $("#abrirCarga").click();                    
                    var url = "operaciones/poda/insert.jsp"; 

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
                }, {cancel:"No",ok:"Si"});
     
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
           