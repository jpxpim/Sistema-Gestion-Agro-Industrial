 <%@page import="Com.Operaciones"%>
<%@page import="Entidades.entCalibre"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entReporte"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
if(request.getParameter("cbPosicion") != null && request.getParameter("cbPosicion") != "" &&
        request.getParameter("cbEstado") != null && request.getParameter("cbEstado") != "" &&
        request.getParameter("cbLote") != null && request.getParameter("cbLote") != "" &&
        request.getParameter("cbVariedad") != null && request.getParameter("cbVariedad") != "" &&
        request.getParameter("cbEnvase") != null && request.getParameter("cbEnvase") != "" && 
        request.getParameter("cbCalibre") != null && request.getParameter("cbCalibre") != "" && 
        request.getParameter("cbCliente") != null && request.getParameter("cbCliente") != "" && 
        request.getParameter("cbCategoria") != null && request.getParameter("cbCategoria") != "" && 
        request.getParameter("cbProductor") != null && request.getParameter("cbProductor") != "")
{
List<entReporte> list=clsGestor.listarStockResumenReporte(Integer.parseInt(request.getParameter("cbPosicion")),
        Integer.parseInt(request.getParameter("cbEstado")),Integer.parseInt(request.getParameter("cbLote")),
        Integer.parseInt(request.getParameter("cbVariedad")),Integer.parseInt(request.getParameter("cbEnvase")),
        Integer.parseInt(request.getParameter("cbCalibre")),Integer.parseInt(request.getParameter("cbCliente")),
        Integer.parseInt(request.getParameter("cbCategoria")),Integer.parseInt(request.getParameter("cbProductor")));
if(list!=null)
{%>
<div id="tabla">
<table id="lista" class="table table-striped location_table">
    <thead>
            <tr>
                    <th>Cliente</th>
                    <th>Variedad</th>
                    <th>Envase</th>
                    <th>Peso</th>
                    <th>Categoria</th>
                    <%
                    List<entCalibre> listCalibre=clsGestor.ListarCalibre(false);
                    if(listCalibre!=null)
                    for(entCalibre objCalibre : listCalibre)
                    {
                        out.print("<th>"+objCalibre.getNombre()+"</th>");
                    }
                    %>
                    
                    <th>Cajas</th>
                    <th>Paletas</th>
                    
            </tr>
    </thead> 
     <tbody>      
    <%
    for(entReporte entidad : list)
    {
    %>
                                                                   
        <tr>
            <td><%=entidad.getParametro_1()%></td>
            <td><%=entidad.getParametro_2()%></td>
            <td><%=entidad.getParametro_3()%></td>
            <td><%=entidad.getParametro_4()%></td>
            <td><%=entidad.getParametro_5()%></td>
            <%
                if(listCalibre!=null)
                for(int i=0;i<listCalibre.size();i++)
                {
                    if(entidad.getParametro_6().toUpperCase().trim().equals(listCalibre.get(i).getNombre().toUpperCase().trim()))
                    {
                        listCalibre.get(i).setParametro(true);
                        out.print("<td><i class='splashy-check'></i></td>");
                    }
                    else
                    {
                         out.print("<td></td>");
                    }
                    
                }
            %>
          
            <td><%=entidad.getParametro_7()%></td>
            <td><%=Operaciones.Redondear(Double.parseDouble(entidad.getParametro_8()), 2)%></td>            
        </tr>


    <%
    }
    %>
     </tbody>
    </table>
</div>
<script type="text/javascript">
//la función recibe como parámetros el numero de la columna a ocultar 
 <%
    if(listCalibre!=null)
    for(int i=0;i<listCalibre.size();i++)
    {
       if(!listCalibre.get(i).isParametro())
       {
           int col=5+i;
           out.print("ocultarColumna("+col+") ;");
       }

    }
%>

function ocultarColumna(num) 
{ 
  //aquí utilizamos el id de la tabla, en este caso es 'tabla'
  fila=document.getElementById('lista').getElementsByTagName('tr');

 //mostramos u ocultamos la cabecera de la columna 
 if (fila[0].getElementsByTagName('th')[num].style.display=='none')
    {
    fila[0].getElementsByTagName('th')[num].style.display=''
    }
  else
    {
    fila[0].getElementsByTagName('th')[num].style.display='none'
    }
   //mostramos u ocultamos las celdas de la columna seleccionada
  for(i=1;i<fila.length;i++)
    {
        if (fila[i].getElementsByTagName('td')[num].style.display=='none')
            {
                fila[i].getElementsByTagName('td')[num].style.display='';  
             }      
        else
            {
             fila[i].getElementsByTagName('td')[num].style.display='none'
            }       
    }         
    
}
$(function () { 

   $('#lista').dataTable({
                                           "sPaginationType": "bootstrap",
                                           "sScrollY": "210px",
                                            "bDestroy": true,
                                            "bDeferRender": true
                                                    }); 
 
});
</script>

<%}
else out.print("<center><H3>No se encontraron datos</H3></center>");;
} }%>  
                                                                        
                                                                       
                                                                            