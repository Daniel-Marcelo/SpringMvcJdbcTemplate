
var isEmailValid;

function formValidation()
{
/*var uid = document.registration.userName;
var passid = document.registration.password;
var uname = document.registration.userName;
var uadd = document.registration.address;
var ucountry = document.registration.country;
var uzip = document.registration.zip;
var uemail = document.registration.email;
var umsex = document.registration.msex;
var ufsex = document.registration.fsex; */

var uname = document.registration.name;
var uemail = document.registration.email;
var password = document.registration.password;
var country = document.registration.country;

if(allLetter(uname))
{
	if(checkPassword(password))
	{ 			
				ValidateEmail(uemail,myCallBack)
				console.log("Final Test - "+isEmailValid);
				
				if(isEmailValid)
				{
					return true;
				}
		}
	}
return false;
} 


function allLetter(uname)
{ 
	var letters = /^[A-Za-z]+$/;
	
	if(uname.value.match(letters))
	{
		return true;
	}
	
	else
	{
		alert('Username must have alphabet characters only');
		uname.focus();
		return false;
	}
}

function checkPassword(password)
{ 
	var mx = 8 
	var passLength = password.value.length;
	if (passLength == 0 || passLength< mx)
	{
	alert("Password should not be empty / length be over "+mx+" characters");
	password.focus();
	return false;
	}
	return true;
//	var letters = /^[0-9a-zA-Z]+$/;
	
/*	if(uadd.value.match(letters))
	{
		return true;
	}
	
	else
	{
		alert('User address must have alphanumeric characters only');
		uadd.focus();
		return false;
	}*/
}

function ValidateEmail(uemail,myCallBack)
{
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	if(uemail.value.match(mailformat))
	{
		//window.location.reload();
		
		console.log("Correct Format - Checking this email - "+uemail.value);
		
		
		$.ajax({
			async: false,
	        url : 'checkIfEmailAlreadyUsed/'+uemail.value,
	        success : myCallBack
	    });
		
		
		
	}
	else
	{
		alert("You have entered an invalid email address!");
		return false;
	}
} 


function myCallBack(result){
	
	console.log("Connection was a success: "+result);
	
	//if the email already is associated to an account
	if(result > 0 ){
		alert("Email already associated to an account");
		isEmailValid = false;
	}
	else{
		console.log("The email is free to be used.");
		isEmailValid = true;
	}
}
