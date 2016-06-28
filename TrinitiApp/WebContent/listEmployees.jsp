<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All Employees</title>
<link rel="stylesheet" type="text/css" href="css/app.css">
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
<body style="padding: 0; margin: 0; margin:">
	<div
		style="background-image: url('imgs/fullheader.jpg'); width: 100%; height: 100px;">
	</div>
	<div style="background-image: url('imgs/body.jpg'); height: 500px;">
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
							class="btn">Update</a></td>
						<td><a
							href="EmployeeController?action=delete&employeeId=<c:out value="${employee.employeeId}"/>"
							class="btn">Delete</a></td>
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

		<div align="center">
			<div>
				<form name="getdata" action="JsonServlet" method="post">
					<input type="button" name="fetchdata" value="Home" class="add"
						style="background: #ff8000" onclick="return callservlet();">

				</form>
			</div>
			<div>
				<form action="/TrinitiApp/SearchController" method="post">
					<p style="color: #003399;">Enter Employee Name:</p>
					<input type="text" name="search"> <input type="submit"
						value="SEARCH" class="add" style="background: #ff8000">
				</form>
			</div>
		</div>

	</div>
	<div
		style="background-image: url('imgs/footer.jpg'); width: 100%; height: 40px;"></div>
</body>
</html>