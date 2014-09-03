
<%@page import="Entidades.entProductoTerminado"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<div id="prueba">
<%
List<entProductoTerminado> list=clsGestor.GraficoAcumulativoDiaProduccionProductoTerminado(); 
if(list!=null)
{
int size=list.size();
%>
<div class="heading clearfix">
    <h3 class="pull-left">Another Chart</h3>
    <span class="pull-right label label-info ttip_t" >N Cajas: <%=list.get(0).getId_dia_recepcion()%></span>
</div>
<div id="fl_b" style="height:270px;width:90%;margin:15px auto 0"></div>
<script type="text/javascript">
$(function () { 
   
	// Setup the placeholder reference
            var elem = $('#fl_b');
			
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
			
			fl_b_plot = $.plot(elem,
			    [
					{ data: oilprices, label: "Cajas (und.)",lines: { fill: true} }
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

                    var date = fl_b_plot.getData()[0].data[items[0].dataIndex];
                    // formated by Moment.js
                    var date_formated = moment(date[0]).format('MMMM D, h:mm:ss a');
                    
                    var oilprices_label = fl_b_plot.getData()[0].label,
                        oilprices_val = fl_b_plot.getData()[0].data[items[0].dataIndex];

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
    out.print("No se enontraron datos.");

%>


</div>