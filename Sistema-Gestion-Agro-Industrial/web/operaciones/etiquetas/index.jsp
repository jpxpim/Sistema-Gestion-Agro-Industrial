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

       parametros.put("variedad","Red Globe" );
       parametros.put("productor", "Agro Grace");
       parametros.put("ggn", "31071433824492");
       parametros.put("fda", "31071433824492");
       parametros.put("grower", "31071433824492");
       parametros.put("categoria", "I");
       parametros.put("fecha", "21/01/2014");
       parametros.put("envase", "EBG-02");
       parametros.put("lote", "LV0001");
       parametros.put("calibre", "xl");
       parametros.put("codigoBarrasNro1", "31071433824492");      
       
       parametros.put("variedad2","Red Globe" );
       parametros.put("productor2", "Agro Grace");
       parametros.put("ggn2", "31071433824492");
       parametros.put("fda2", "31071433824492");
       parametros.put("grower2", "31071433824492");
       parametros.put("categoria2", "I");
       parametros.put("fecha2", "21/01/2014");
       parametros.put("envase2", "EBG-02");
       parametros.put("lote2", "LV0001");
       parametros.put("calibre2", "xl");
       parametros.put("codigoBarrasNro2", "31071433824492");
       


byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (),parametros, new JREmptyDataSource()); 

response.setContentType("application/pdf");
response.setContentLength(bytes.length); 
ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length);
ouputStream.flush(); 
ouputStream.close(); 

%>
