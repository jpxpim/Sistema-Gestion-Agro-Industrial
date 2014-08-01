<%@page import="Entidades.entModulo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.entSesion"%>
<%
    
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{     
%>
<div class="sidebar">
    <div class="antiScroll">
            <div class="antiscroll-inner">
                    <div class="antiscroll-content">
                            <div class="sidebar_inner">								
                                    <div id="side_accordion" class="accordion">

                                            <div class="accordion-group">
                                                    <div class="accordion-heading">
                                                            <a href="#collapseFour" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                                                    <i class="icon-cog"></i> Modulos
                                                            </a>
                                                    </div>
                                                    <div class="accordion-body collapse" id="collapseFour">
                                                            <div class="accordion-inner">
                                                                    <ul class="nav nav-list">
                                                                        <%
                                                                            List<entModulo> list=objSession.getListModulos();
                                                                            if(list!=null)
                                                                            for(int i=0;i<list.size();i++)
                                                                            {
                                                                                if(i>0)
                                                                                out.print("<li class='divider'></li>");
                                                                                if(i==objSession.getPosicion())
                                                                                {
                                                                                 out.print("<li class='active'><a href='#'>"+list.get(i).getEtiqueta()+"</a></li>");
                                                                                }
                                                                                else
                                                                                    out.print("<li><a onclick='getMododulos("+i+")'>"+list.get(i).getEtiqueta()+"</a></li>");
                                                                            }%> 
                                                                    </ul>
                                                            </div>
                                                    </div>

                                            <div class="accordion-group">
                                                    <div class="accordion-heading">
                                                            <a href="#collapseLong" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                                                    <i class="icon-leaf"></i> Long content (scrollbar)
                                                            </a>
                                                    </div>
                                                    <div class="accordion-body collapse" id="collapseLong">
                                                            <div class="accordion-inner">
                                                                    Some text to show sidebar scroll bar<br>
                                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rhoncus, orci ac fermentum imperdiet, purus sapien pharetra diam, at varius nibh tellus tristique sem. Nulla congue odio ut augue volutpat congue. Nullam id nisl ut augue posuere ullamcorper vitae eget nunc. Quisque justo turpis, tristique non fermentum ac, feugiat quis lorem. Ut pellentesque, turpis quis auctor laoreet, nibh erat volutpat est, id mattis mi elit non massa. Suspendisse diam dui, fringilla id pretium non, dapibus eget enim. Duis fermentum quam a leo luctus tincidunt euismod sit amet arcu. Duis bibendum ultricies libero sed feugiat. Duis ut sapien risus. Morbi non nulla sit amet eros fringilla blandit id vel augue. Nam placerat ligula lacinia tellus molestie molestie vestibulum leo tincidunt.
                                                                    Duis auctor varius risus vitae commodo. Fusce nec odio massa, ut dapibus justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus, mauris sit amet feugiat tempor, nulla diam gravida magna, in facilisis sapien tellus non ligula. Mauris sapien turpis, sodales ac lacinia sit amet, porttitor in lacus. Pellentesque tincidunt malesuada magna, in egestas augue sodales vel. Praesent iaculis sapien at ante sodales facilisis.
                                                            </div>
                                                    </div>
                                            </div>


                                            <div class="accordion-group">
                                                    <div class="accordion-heading">
                                                            <a href="#collapse7" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                                               <i class="icon-th"></i> Calculator
                                                            </a>
                                                    </div>
                                                    <div class="accordion-body collapse in" id="collapse7">
                                                            <div class="accordion-inner">
                                                                    <form name="Calc" id="calc">
                                                                            <div class="formSep control-group input-append">
                                                                                    <input type="text" style="width:142px" name="Input" /><button type="button" class="btn" name="clear" value="c" onclick="Calc.Input.value = ''"><i class="icon-remove"></i></button>
                                                                            </div>
                                                                            <div class="control-group">
                                                                                    <input type="button" class="btn btn-large" name="seven" value="7" onclick="Calc.Input.value += '7'" />
                                                                                    <input type="button" class="btn btn-large" name="eight" value="8" onclick="Calc.Input.value += '8'" />
                                                                                    <input type="button" class="btn btn-large" name="nine" value="9" onclick="Calc.Input.value += '9'" />
                                                                                    <input type="button" class="btn btn-large" name="div" value="/" onclick="Calc.Input.value += ' / '">
                                                                            </div>
                                                                            <div class="control-group">
                                                                                    <input type="button" class="btn btn-large" name="four" value="4" onclick="Calc.Input.value += '4'" />
                                                                                    <input type="button" class="btn btn-large" name="five" value="5" onclick="Calc.Input.value += '5'" />
                                                                                    <input type="button" class="btn btn-large" name="six" value="6" onclick="Calc.Input.value += '6'" />
                                                                                    <input type="button" class="btn btn-large" name="times" value="x" onclick="Calc.Input.value += ' * '" />
                                                                            </div>
                                                                            <div class="control-group">
                                                                                    <input type="button" class="btn btn-large" name="one" value="1" onclick="Calc.Input.value += '1'" />
                                                                                    <input type="button" class="btn btn-large" name="two" value="2" onclick="Calc.Input.value += '2'" />
                                                                                    <input type="button" class="btn btn-large" name="three" value="3" onclick="Calc.Input.value += '3'" />
                                                                                    <input type="button" class="btn btn-large" name="minus" value="-" onclick="Calc.Input.value += ' - '" />
                                                                            </div>
                                                                            <div class="formSep control-group">
                                                                                    <input type="button" class="btn btn-large" name="dot" value="." onclick="Calc.Input.value += '.'" />
                                                                                    <input type="button" class="btn btn-large" name="zero" value="0" onclick="Calc.Input.value += '0'" />
                                                                                    <input type="button" class="btn btn-large" name="DoIt" value="=" onclick="Calc.Input.value = Math.round( eval(Calc.Input.value) * 1000)/1000" />
                                                                                    <input type="button" class="btn btn-large" name="plus" value="+" onclick="Calc.Input.value += ' + '" />
                                                                            </div>													
                                                                    </form>
                                                            </div>
                                                     </div>
                                            </div>
                                    </div>

                                    <div class="push"></div>
                            </div>

                    </div>
            </div>
    </div>
</div>                                                                                               
<%}%>           