

<%@page import="Entidades.entLote"%>
<%@page import="Entidades.entDetalleRecepcion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
    if(request.getParameter("cbLote") != null && request.getParameter("cbLote") != "" &&
       request.getParameter("cbCategoria") != null && request.getParameter("cbCategoria") != "" &&
       request.getParameter("cbJaba") != null && request.getParameter("cbJaba") != "" &&
       request.getParameter("cbParihuela") != null && request.getParameter("cbParihuela") != "" &&
       request.getParameter("txtNLote") != null && request.getParameter("txtNLote") != "" &&
       request.getParameter("txtPBruto") != null && request.getParameter("txtPBruto") != "" &&
       request.getParameter("txtNJabas") != null && request.getParameter("txtNJabas") != "" &&
       request.getParameter("posicion") != null && request.getParameter("posicion") != "")
    {
        int pos = Integer.parseInt(request.getParameter("posicion"));  

        
        entDetalleRecepcion entidad=new entDetalleRecepcion();
        entidad.setObjLote(new entLote(Integer.parseInt(request.getParameter("cbLote")),request.getParameter("txtNLote")));
        entidad.setNum_jabas(Double.parseDouble(request.getParameter("txtNJabas")));
        entidad.setPeso_bruto(Double.parseDouble(request.getParameter("txtPBruto")));
       
        int size=objSession.getObjRecepcion().getListaCategoria().size();
        for(int i=0; i<size;i++)
           if(objSession.getObjRecepcion().getListaCategoria().get(i).getId_categoria()==Integer.parseInt(request.getParameter("cbCategoria")))
            {
                entidad.setObjCategoria(objSession.getObjRecepcion().getListaCategoria().get(i));
                i=size;
            }
        
        size=objSession.getObjRecepcion().getListaJaba().size();
        for(int i=0; i<size;i++)
           if(objSession.getObjRecepcion().getListaJaba().get(i).getId_jaba()==Integer.parseInt(request.getParameter("cbJaba")))
            {
                entidad.setObjJaba(objSession.getObjRecepcion().getListaJaba().get(i));
                i=size;
            }
       
        size=objSession.getObjRecepcion().getListaParihuela().size();
        for(int i=0; i<size;i++)
           if(objSession.getObjRecepcion().getListaParihuela().get(i).getId_parihuela()==Integer.parseInt(request.getParameter("cbParihuela")))
            {
                entidad.setObjParihuela(objSession.getObjRecepcion().getListaParihuela().get(i));
                i=size;
            }
        
        

         
        if(pos>=0)
        {
            if(objSession.getObjRecepcion().getId_recepcion()>0)
            {
                entidad.setSeleccion(true);
                entidad.setId_det_recepcion(objSession.getObjDesbrote().getList().get(pos).getId_cabecera_desbrote());
            }
            
            objSession.getObjRecepcion().getLista().remove(pos);
            objSession.getObjRecepcion().getLista().add(pos, entidad);
        }
        else
        {
            objSession.getObjRecepcion().getLista().add(entidad);
        }
        
        HttpSession sesion = request.getSession();
        sesion.setAttribute("SessionUsuario", objSession); 
        sesion.setMaxInactiveInterval(-1);

    }
}
%>