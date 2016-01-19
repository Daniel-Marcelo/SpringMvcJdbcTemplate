<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Contact</title>

	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>

    
    
</head>
<body>
    <%@include file="header.html" %>
    
	<div align="center">
		<h1>User Login</h1>
		<form:form action="checkingIfUserExists" method="post" modelAttribute="newLogin">
		<table>
			<tr>
				<td>email</td>
				<td><form:input path="email" /></td>
			<tr>
			
			<tr>
				<td>Password</td>
				<td><form:input path="password" type ="password"/></td>
			<tr>

			<tr>
				<td colspan="2" align="center"><input type="submit" value="Save"></td>
			</tr>
		</table>
		</form:form>
	</div>
	
	    <%@include file="footer.html" %>
	
</body>
</html>