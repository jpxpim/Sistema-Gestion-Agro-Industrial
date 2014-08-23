
<%@page import="Entidades.entLote"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>

<%
 if(request.getParameter("s1") != null && request.getParameter("s1") != "" &&
    request.getParameter("s2") != null && request.getParameter("s2") != "" &&
    request.getParameter("s3") != null && request.getParameter("s3") != "")
{

%>
<div id="barras_raleo_rango_bayas" style="height:150px;width:90%;margin:15px auto 0"></div>

<script type="text/javascript">
$(function () { 
   
   var data = {  label: "Rango Nº bayas (%)",  
    data:   [  
        <%
            out.print("[0,"+request.getParameter("s1")+"],");
            out.print("[1,"+request.getParameter("s2")+"],");
            out.print("[2,"+request.getParameter("s3")+"]");
        %>
        ]
};
var optioms ={
        series: {
            bars: {
                show: true,
                 fillColor:  "#eadac8",
                 barWidth: 0.6,
                 align: "center"
            }
        },
        grid:{
                    hoverable: true,
                    clickable: true
                },
         xaxis: {ticks: [
                 <%
                     out.print("[0,'x < 40'],");
                     out.print("[1,'40 <= x <= 90'],");
                     out.print("[2,'x > 90'],");
                 %>
            ]}
    };


 
    $.plot($("#barras_raleo_rango_bayas"), [data],optioms );
    
     $("#barras_raleo_rango_bayas").qtip({
                prerender: true,
                content: 'Loading...', // Use a loading message primarily
                position: {
                    viewport: $(window), // Keep it visible within the window if possible
                    target: 'mouse', // Position it in relation to the mouse
                    adjust: { x: 7 } // ...but adjust it a bit so it doesn't overlap it.
                },
                show: false, // We'll show it programatically, so no show event is needed
                style: {
                    classes: 'ui-tooltip-shadow ui-tooltip-tipsy',
                    tip: false // Remove the default tip.
                }
            });
         
            // Bind the plot hover
            $("#barras_raleo_rango_bayas").on('plothover', function(event, coords, item) {
                // Grab the API reference
                var self = $(this),
                    api = $(this).qtip(),
                    previousPoint, content,
         
                // Setup a visually pleasing rounding function
                round = function(x) { return Math.round(x * 1000) / 1000; };
         
                // If we weren't passed the item object, hide the tooltip and remove cached point data
                if(!item) {
                    api.cache.point = false;
                    return api.hide(event);
                }
				
                // Proceed only if the data point has changed
                previousPoint = api.cache.point;
                if(previousPoint !== item.seriesIndex)
                {
                    // Update the cached point data
                    api.cache.point = item.seriesIndex;
					
                    // Setup new content
                    content = item.series.label +': '+ round(item.datapoint[1]);
         
                    // Update the tooltip content
                    api.set('content.text', content);
         
                    // Make sure we don't get problems with animations
                    api.elements.tooltip.stop(1, 1);
         
                    // Show the tooltip, passing the coordinates
                    api.show(coords);
                }
            });
    
 
});
</script>

<%
}else
    out.print("No se enontraron datos.");

%>


