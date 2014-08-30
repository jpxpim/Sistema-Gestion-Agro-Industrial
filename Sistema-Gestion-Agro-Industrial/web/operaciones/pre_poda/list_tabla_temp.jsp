<%@page import="Com.Operaciones"%>
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entidades.entDetallePrePoda"%>
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
 if(objSession.getObjPrePoda()!=null)
 {
     if(objSession.getObjPrePoda().getId_pre_poda()>0)
     {
         Titulo="Editar";
         Boton="Restaurar";
         nEvaluador=objSession.getObjPrePoda().getObjEvaluador().getNombre()+" "+objSession.getObjPrePoda().getObjEvaluador().getApellido();
         cEvluador=objSession.getObjPrePoda().getObjEvaluador().getCodigo_erp();
         idEvaluador="value='"+objSession.getObjPrePoda().getObjEvaluador().getId_evaluador()+"'";
         idEvaluadorL=""+objSession.getObjPrePoda().getObjEvaluador().getId_evaluador();
         
         nLote="Lote: "+objSession.getObjPrePoda().getObjCampaniaLote().getObjLote().getNombre();
         nCamapania="Campaña: "+objSession.getObjPrePoda().getObjCampaniaLote().getObjCampania().getNombre();
         idCampaniaLote="value='"+objSession.getObjPrePoda().getObjCampaniaLote().getId_campania_lote()+"'"; 
         idCampaniaLoteL=""+objSession.getObjPrePoda().getObjCampaniaLote().getId_campania_lote(); 
         if(objSession.getObjPrePoda().isEstado())
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
        <th>Acciones</th>

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjPrePoda()!=null)
for(int i=0;i<objSession.getObjPrePoda().getList().size();i++)
{
if(pos==i)
{
%>    
<tr>
<td><%=(i+1)%></td>
<td><input type="text" style="width:15px;" id="txtNH" name="txtNH" value="<%=objSession.getObjPrePoda().getList().get(i).getNum_hilera()%>" /></td>
<td><input type="text" style="width:15px;"  id="txtNP" name="txtNP" value="<%=objSession.getObjPrePoda().getList().get(i).getNum_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNSP" name="txtNSP" value="<%=objSession.getObjPrePoda().getList().get(i).getNum_salida_planta()%>"/></td>
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

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD0" name="txtD0" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(0).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(0).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF0" name="txtF0" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(0).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(0).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD1" name="txtD1" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(1).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(1).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF1" name="txtF1" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(1).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(1).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD2" name="txtD2" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(2).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(2).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF2" name="txtF2" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(2).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(2).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD3" name="txtD3" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(3).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(3).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF3" name="txtF3" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(3).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(3).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD4" name="txtD4" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(4).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(4).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF4" name="txtF4" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(4).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(4).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD5" name="txtD5" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(5).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(5).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF5" name="txtF5" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(5).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(5).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD6" name="txtD6" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(6).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(6).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF6" name="txtF6" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(6).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(6).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD7" name="txtD7" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(7).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(7).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF7" name="txtF7" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(7).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(7).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD8" name="txtD8" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(8).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(8).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF8" name="txtF8" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(8).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(8).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD9" name="txtD9" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(9).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(9).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF9" name="txtF9" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(9).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(9).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD10" name="txtD10" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(10).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(10).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF10" name="txtF10" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(10).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(10).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD11" name="txtD11" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(11).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(11).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF11" name="txtF11" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(11).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(11).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD12" name="txtD12" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(12).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(12).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF12" name="txtF12" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(12).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(12).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD13" name="txtD13" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(13).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(13).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF13" name="txtF13" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(13).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(13).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD14" name="txtD14" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(14).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(14).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF14" name="txtF14" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(14).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(14).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD15" name="txtD15" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(15).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(15).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF15" name="txtF15" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(15).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(15).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD16" name="txtD16" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(16).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(16).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF16" name="txtF16" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(16).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(16).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD17" name="txtD17" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(17).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(17).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF17" name="txtF17" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(17).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(17).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD18" name="txtD18" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(18).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(18).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF18" name="txtF18" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(18).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(18).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD19" name="txtD19" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(19).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(19).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF19" name="txtF19" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(19).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(19).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD20" name="txtD20" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(20).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(20).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF20" name="txtF20" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(20).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(20).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD21" name="txtD21" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(21).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(21).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF21" name="txtF21" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(21).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(21).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD22" name="txtD22" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(22).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(22).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF22" name="txtF22" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(22).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(22).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD23" name="txtD23" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(23).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(23).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF23" name="txtF23" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(23).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(23).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD24" name="txtD24" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(24).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(24).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF24" name="txtF24" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(24).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(24).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD25" name="txtD25" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(25).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(25).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF25" name="txtF25" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(25).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(25).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD26" name="txtD26" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(26).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(26).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF26" name="txtF26" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(26).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(26).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD27" name="txtD27" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(27).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(27).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF27" name="txtF27" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(27).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(27).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD28" name="txtD28" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(28).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(28).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF28" name="txtF28" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(28).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(28).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD29" name="txtD29" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(29).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(29).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF29" name="txtF29" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(29).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(29).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD30" name="txtD30" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(30).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(30).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF30" name="txtF30" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(30).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(30).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD31" name="txtD31" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(31).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(31).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF31" name="txtF31" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(31).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(31).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD32" name="txtD32" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(32).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(32).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF32" name="txtF32" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(32).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(32).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD33" name="txtD33" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(33).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(33).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF33" name="txtF33" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(33).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(33).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD34" name="txtD34" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(34).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(34).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF34" name="txtF34" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(34).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(34).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD35" name="txtD35" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(35).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(35).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF35" name="txtF35" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(35).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(35).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD36" name="txtD36" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(36).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(36).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF36" name="txtF36" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(36).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(36).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD37" name="txtD37" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(37).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(37).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF37" name="txtF37" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(37).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(37).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD38" name="txtD38" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(38).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(38).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF38" name="txtF38" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(38).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(38).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD39" name="txtD39" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(39).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(39).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF39" name="txtF39" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(39).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(39).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD40" name="txtD40" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(40).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(40).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF40" name="txtF40" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(40).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(40).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD41" name="txtD41" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(41).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(41).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF41" name="txtF41" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(41).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(41).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD42" name="txtD42" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(42).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(42).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF42" name="txtF42" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(42).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(42).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD43" name="txtD43" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(43).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(43).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF43" name="txtF43" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(43).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(43).getFeminela()+"'");%>/></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD44" name="txtD44" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(44).getDiametro()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(44).getDiametro()+"'");%>/></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF44" name="txtF44" <%if(objSession.getObjPrePoda().getList().get(i).getList().get(44).getFeminela()>-0) out.print("value='"+objSession.getObjPrePoda().getList().get(i).getList().get(44).getFeminela()+"'");%>/></td>
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

<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD0" name="txtD0" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF0" name="txtF0" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD1" name="txtD1" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF1" name="txtF1" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD2" name="txtD2" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF2" name="txtF2" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD3" name="txtD3" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF3" name="txtF3" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD4" name="txtD4" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF4" name="txtF4" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD5" name="txtD5" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF5" name="txtF5" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD6" name="txtD6" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF6" name="txtF6" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD7" name="txtD7" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF7" name="txtF7" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD8" name="txtD8" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF8" name="txtF8" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD9" name="txtD9" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF9" name="txtF9" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD10" name="txtD10" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF10" name="txtF10" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD11" name="txtD11" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF11" name="txtF11" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD12" name="txtD12" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF12" name="txtF12" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD13" name="txtD13" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF13" name="txtF13" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD14" name="txtD14" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF14" name="txtF14" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD15" name="txtD15" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF15" name="txtF15" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD16" name="txtD16" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF16" name="txtF16" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD17" name="txtD17" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF17" name="txtF17" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD18" name="txtD18" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF18" name="txtF18" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD19" name="txtD19" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF19" name="txtF19" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD20" name="txtD20" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF20" name="txtF20" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD21" name="txtD21" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF21" name="txtF21" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD22" name="txtD22" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF22" name="txtF22" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD23" name="txtD23" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF23" name="txtF23" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD24" name="txtD24" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF24" name="txtF24" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD25" name="txtD25" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF25" name="txtF25" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD26" name="txtD26" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF26" name="txtF26" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD27" name="txtD27" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF27" name="txtF27" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD28" name="txtD28" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF28" name="txtF28" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD29" name="txtD29" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF29" name="txtF29" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD30" name="txtD30" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF30" name="txtF30" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD31" name="txtD31" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF31" name="txtF31" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD32" name="txtD32" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF32" name="txtF32" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD33" name="txtD33" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF33" name="txtF33" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD34" name="txtD34" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF34" name="txtF34" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD35" name="txtD35" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF35" name="txtF35" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD36" name="txtD36" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF36" name="txtF36" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD37" name="txtD37" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF37" name="txtF37" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD38" name="txtD38" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF38" name="txtF38" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD39" name="txtD39" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF39" name="txtF39" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD40" name="txtD40" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF40" name="txtF40" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD41" name="txtD41" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF41" name="txtF41" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD42" name="txtD42" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF42" name="txtF42" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD43" name="txtD43" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF43" name="txtF43" /></td>
        </tr>
                                                                                                        
    </table>
</td>
<td>
    <table>
        <tr>
            <td><input type="text" style="width:10px;" id="txtD44" name="txtD44" /></td>
        </tr>
        <tr>
            <td><input type="text" style="width:10px;" id="txtF44" name="txtF44" /></td>
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
if(objSession.getObjPrePoda()!=null)
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
                                                          <h3 class="heading"><%=Titulo%> Pre - Poda</h3>  
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

                                                        <input type="hidden" id="IdPrePoda"  name="IdPrePoda" value="<%=objSession.getObjPrePoda().getId_pre_poda()%>" />

                                                        <button class="btn btn-invert" type="submit"><%=Titulo%></button>

                                                        <button class="btn btn-invert" onclick="clear_form()" type="button"><%=Boton%></button>
                                                        
                                                        <%
                                                         if(objSession.getObjPrePoda()!=null)
                                                             if(objSession.getObjPrePoda().getId_pre_poda()>0)
                                                             out.print("<button class='btn btn-invert' onclick='restaurar("+objSession.getObjPrePoda().getId_pre_poda()+")' type='button'>Restaurar Todo</button>");
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
            url: 'operaciones/pre_poda/limpiar_tabla_temp.jsp',
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
                var url = "operaciones/pre_poda/add_list_tabla_temp.jsp"; 
                
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
            txtD0: { digits:true  },
            txtD1: { digits:true  },
            txtD2: { digits:true  },
            txtD3: { digits:true  },
            txtD4: { digits:true  },
            txtD5: { digits:true  },
            txtD6: { digits:true  },
            txtD7: { digits:true  },
            txtD8: { digits:true  },
            txtD9: { digits:true  },
            txtD10: { digits:true  },
            txtD11: { digits:true  },
            txtD12: { digits:true  },
            txtD13: { digits:true  },
            txtD14: { digits:true  },
            txtD15: { digits:true  },
            txtD16: { digits:true  },
            txtD17: { digits:true  },
            txtD18: { digits:true  },
            txtD19: { digits:true  },
            txtD20: { digits:true  },
            txtD21: { digits:true  },
            txtD22: { digits:true  },
            txtD23: { digits:true  },
            txtD24: { digits:true  },
            txtD25: { digits:true  },
            txtD26: { digits:true  },
            txtD27: { digits:true  },
            txtD28: { digits:true  },
            txtD29: { digits:true  },
            txtD30: { digits:true  },
            txtD31: { digits:true  },
            txtD32: { digits:true  },
            txtD33: { digits:true  },
            txtD34: { digits:true  },
            txtD35: { digits:true  },
            txtD36: { digits:true  },
            txtD37: { digits:true  },
            txtD38: { digits:true  },
            txtD39: { digits:true  },
            txtD40: { digits:true  },
            txtD41: { digits:true  },
            txtD42: { digits:true  },
            txtD43: { digits:true  },
            txtD44: { digits:true  },
           
            txtF0: { digits:true  },
            txtF1: { digits:true  },
            txtF2: { digits:true  },
            txtF3: { digits:true  },
            txtF4: { digits:true  },
            txtF5: { digits:true  },
            txtF6: { digits:true  },
            txtF7: { digits:true  },
            txtF8: { digits:true  },
            txtF9: { digits:true  },
            txtF10: { digits:true  },
            txtF11: { digits:true  },
            txtF12: { digits:true  },
            txtF13: { digits:true  },
            txtF14: { digits:true  },
            txtF15: { digits:true  },
            txtF16: { digits:true  },
            txtF17: { digits:true  },
            txtF18: { digits:true  },
            txtF19: { digits:true  },
            txtF20: { digits:true  },
            txtF21: { digits:true  },
            txtF22: { digits:true  },
            txtF23: { digits:true  },
            txtF24: { digits:true  },
            txtF25: { digits:true  },
            txtF26: { digits:true  },
            txtF27: { digits:true  },
            txtF28: { digits:true  },
            txtF29: { digits:true  },
            txtF30: { digits:true  },
            txtF31: { digits:true  },
            txtF32: { digits:true  },
            txtF33: { digits:true  },
            txtF34: { digits:true  },
            txtF35: { digits:true  },
            txtF36: { digits:true  },
            txtF37: { digits:true  },
            txtF38: { digits:true  },
            txtF39: { digits:true  },
            txtF40: { digits:true  },
            txtF41: { digits:true  },
            txtF42: { digits:true  },
            txtF43: { digits:true  },
            txtF44: { digits:true  }

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
                    var url = "operaciones/pre_poda/insert.jsp"; 

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
           