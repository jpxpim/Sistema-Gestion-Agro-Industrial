 <%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entTunel"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
 if(request.getParameter("XContenedor") != null && request.getParameter("XContenedor") != "" &&
    request.getParameter("YContenedor") != null && request.getParameter("YContenedor") != "")   
{
 int posX=Integer.parseInt(request.getParameter("XContenedor"));
 int posY=Integer.parseInt(request.getParameter("YContenedor"));
 int ids=1;
%>
<div id="ContenedorFilas">
    
    <table>
        <%for(int i=0;i<posX;i++){%>
            <tr>
                <%for(int y=0;y<posY;y++){%>
                    <td>
                        <a href="javascript:void(0)" id="pos<%=ids%>" onclick="selectPosicion(<%=ids%>)" class="comp_edit btn btn-primary"><% if(ids<10) out.print("0"+ids);else  out.print(ids);%></a>
                    </td>
                <%ids++;}%>
            </tr>
        <%}%>
    </table>
<script type="text/javascript">
for (x=0;x<ContenedoresPos.length;x++){
    $('#pos'+ContenedoresPos[x]).hide();    

}
</script>
</div>

<%} %>  
                                                                        
                                                                       
                