
<%@page import="Entidades.entLote"%>
<%@page import="Com.clsGestor"%>
<%@page import="java.util.List"%>
<%
 if(request.getParameter("s1") != null && request.getParameter("s1") != "" &&
    request.getParameter("s2") != null && request.getParameter("s2") != "" &&
    request.getParameter("s3") != null && request.getParameter("s3") != "")
{

%>
<div id="pre_raleo" style="height:150px;width:90%;margin:15px auto 0"></div>

<script type="text/javascript">
$(function () { 
    var data = [
    <%out.print("{label: '% RACIMOS RALOS', data: "+request.getParameter("s1")+"},");
    out.print("{label: '%RACIMOS BIEN ARREGLADOS', data: "+request.getParameter("s2")+"},");
    out.print("{label: '% RACIMOS APRETADOS', data: "+request.getParameter("s3")+"}");%>
        
    ];
 
    var options = {
            series: {
               pie: {
                                show: true,
                                innerRadius: 0.5,
                                highlight: {
                                    opacity: 0.2
                                }
                            }
                    },
             grid:{
                    hoverable: true,
                    clickable: true
                }
         };
 
    $.plot($("#pre_raleo"), data, options);  
    
       $("#pre_raleo").qtip({
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
            $("#pre_raleo").on('plothover', function(event, pos, obj) {
                
                // Grab the API reference
                var self = $(this),
                    api = $(this).qtip(),
                    previousPoint, content,
         
                // Setup a visually pleasing rounding function
                round = function(x) { return Math.round(x * 1000) / 1000; };
         
                // If we weren't passed the item object, hide the tooltip and remove cached point data
                if(!obj) {
                    api.cache.point = false;
                    return api.hide(event);
                }
         
                // Proceed only if the data point has changed
                previousPoint = api.cache.point;
                if(previousPoint !== obj.seriesIndex)
                {
                    percent = parseFloat(obj.series.percent).toFixed(2);
                    // Update the cached point data
                    api.cache.point = obj.seriesIndex;
                    // Setup new content
                    content = obj.series.label + ' ( ' + percent + '% )';
                    // Update the tooltip content
                    api.set('content.text', content);
                    // Make sure we don't get problems with animations
                    //api.elements.tooltip.stop(1, 1);
                    // Show the tooltip, passing the coordinates
                    api.show(pos);
                }
            });
    
});
</script>

<%
}else
    out.print("No se enontraron datos.");
%>


