<%@page import="Entidades.entFormulario"%>
<%@page import="Entidades.entModulo"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entSesion"%>
<%   
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{     
%>
<header>
                <div class="navbar navbar-fixed-top">
                    <div class="navbar-inner">
                        <div class="container-fluid">
                            <a class="brand" href="intranet.jsp"><i class="icon-home icon-white"></i>   Inicio</a>
                            <ul class="nav user_menu pull-right">
                                <li class="hidden-phone hidden-tablet">
                                 
                                </li>
                                <li class="divider-vertical hidden-phone hidden-tablet"></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=objSession.getObjUsuario().getNombre()%> <%=objSession.getObjUsuario().getApellido()%> <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                   
                                    <li class="divider"></li>
                                    <li><a href="javascript:void(0)" onclick="cerrarSesion()" >Cerrar Sesión</a></li>
                                    </ul>
                                </li>
                            </ul>
							<a data-target=".nav-collapse" data-toggle="collapse" class="btn_menu">
								<span class="icon-align-justify icon-white"></span>
							</a>
                            <nav>
                                <div class="nav-collapse">
                                    <ul class="nav">
                                 <%
                                    List<entModulo> list=objSession.getListModulos();
                                    if(list!=null)
                                    {
                                        List<entFormulario> listFormulario=objSession.getListModulos().get(objSession.getPosicion()).getList();
                                        if(listFormulario!=null)
                                        for(entFormulario padre : listFormulario)
                                        {
                                            if(padre.getPadre()==0)
                                            {                                              
                                                out.print("<li class='dropdown'>");
                                                out.print("<a data-toggle='dropdown' class='dropdown-toggle' href='"+padre.getUrl()+"'><i class='icon-list-alt icon-white'></i> "+padre.getEtiqueta()+" <b class='caret'></b></a>");
                                                out.print("<ul class='dropdown-menu'>");
                                                for(entFormulario hijo : listFormulario)
                                                    if(hijo.getPadre()==padre.getId_formulario())
                                                        out.print("<li><a href='"+hijo.getUrl()+"'>"+hijo.getEtiqueta()+"</a></li>");
                                                out.print("</ul>");
                                                out.print("</li>");
                                            }
                                        }
                                    }
                                %>
                                        
                                  
                                       
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
      
      
                <div class="modal hide fade" id="myMail">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h3>New messages</h3>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-info">In this table jquery plugin turns a table row into a clickable link.</div>
                        <table class="table table-condensed table-striped" data-rowlink="a">
                            <thead>
                                <tr>
                                    <th>Sender</th>
                                    <th>Subject</th>
                                    <th>Date</th>
                                    <th>Size</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Declan Pamphlett</td>
                                    <td><a href="javascript:void(0)">Lorem ipsum dolor sit amet</a></td>
                                    <td>23/05/2012</td>
                                    <td>25KB</td>
                                </tr>
                                <tr>
                                    <td>Erin Church</td>
                                    <td><a href="javascript:void(0)">Lorem ipsum dolor sit amet</a></td>
                                    <td>24/05/2012</td>
                                    <td>15KB</td>
                                </tr>
                                <tr>
                                    <td>Koby Auld</td>
                                    <td><a href="javascript:void(0)">Lorem ipsum dolor sit amet</a></td>
                                    <td>25/05/2012</td>
                                    <td>28KB</td>
                                </tr>
                                <tr>
                                    <td>Anthony Pound</td>
                                    <td><a href="javascript:void(0)">Lorem ipsum dolor sit amet</a></td>
                                    <td>25/05/2012</td>
                                    <td>33KB</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <a href="javascript:void(0)" class="btn">Go to mailbox</a>
                    </div>
                </div>
      
      
                <div class="modal hide fade" id="myTasks">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h3>New Tasks</h3>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-info">In this table jquery plugin turns a table row into a clickable link.</div>
                        <table class="table table-condensed table-striped" data-rowlink="a">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Summary</th>
                                    <th>Updated</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>P-23</td>
                                    <td><a href="javascript:void(0)">Admin should not break if URL&hellip;</a></td>
                                    <td>23/05/2012</td>
                                    <td class="tac"><span class="label label-important">High</span></td>
                                    <td>Open</td>
                                </tr>
                                <tr>
                                    <td>P-18</td>
                                    <td><a href="javascript:void(0)">Displaying submenus in custom&hellip;</a></td>
                                    <td>22/05/2012</td>
                                    <td class="tac"><span class="label label-warning">Medium</span></td>
                                    <td>Reopen</td>
                                </tr>
                                <tr>
                                    <td>P-25</td>
                                    <td><a href="javascript:void(0)">Featured image on post types&hellip;</a></td>
                                    <td>22/05/2012</td>
                                    <td class="tac"><span class="label label-success">Low</span></td>
                                    <td>Updated</td>
                                </tr>
                                <tr>
                                    <td>P-10</td>
                                    <td><a href="javascript:void(0)">Multiple feed fixes and&hellip;</a></td>
                                    <td>17/05/2012</td>
                                    <td class="tac"><span class="label label-warning">Medium</span></td>
                                    <td>Open</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <a href="javascript:void(0)" class="btn">Go to task manager</a>
                    </div>
                </div>
</header>

<script>
                            
                            
      function cerrarSesion(){
        smoke.confirm('Desea Cerrar Sesión',function(e){
                if (!e){
                        window.location='operaciones/sesion/cerrar_sesion.jsp';
                }
        }, {ok:"No", cancel:"Si"});
        }
</script>

<%}%>     