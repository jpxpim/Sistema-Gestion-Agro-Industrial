<%-- 
    Document   : Reporte
    Created on : 26/12/2012, 09:05:24 AM
    Author     : Unknown
--%>


<%@page import="codigoBarras.getCodigo"%>
<%@page import="java.io.InputStream"%>
<%@page import="net.sf.jasperreports.engine.JREmptyDataSource"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 


                     
File reportFile = new File(application.getRealPath("/etiqueta_traza.jasper")); 

 Map parametros = new HashMap();
       parametros.clear();
       parametros.put("codoBarras1",getCodigo.generateBarras("31071433824492", 120, 400) );
       parametros.put("codoBarras2", getCodigo.generateBarras("31071433824492", 120,400));
       parametros.put("code1", "31071433824492");
       parametros.put("code2", "31071433824492");


byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parametros, new JREmptyDataSource()); 

response.setContentType("application/pdf");
response.setContentLength(bytes.length); 
ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length);
ouputStream.flush(); 
ouputStream.close(); 

%>
