<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
               <meta charset="utf-8">
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type='text/javascript'>
      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');

        data.addColumn('number', 'Gliese 163 mission');
        data.addRows([
          [new Date(2314, 1, 15), 10645],
          [new Date(2314, 2, 16), 12374],
          [new Date(2314, 3, 17), 15766],
          [new Date(2314, 4, 18), 34334],
          [new Date(2314, 5, 19), 66467],
          [new Date(2314, 6, 20), 79463]
        ]);

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }
    </script>
    </head>
    
    
    <body>
    <%@include file="header.html" %>
    
    
    
    
    
    
<div id='chart_div' style='width: 900px; height: 500px;'></div>    
    
    
    
    
    <%@include file="footer.html" %>
    
    </body>
</html>
