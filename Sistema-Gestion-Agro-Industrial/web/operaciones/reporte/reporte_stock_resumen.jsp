<%@page import="Entidades.entCalibre"%>
<%@page import="Com.Operaciones"%>
<%@page import="Entidades.entReporte"%>
<%@page import="java.util.Date"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entSesion"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    SimpleDateFormat e=new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat fecha=new SimpleDateFormat("dd - MM - yyyy : HH:mm a");
    
%>
<%response.setHeader("Content-Disposition", "attachment; filename=\"Reporte Resumen de Stock "+e.format(new Date())+".xls\"");%>
<%
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
<center><h1>REPORTE RESUMEN DE STOCK </h1></center>
<table border="1">
    
    <tr>
                   <td><center><strong>Cliente</strong></center></td>
                   <td><center><strong>Variedad</strong></center></td>
                   <td><center><strong>Envase</strong></center></td>
                   <td><center><strong>Peso</strong></center></td>
                   <td><center><strong>Categoria</strong></center></td>
                    <%
                    List<entCalibre> listCalibre=clsGestor.ListarCalibre(false);
                    if(listCalibre!=null)
                    for(entCalibre objCalibre : listCalibre)
                    {
                        out.print("<td><center><strong>"+objCalibre.getNombre()+"</strong></center></td>");
                    }
                    %>
                    
                   <td><center><strong>Cajas</strong></center></td>
                   <td><center><strong>Paletas</strong></center></td>
    </tr>
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
                        out.print("<td>X</td>");
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
        
        </table>
<%out.print(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre()+" "+fecha.format(new Date())); %>
<%} }}%>  
           