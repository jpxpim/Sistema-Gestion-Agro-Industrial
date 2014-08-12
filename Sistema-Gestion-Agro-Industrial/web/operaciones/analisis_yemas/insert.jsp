
<%@page import="Entidades.entEvaluador"%>
<%@page import="Entidades.entCampaniaLote"%>
<%@page import="java.util.Date"%>
<%@page import="Entidades.entAnalisisYemas"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{   
        if(request.getParameter("txtFertilidad") != null && request.getParameter("txtFertilidad") != "" &&
                request.getParameter("txtFeminelas") != null && request.getParameter("txtFeminelas") != "" &&
                request.getParameter("txtFecha") != null && request.getParameter("txtFecha") != "" &&
                request.getParameter("idCampaniaLote") != null && request.getParameter("idCampaniaLote") != "" &&
                request.getParameter("idEvaluador") != null && request.getParameter("idEvaluador") != "" &&
                request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "" )
        {
            entAnalisisYemas entidad = new entAnalisisYemas();
            entidad.setFeminelas(Double.parseDouble(request.getParameter("txtFertilidad")));
            entidad.setFertilidad(Double.parseDouble(request.getParameter("txtFertilidad")));
            entidad.setFecha_muestra(new Date(request.getParameter("txtFecha")));
            entidad.setObjCampaniaLote(new entCampaniaLote(Integer.parseInt(request.getParameter("idCampaniaLote"))));
            entidad.setObjEvaluador(new entEvaluador(Integer.parseInt(request.getParameter("idEvaluador"))));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            entidad.setEstado(true);
            if(request.getParameter("rbEstado").equals("0"))
                 entidad.setEstado(false);

            
            if(!request.getParameter("IdAnalasisYemas").equals("0") )
            {
                entidad.setId_analisis_yemas(Integer.parseInt(request.getParameter("IdCultivo")));
                 if(clsGestor.actualizarAnalisisYemas(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarAnalisisYemas(entidad);
                    if(id>0)
                    {
                        out.print(id);
                    }
                    else
                        out.print(-1);
             }
            
        }
}
 %>