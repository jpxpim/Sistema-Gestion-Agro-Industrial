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
 if(objSession.getObjRaleo()!=null)
 {
     if(objSession.getObjRaleo().getId_raleo()>0)
     {
         Titulo="Editar";
         Boton="Restaurar";
         nEvaluador=objSession.getObjRaleo().getObjEvaluador().getNombre()+" "+objSession.getObjRaleo().getObjEvaluador().getApellido();
         cEvluador=objSession.getObjRaleo().getObjEvaluador().getCodigo_erp();
         idEvaluador="value='"+objSession.getObjRaleo().getObjEvaluador().getId_evaluador()+"'";
         idEvaluadorL=""+objSession.getObjRaleo().getObjEvaluador().getId_evaluador();
         
         nLote="Lote: "+objSession.getObjRaleo().getObjCampaniaLote().getObjLote().getNombre();
         nCamapania="Campaña: "+objSession.getObjRaleo().getObjCampaniaLote().getObjCampania().getNombre();
         idCampaniaLote="value='"+objSession.getObjRaleo().getObjCampaniaLote().getId_campania_lote()+"'"; 
         idCampaniaLoteL=""+objSession.getObjRaleo().getObjCampaniaLote().getId_campania_lote(); 
         if(objSession.getObjRaleo().isEstado())
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
        <th>N° R/P</th>
        <th>N° B</th>
        <th>TIPO DE RACIMO</th>
        <th>CR</th>
        <th>LR</th>
        <th>OBSERVACIONES</th>        
        <th>Acciones</th>

</tr>
</thead>  
<tbody> 

<%
if(objSession.getObjRaleo()!=null)
for(int i=0;i<objSession.getObjRaleo().getList().size();i++)
{
if(pos==i)
{
%>    
<tr>
<td><%=(i+1)%></td>
<td><input type="text" style="width:15px;" id="txtNH" name="txtNH" value="<%=objSession.getObjRaleo().getList().get(i).getNum_hilera()%>" /></td>
<td><input type="text" style="width:15px;"  id="txtNP" name="txtNP" value="<%=objSession.getObjRaleo().getList().get(i).getNum_planta()%>"/></td>
<td><input type="text" style="width:15px;"  id="txtNRP" name="txtNRP" value="<%=objSession.getObjRaleo().getList().get(i).getNum_racimo_planta()%>"/></td>

<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtNB1" name="txtNB1" value="<%if(objSession.getObjRaleo().getList().get(i).getNum_baya_1()>-1)out.print(objSession.getObjRaleo().getList().get(i).getNum_baya_1());%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtNB2" name="txtNB2" value="<%if(objSession.getObjRaleo().getList().get(i).getNum_baya_2()>-1)out.print(objSession.getObjRaleo().getList().get(i).getNum_baya_2());%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtNB3" name="txtNB3" value="<%if(objSession.getObjRaleo().getList().get(i).getNum_baya_3()>-1)out.print(objSession.getObjRaleo().getList().get(i).getNum_baya_3());%>"/>
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
               <select id="cbTR1" name="cbTR1" >
                   <%
                   if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==0)
                   {
                       out.print("<option value='0' selected>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                   }                                  
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==1)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1' selected>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                    }                       
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==2)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2' selected>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                    }
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_1()==3)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3' selected>CILINDRICO</option>");
                    }
                  %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <select id="cbTR2" name="cbTR2" >
                     <%
                   if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==0)
                   {
                       out.print("<option value='0' selected>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                   }                                  
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==1)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1' selected>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                    }                       
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==2)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2' selected>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                    }
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_2()==3)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3' selected>CILINDRICO</option>");
                    }
                  %>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                 <select id="cbTR3" name="cbTR3" >
                  <%
                   if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==0)
                   {
                       out.print("<option value='0' selected>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                   }                                  
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==1)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1' selected>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                    }                       
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==2)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2' selected>SEMIALADO</option>");
                       out.print("<option value='3'>CILINDRICO</option>");
                    }
                    else if(objSession.getObjRaleo().getList().get(i).getTipo_racimo_3()==3)
                    {
                       out.print("<option value='0'>Selecione una Opción</option>");    
                       out.print("<option value='1'>ALADO</option>");
                       out.print("<option value='2'>SEMIALADO</option>");
                       out.print("<option value='3' selected>CILINDRICO</option>");
                    }
                  %>
                </select>
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtCR1" name="txtCR1" value="<%if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_1()>-1)out.print(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_1());%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtCR1" name="txtCR2" value="<%if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_2()>-1)out.print(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_2());%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtCR1" name="txtCR3" value="<%if(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_3()>-1)out.print(objSession.getObjRaleo().getList().get(i).getCalidad_racimo_3());%>"/>
            </td>
        </tr>                                                                                               
    </table>
