
<%@page import="Entidades.entSesion"%>
<%@page import="Entidades.entProductoTerminado"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<div id="producto_acumulado_terminado_linea">
<%
entSesion objSession =(entSesion) request.getSession().getAttribute("SessionUsuario");
if(objSession!=null)
{
if(request.getParameter("id") != null && request.getParameter("id") != "" &&
        request.getParameter("intervalo") != null && request.getParameter("intervalo") != "" )
{
List<entProductoTerminado> list=clsGestor.GraficoAcumulativoDiaProduccionProductoTerminado(Integer.parseInt(request.getParameter("id")),Integer.parseInt(request.getParameter("intervalo")),true); 
if(list!=null)
{
int size=list.size();
%>

<div id="cardio_producto_acumulado_terminado_linea"  style="height:170px;width:100%;"></div>
<script type="text/javascript">
$(function () { 
             $('#totaCajasAcumulativas').html('<span id="totaCajasAcumulativas" class="pull-right label label-info ttip_t" >N Cajas: <%=list.get(0).getId_dia_recepcion()%></span>');
	// Setup the placeholder reference
            var elem = $('#cardio_producto_acumulado_terminado_linea');
			
			var oilprices = [
                             <% for(int i=0;i<size;i++)
                                {
                                   if(i==size-1)              
                                       out.print("["+list.get(i).getFecha_produccion().getTime()+","+list.get(i).getId_producto_terminado()+"]");
                                   else
                                      out.print("["+list.get(i).getFecha_produccion().getTime()+","+list.get(i).getId_producto_terminado()+"],");
                                }%>
                           //[1167606000000,1],
                            //[1171234800000,1]
                        ];
			
			function euroFormatter(v, axis) {
				return v.toFixed(axis.tickDecimals) +"?";
			}
			
			cardio_producto_acumulado_terminado_linea_plot = $.plot(elem,
			    [
					{ data: oilprices, label: "Cajas (und.)"}
				],
				{ 
					series: {
						lines: { show: true }
					},
					xaxes: [ { mode: "time",timeformat: "" } ],
					yaxes: [ { min: 0 },
						{
						  tickFormatter: euroFormatter,
						  position: "right"
						}
					],
					grid: { hoverable: true, autoHighlight: false },
                    multihighlight: { mode: 'x' },
					legend: { position: 'sw' },
					colors: [ "#8cc7e0" ]
				}
			);
            
            // Create a tooltip on our chart
            elem.qtip({
                prerender: true,
                content: 'Loading...', // Use a loading message primarily
                position: {
                    viewport: $(window), // Keep it visible within the window if possible
                    target: 'mouse', // Position it in relation to the mouse
                    adjust: { x: 16, y: 24 } // ...but adjust it a bit so it doesn't overlap it.
                },
                show: false, // We'll show it programatically, so no show event is needed
                style: {
                    classes: 'ui-tooltip-shadow ui-tooltip-tipsy',
                    tip: false // Remove the default tip.
                }
            });

            elem.on('multihighlighted', function(event, position, items){
                // Grab the API reference
                var api = $(this).qtip(),
                    content;
                
                if(event.isTrigger) {

                    var date = cardio_producto_acumulado_terminado_linea_plot.getData()[0].data[items[0].dataIndex];
                    // formated by Moment.js
                    var date_formated = moment(date[0]).format('MMMM D, h:mm:ss a');
                    
                    var oilprices_label = cardio_producto_acumulado_terminado_linea_plot.getData()[0].label,
                        oilprices_val = cardio_producto_acumulado_terminado_linea_plot.getData()[0].data[items[0].dataIndex];

                    // Setup new content
                    content = date_formated + '<br/>' + oilprices_label +': '+ oilprices_val[1] ;
         
                    // Update the tooltip content
                    api.set('content.text', content);
         
                    // Make sure we don't get problems with animations
                    api.elements.tooltip.stop(1, 1);
         
                    // Show the tooltip, passing the coordinates
                    api.show(position);
                    
                } else {
                    api.hide();
                }

            });
 
});
</script>

<%
}else
    out.print("<center><h3>No se enontraron datos.</h3></center>");
}}
%>


</div>