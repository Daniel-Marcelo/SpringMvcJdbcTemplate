<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
               <meta charset="utf-8">
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   	<script src="resources/js/stock-chart.js"></script> 
   
   <c:set var="x" value="${googleHistQuotes}" />
	
     <script type='text/javascript'>
   
    var variable=${x};
	console.log(variable[0]);

      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(drawChart(variable));
      
      
     
    </script>
    </head>
    
    
    <body>
    <%@include file="header.jsp" %>
    
    
    
    
    
    
 <div id='chart_div' style='width: 900px; height: 500px;'></div>    
<!-- <div id="parent" style='width: 1500px; height: 1500px; background-color: black; display: flex;' >
  <div id="wide" style= 'width: 500px; height: 500px; background-color: red;'>Wide (rest of width)</div>
  <div id="narrow" style= 'width: 200px; height: 500px; background-color: yellow;'>Narrow (200px)</div>
</div> -->
    
    
    
    <%@include file="footer.jsp" %>
    
    </body>
</html>
