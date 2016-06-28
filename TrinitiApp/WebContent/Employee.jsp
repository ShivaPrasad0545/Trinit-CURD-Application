<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/app.css">

<title>Add new employee</title>
<script type="text/javascript">
	function callservlet() {

		var servletname = document.getdata.fetchdata.value;

		if (servletname == "") {
			return false;
		} else {
			document.location.href = "EmployeeController?action=list";
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
		<form method="POST" action='EmployeeController' name="frmAddUser">
			<table border=1 align="center"
				style="border-color: white; color: white;">
				<tr>
					<td>Employee ID :</td>
					<td><input type="text" name="eid" readonly="readonly"
						placeholder="Auto Increment ID"
						value="<c:out value="${employee.employeeId}"  />" /></td>
				</tr>
				<tr>
					<td>Employee Name :</td>
					<td><input type="text" name="employeename" required="required"
						value="<c:out value="${employee.employeeName}" />" /></td>
				</tr>
				<tr>
					<td>Salary :</td>
					<td><input type="text" name="salary" required="required"
						value="<c:out value="${employee.salary}" />" /></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input type="text" name="email" required="required"
						value="<c:out value="${employee.emailId}" />" /></td>
				</tr>
				<tr>
					<td style="border: 0;"><input type="submit" value="SUBMIT"
						class="add" style="background: #000066"></td>
				</tr>
			</table>
		</form><br>
		<div align="center">
			<form name="getdata" action="JsonServlet" method="post">
				<input type="button" name="fetchdata" value="Home" class="add"
					style="background: #000066" onclick="return callservlet();">

			</form>
		</div>
	</div>
	<div
		style="background-image: url('imgs/footer.jpg'); width: 100%; height: 40px;">
	</div>
</body>
</html>