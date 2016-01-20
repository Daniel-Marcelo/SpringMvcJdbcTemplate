      
      function drawChart(variable) {
    	  
    	var abcd = '"${googleHistQuotes}"';
    	var a = abcd;
    	console.log(abcd);
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        
        //var list = '$(googleHistQuotes}';

		console.log(variable[0].date)


        data.addColumn('number', 'Gliese 163 mission');
		for(var key in variable){
			
			console.log(variable[key].date);
			var date = new Date(variable[key].date.year, variable[key].date.month, variable[key].date.dayOfMonth);
			data.addRows([
			              [date, variable[key].close]
			              ]);
		}

/*         data.addRows([
          [new Date(2314, 1, 15), 10645],
          [new Date(2314, 2, 16), 12374],
          [new Date(2314, 3, 17), 15766],
          [new Date(2314, 4, 18), 34334],
          [new Date(2314, 5, 19), 66467],
          [new Date(2314, 6, 20), 79463]
        ]); */
        	

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }