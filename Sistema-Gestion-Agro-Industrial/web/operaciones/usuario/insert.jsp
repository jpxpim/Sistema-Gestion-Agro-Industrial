
<%@page import="Entidades.entSesion"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page import="java.util.Date"%>
<%@page import="Com.clsGestor"%>
<%@page import="Entidades.entUsuario"%>
<%  
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
    if(request.getParameter("idUsuario") != null && request.getParameter("idUsuario") != ""  &&
            request.getParameter("txtNombres") != null && request.getParameter("txtNombres") != "" &&
            request.getParameter("txtApellidos") != null && request.getParameter("txtApellidos") != "" &&
            request.getParameter("txtEmail") != null && request.getParameter("txtEmail") != "" &&
            request.getParameter("txtTelefono") != null && request.getParameter("txtTelefono") != "" &&
            request.getParameter("txtCelular") != null && request.getParameter("txtCelular") != "" &&
            request.getParameter("txtFNacimiento") != null && request.getParameter("txtFNacimiento") != "" &&
            request.getParameter("txtFoto") != null && request.getParameter("txtFoto") != "" &&
            request.getParameter("txtLogin") != null && request.getParameter("txtLogin") != "" &&
            request.getParameter("txtCodigoERP") != null && request.getParameter("txtCodigoERP") != "" &&
            request.getParameter("rbEstado") != null && request.getParameter("rbEstado") != "")
    {
        String foto="";
        entUsuario entidad = new entUsuario();
        entidad.setNombre(request.getParameter("txtNombres"));
        entidad.setApellido(request.getParameter("txtApellidos"));
        entidad.setEmail(request.getParameter("txtEmail"));
        entidad.setTelefono(request.getParameter("txtTelefono"));
        entidad.setCelular(request.getParameter("txtCelular"));
        entidad.setFecha_nacimiento(new Date(request.getParameter("txtFNacimiento")));
        entidad.setLogin(request.getParameter("txtLogin"));
        entidad.setCodigo_erp(request.getParameter("txtCodigoERP"));
        entidad.setUsuario_responsable(objSession.getObjUsuario().getApellido()+", "+objSession.getObjUsuario().getNombre());
        entidad.setContrasena(objSession.getObjConfiguracion().getUsuario_clave());
        entidad.setEstado(true);
        if(request.getParameter("rbEstado").equals("0"))
             entidad.setEstado(false);
        
        if(!request.getParameter("txtFoto").equals("null"))
        {
            foto=request.getParameter("txtFoto");
            foto=foto.replace("data:image/png;base64,", "");
            BASE64Decoder decoder = new BASE64Decoder();
            entidad.setFoto(decoder.decodeBuffer(foto));
        }
        else
            entidad.setFoto(null);
        if(!request.getParameter("idUsuario").equals("0") )
        {
            entidad.setId_usuario(Integer.parseInt(request.getParameter("idUsuario")));
             if(clsGestor.actualizarUsuario(entidad))
             {
                 out.print(0);
             }
             else
                 out.print(-1);
        }
         else
         {
             int id=clsGestor.insertarUsuario(entidad);
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