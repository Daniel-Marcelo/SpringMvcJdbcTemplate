<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
   <link rel="stylesheet" href="resources/css/header.css">

   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="resources/js/header.js"></script>
   <style>
   
   #lookup{
   	
   		width: 260px;
   		padding: 10px;
   		outline: none;
   		border: 2px solid #999999;
   		border-radius: 5px;
   		font-family: Cambria, Cochin, Georgia, serif;
		font-size: 16px;
		background-image: url('http://www.kirupa.com/images/search.png');
		background-position: 270px -10px;
		background-repeat: no-repeat;
		padding-right: 40px;
   
   }
   
   #lookup:focus{
   
   		background-color: #FFFFFF;
		border-color: #333333;
		box-shadow: 0px 0px 25px -2px #333;
		background-position: 270px -80px;
		
		-webkit-transition: background-color .2s ease-in,
                    background-position .2s ease-in,
                    box-shadow .3s ease-in;
 
-moz-transition: background-color .2s ease-in,
                 background-position .2s ease-in,
                 box-shadow .3s ease-in;
 
-o-transition: background-color .2s ease-in,
               background-position .2s ease-in,
               box-shadow .3s ease-in;
 
-ms-transition: background-color .2s ease-in,
                background-position .2s ease-in,
                box-shadow .3s ease-in;
 
transition: background-color .2s ease-in,
            background-position .2s ease-in,
            box-shadow .3s ease-in;
   
   }
   
.btn {
  background: #ffffff;
  background-image: -webkit-linear-gradient(top, #ffffff, #ffffff);
  background-image: -moz-linear-gradient(top, #ffffff, #ffffff);
  background-image: -ms-linear-gradient(top, #ffffff, #ffffff);
  background-image: -o-linear-gradient(top, #ffffff, #ffffff);
  background-image: linear-gradient(to bottom, #ffffff, #ffffff);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #439fe6;
  font-size: 20px;
  padding: 5px 10px 5px 10px;
  text-decoration: none;
}

.btn:hover {
  background: #e5e7e8;
  background-image: -webkit-linear-gradient(top, #e5e7e8, #e4e8eb);
  background-image: -moz-linear-gradient(top, #e5e7e8, #e4e8eb);
  background-image: -ms-linear-gradient(top, #e5e7e8, #e4e8eb);
  background-image: -o-linear-gradient(top, #e5e7e8, #e4e8eb);
  background-image: linear-gradient(to bottom, #e5e7e8, #e4e8eb);
  text-decoration: none;
}
   </style>
</head>
<body>

	<div id='cssmenu'>
		<ul>
		   <li class='active'><a href='home'>Home</a></li>
		   <li><a href='register'>Register</a></li>
		   <li><a href='login'>Login</a></li>
		   <li><a href='#'>Stock Look Up</a></li>
		   <li><a href='#'>Portfolio</a></li>
		   <li><a href='charts'>Charts</a></li>
		   <li>
		   <form action="register" method="get" id="form1">
		   <input id = "lookup" placeholder="Symbol Lookup..." type="text" path="symbol"	>
		   <input type="submit" value="Submit" class="btn" form="form1">
		   </form>
		   
		   </li>
		   
		   
		   
		</ul>
	</div>
</body>
</html>