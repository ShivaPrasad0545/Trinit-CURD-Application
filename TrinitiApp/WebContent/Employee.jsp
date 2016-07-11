<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/app.css">
<title>Triniti | Add Employee</title>
<script type="text/javascript">
function callservlet() {	
	document.location.href = "EmployeeController?action=list";
}
	function validation(){
		var name=document.getElementById("name");
		var salary=document.getElementById("salary");
		var email=document.getElementById("email");
		
		if(validation_Name(name,"* For your name please use alphabets only *")){
			if(validation_Salary(salary,"*Invalid salary *")){
				if(validation_Email(email,"* Please enter a valid email address *")){
					return true;
				}
			}
		}
		return false;
	}
	function validation_Name(inputtext,alertMsg){
		var alphaExp = /^[a-zA-Z]+$/;
		if (inputtext.value.match(alphaExp)) {
		return true;
		} else {
			console.log(alertMsg);
		document.getElementById('nameid').innerText = alertMsg; // This segment displays the validation rule for name.
		//alert(alertMsg);
		console.log(alertMsg);
		inputtext.focus();
		return false;
		}
	}
	function validation_Salary(inputtext,alertMsg){
		if (isNaN(inputtext.value) || inputtext.value < 1 || inputtext.value > 10000000000) {
			document.getElementById('salid').innerText = alertMsg; 
		        return false;
		   } else {
		       return true;
		   }
	}
	
	function validation_Email(inputtext, alertMsg) {
		var emailExp =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (inputtext.value.match(emailExp)) {
		return true;
		} else {
		document.getElementById('emailid').innerText = alertMsg; // This segment displays the validation rule for email.
		inputtext.focus();
		return false;
		}
		}
</script>

</head>
<body>
	<div
		style="background-image: url('imgs/fullheader.jpg'); width: 100%; height: 100px;">
	</div>
	<div style="background-image: url('imgs/body.jpg'); height: 500px;">
		<form method="POST" action='EmployeeController' name="frmAddEmp" onsubmit='return validation()'>
			<table border=0 align="center"
				style="border-color: white; color: white;">
				<tr>
					<td>Employee ID :</td>
					<td><input type="text" name="eid" id="eid" readonly="readonly"
						placeholder="Auto Increment ID"
						value="<c:out value="${employee.employeeId}"  />" /></td>
				</tr>
				<tr>
					<td>Employee Name :</td>
					<td><input type="text" name="employeename" id="name" required="required"
						value="<c:out value="${employee.employeeName}" />" /></td>
						<td style="border: none;color: red;"><p id="nameid"></p></td>
				</tr>
				<tr>
					<td>Salary :</td>
					<td><input type="text" name="salary" id="salary" required="required"
						value="<c:out value="${employee.salary}" />" /></td>
						<td style="border: none;color: red;"><p id="salid"></p></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input type="text" name="email" id="email" required="required"
						value="<c:out value="${employee.emailId}" />" /></td>
						<td style="border: none;color: red;"><p id="emailid"></p></td>
				</tr>
				<tr>
					<td style="border: 0;"><input type="submit" value="SUBMIT"
						class="add" style="background: #000066"></td>
				</tr>
			</table>
		</form><br>
		
	</div>
	<div style="background-image: url('imgs/footer1.jpg'); width: 100%; height: 40px;">
		<a  href="Search.jsp" style="margin-left:25%;text-decoration: none; font-size: 20px; color: white;">Search</a>
		<a href="javascript:callservlet();" name="fetchdata" style="margin-left:10%;text-decoration: none; font-size: 20px; color: white;">Home</a>
	</div>
</body>
</html>