</td>

<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtLR1" name="txtLR1" value="<%if(objSession.getObjRaleo().getList().get(i).getLargo_racimo_1()>-1)out.print(objSession.getObjRaleo().getList().get(i).getLargo_racimo_1());%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtLR2" name="txtLR2" value="<%if(objSession.getObjRaleo().getList().get(i).getLargo_racimo_2()>-1)out.print(objSession.getObjRaleo().getList().get(i).getLargo_racimo_2());%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtLR3" name="txtLR3" value="<%if(objSession.getObjRaleo().getList().get(i).getLargo_racimo_3()>-1)out.print(objSession.getObjRaleo().getList().get(i).getLargo_racimo_3());%>"/>
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:150px;"  id="txtO1" name="txtO1" value="<%=objSession.getObjRaleo().getList().get(i).getObservaciones_1()%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:150px;"  id="txtO2" name="txtO2" value="<%=objSession.getObjRaleo().getList().get(i).getObservaciones_2()%>"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:150px;"  id="txtO3" name="txtO3" value="<%=objSession.getObjRaleo().getList().get(i).getObservaciones_3()%>"/>
            </td>
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
                <%=objSession.getObjRaleo().getList().get(i).getObservaciones_1()%>
            </td>
        </tr>
        <tr>
             <td>
                <%=objSession.getObjRaleo().getList().get(i).getObservaciones_2()%>
            </td>
        </tr>
        <tr>
            <td>
                <%=objSession.getObjRaleo().getList().get(i).getObservaciones_3()%>
            </td>
        </tr>                                                                                               
    </table>
</center>
</td>

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
<td><input type="text" style="width:15px;"  id="txtNRP" name="txtNRP" /></td>

<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtNB1" name="txtNB1"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtNB2" name="txtNB2" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtNB3" name="txtNB3" />
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
               <select id="cbTR1" name="cbTR1" >
                    <option value="0">Selecione una Opción</option>
                    <option value="1">ALADO</option>
                    <option value="2">SEMIALADO</option>
                    <option value="3">CILINDRICO</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <select id="cbTR2" name="cbTR2" >
                    <option value="0">Selecione una Opción</option>
                    <option value="1">ALADO</option>
                    <option value="2">SEMIALADO</option>
                    <option value="3">CILINDRICO</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                 <select id="cbTR3" name="cbTR3" >
                    <option value="0">Selecione una Opción</option>
                    <option value="1">ALADO</option>
                    <option value="2">SEMIALADO</option>
                    <option value="3">CILINDRICO</option>
                </select>
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtNB1" name="txtCR1"/>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtTR2" name="txtCR2" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtTR3" name="txtCR3" />
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtLR1" name="txtLR1" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtLR2" name="txtLR2" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:15px;"  id="txtLR3" name="txtLR3" />
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>
    <table>
        <tr>
            <td>
                <input type="text" style="width:150px;"  id="txtO1" name="txtO1" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:150px;"  id="txtO2" name="txtO2" />
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" style="width:150px;"  id="txtO3" name="txtO3" />
            </td>
        </tr>                                                                                               
    </table>
</td>
<td>

<button class="comp_edit btn btn-primary btn-mini" type="submit">Grabar</button><br><br>

<button class="comp_edit btn btn-success btn-mini" onclick="tablaTemp(0)" type="button">Cancelar</button>
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
if(objSession.getObjRaleo()!=null)
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
                                                          <h3 class="heading"><%=Titulo%> Raleo</h3>  
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

                                                        <input type="hidden" id="IdRaleo"  name="IdRaleo" value="<%=objSession.getObjRaleo().getId_raleo()%>" />

                                                        <button class="btn btn-invert" type="submit"><%=Titulo%></button>

                                                        <button class="btn btn-invert" onclick="clear_form()" type="button"><%=Boton%></button>
                                                        
                                                        <%
                                                         if(objSession.getObjRaleo()!=null)
                                                             if(objSession.getObjRaleo().getId_raleo()>0)
                                                             out.print("<button class='btn btn-invert' onclick='restaurar("+objSession.getObjRaleo().getId_raleo()+")' type='button'>Restaurar Todo</button>");
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
            url: 'operaciones/raleo/limpiar_tabla_temp.jsp',
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
                var url = "operaciones/raleo/add_list_tabla_temp.jsp"; 
                
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
            txtNRP: { required: true, digits:true },
            txtNB1: { digits:true  },
            txtNB2: { digits:true  },
            txtNB3: { digits:true  },
            txtCR1: { digits:true  },
            txtCR2: { digits:true  },
            txtCR3: { digits:true  },
            txtLR1: { digits:true  },
            txtLR2: { digits:true  },
            txtLR3: { digits:true  }
       

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
                    var url = "operaciones/raleo/insert.jsp"; 

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
           