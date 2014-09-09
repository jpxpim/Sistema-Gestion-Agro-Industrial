<%@page import="Entidades.entDetallePaleta"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
if(request.getParameter("completo") != null && request.getParameter("completo") != "")
{%>

<div id="detalle_palete">
<script type="text/javascript">
producto= {
     'entidad': [ 
    <%
    List<entDetallePaleta> listProductoTerminado = null;
    if(request.getParameter("completo").equals("1"))
    listProductoTerminado = clsGestor.ListarPorProductoTerminadoMovimientosPaleta(true);
    else
       listProductoTerminado = clsGestor.ListarPorProductoTerminadoMovimientosPaleta(false);
    if(listProductoTerminado!=null)
    {
      int size=listProductoTerminado.size();
     for(int i=0;i<size;i++)
        if(i==(size-1))
        {
            out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjProductoTerminado().getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjProductoTerminado().getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getObjProductoTerminado().getCodigo_control()+"','id_det_paleta': "+listProductoTerminado.get(i).getId_det_paleta()+",'id_paleta': "+listProductoTerminado.get(i).getId_paleta()+",'estado_paleta': "+listProductoTerminado.get(i).getId_paleta_origen()+"}");
        }else
        {
             out.print("{'id_producto_terminado': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_producto_terminado()+",'id_lote': "+listProductoTerminado.get(i).getObjProductoTerminado().getObjLote().getId_lote()+",'numero_cajas': "+listProductoTerminado.get(i).getObjProductoTerminado().getId_dia_recepcion()+",'n_calibre': '"+listProductoTerminado.get(i).getObjProductoTerminado().getObjCalibre().getNombre()+"','codigo_control': '"+listProductoTerminado.get(i).getObjProductoTerminado().getCodigo_control()+"','id_det_paleta': "+listProductoTerminado.get(i).getId_det_paleta()+",'id_paleta': "+listProductoTerminado.get(i).getId_paleta()+",'estado_paleta': "+listProductoTerminado.get(i).getId_paleta_origen()+"},");
        }
    }%>
     ]
};
</script> 
</div>

<%}%>