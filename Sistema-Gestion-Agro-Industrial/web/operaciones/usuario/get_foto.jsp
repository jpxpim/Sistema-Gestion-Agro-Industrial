 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="Entidades.entUsuario"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
if(request.getParameter("id") != null && request.getParameter("id") != "")
{
byte[] foto=clsGestor.getFotoUsuario(Integer.parseInt(request.getParameter("id")));
BASE64Encoder e = new BASE64Encoder();
out.print("data:image/png;base64,"+e.encodeBuffer(foto));
}

%>  
                                                                        
                                                                       
                                                                            