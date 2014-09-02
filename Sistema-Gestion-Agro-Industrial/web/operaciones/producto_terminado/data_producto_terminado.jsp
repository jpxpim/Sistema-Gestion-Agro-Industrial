<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entProductoTerminado"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{%>
<div id="producto_terminado">
<script type="text/javascript">
producto= {
     'entidad': [ 
    <%
    List<entProductoTerminado> listProductoTerminado = clsGestor.ListarPorDiaRecepccionProductoTerminado(objSession.getObjDiaRecepcion().getId_dia_recepcion());
    if(listProductoTerminado!=null)
    {
      int size=listProductoTerminado.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getCodigo_control()+"'}");
        }else
        {
             out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getCodigo_control()+"'},");
        }
    }%>
     ]
};
</script> 
</div>

<%}%>