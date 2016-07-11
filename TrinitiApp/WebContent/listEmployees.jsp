<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Triniti | All Employees</title>
<link rel="icon" href="imgs/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/app.css">
<script type="text/javascript">
function callservlet() {	
	document.location.href = "EmployeeController?action=list";
}
</script>
</head>
<body style="padding: 0; margin: 0; margin:">
<div >
	<div style="background-image: url('imgs/fullheader.jpg'); width: 100%; height: 100px; ">
	</div>
	<div style="background-image: url('imgs/body.jpg');  width: 100%;height: 500px;">
		<h3 align="center" style="color: white;">Employee Details :</h3>
		<table border=1 align="center"
			style="border-color: white; color: white;">
			<thead>
				<tr>
					<th>Employee Id</th>
					<th>Employee Name</th>
					<th>Salary</th>
					<th>Email</th>
					<th colspan=2>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${employees}" var="employee">
					<tr>
						<td><c:out value="${employee.employeeId}" /></td>
						<td><c:out value="${employee.employeeName}" /></td>
						<td><c:out value="${employee.salary}" /></td>
						<td><c:out value="${employee.emailId}" /></td>
						<td><a
							href="EmployeeController?action=update&employee_Id=<c:out value="${employee.employeeId}"/>"
							><img alt="edit" src="imgs/edit.png"></a></td>
						<td><a
							href="EmployeeController?action=delete&employeeId=<c:out value="${employee.employeeId}"/>"
							><img alt="delete" src="imgs/delete.png"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<p>
				<a href="EmployeeController?action=create"
					style="color: white; background: #003399" class="add">Add
					Employee</a>
			</p>
		</div>

	</div>
	<div style="background-image: url('imgs/footer1.jpg'); width: 100%; height: 40px;">
	<a  href="Search.jsp" style="margin-left:25%;text-decoration: none; font-size: 20px; color: white;">Search</a>
	<a href="javascript:callservlet();" style="margin-left:25%;text-decoration: none; font-size: 20px; color: white;">Home</a>
	</div>
	</div>
</body>
</html>