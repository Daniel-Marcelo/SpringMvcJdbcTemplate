<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
td {
  font-family: Verdana, Geneva, sans-serif;
  font-weight: bold;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Contact</title>

	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
	<script src="resources/js/registration-form-validation.js"></script> 
    
    
</head>
<body onload="document.registration.name.focus();">
    <%@include file="header.jsp" %>
    
	<div align="center">
		<h1>New User</h1>
		<form:form name ="registration" action="saveUser" method="post" modelAttribute="newReg" onSubmit="return formValidation();">
		<table>
			<tr>
				<td>Name</td>
				<td><form:input path="name" /></td>
			<tr>
			<tr>
				<td>Email</td>
				<td><form:input path="email" /></td>
			<tr>
			<tr>
				<td>Password</td>
				<td><form:input path="password" type="password"/></td>
			<tr>
			
			<tr>
				<td>Country</td>
				<td><form:input path="country" /></td>
			<tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Submit"></td>
			</tr>
		</table>
		</form:form>
	</div>
	
	    <%@include file="footer.jsp" %>
	
</body>
</html>