
<%@page import="Entidades.entParihuela"%>
<%@page import="Entidades.entJaba"%>
<%@page import="Entidades.entLote"%>
<%@page import="Entidades.entSesion"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entDescarte"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
        if(request.getParameter("cbLote") != null && request.getParameter("cbLote") != "" &&
                request.getParameter("cbJaba") != null && request.getParameter("cbJaba") != "" &&
                request.getParameter("cbParihuela") != null && request.getParameter("cbParihuela") != "" &&
                request.getParameter("txtNJabas") != null && request.getParameter("txtNJabas") != "" &&
                request.getParameter("txtPBruto") != null && request.getParameter("txtPBruto") != "" &&
                request.getParameter("rbRacimo") != null && request.getParameter("rbRacimo") != "" &&
                request.getParameter("rbCampo") != null && request.getParameter("rbCampo") != "" )
        {
            entDescarte entidad = new entDescarte();
            entidad.setObjLote(new entLote(Integer.parseInt(request.getParameter("cbLote"))));
            entidad.setObjJaba(new entJaba(Integer.parseInt(request.getParameter("cbJaba"))));
            entidad.setObjParihuela(new entParihuela(Integer.parseInt(request.getParameter("cbParihuela"))));
            entidad.setNum_jabas(Double.parseDouble(request.getParameter("txtNJabas")));
            entidad.setPeso_bruto(Double.parseDouble(request.getParameter("txtPBruto")));
            entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
            
            entidad.setIs_campo(true);
            if(request.getParameter("rbCampo").equals("0"))
                 entidad.setIs_campo(false);
            
            entidad.setIs_racimo(true);
            if(request.getParameter("rbRacimo").equals("0"))
                 entidad.setIs_racimo(false);

            
            if(!request.getParameter("IdDescarte").equals("0") )
            {
                entidad.setId_descarte(Integer.parseInt(request.getParameter("IdDescarte")));
                 if(clsGestor.actualizarDescarte(entidad))
                 {
                     out.print(0);
                 }
                 else
                     out.print(-1);
            }
             else
             {
                 int id=clsGestor.insertarDescarte(entidad);
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