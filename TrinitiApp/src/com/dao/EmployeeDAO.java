package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dbutility.DataAccessObject;
import com.model.Employee;

public class EmployeeDAO {
	private Connection dbConnection;
	private PreparedStatement pStmt;

	public EmployeeDAO() {
		dbConnection = DataAccessObject.getConnection();
	}

	public void addEmployee(Employee employee) {
		/* for mysql*/
		String insertQuery = "INSERT INTO Employee(EMPLOYEENAME, " + "EMAILID, SALARY) VALUES (?,?,?)";
		
		/*in our application for oracle emp_sequence is sequence name for auto increment value*/
		//String insertQuery = insert into Employee (emp_sequence.nextval,EMPLOYEENAME, " + "EMAILID, SALARY) VALUES (?,?,?);
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setString(1, employee.getEmployeeName());
			pStmt.setString(2, employee.getEmailId());
			pStmt.setDouble(3, employee.getSalary());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteEmployee(int employeeID) {
		String deleteQuery = "DELETE FROM EMPLOYEE WHERE EMPLOYEEID = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setInt(1, employeeID);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateEmployee(Employee employee) {
		String updateQuery = "UPDATE EMPLOYEE SET EMPLOYEENAME = ?, " + "SALARY = ?, EMAILID = ? WHERE EMPLOYEEID = ?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);
			pStmt.setString(1, employee.getEmployeeName());
			pStmt.setDouble(2, employee.getSalary());
			pStmt.setString(3, employee.getEmailId());
			pStmt.setInt(4, employee.getEmployeeId());
			System.out.println(pStmt);
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<Employee> getAllEmployees() {
		List<Employee> employees = new ArrayList<Employee>();

		String query = "SELECT * FROM EMPLOYEE ORDER BY EMPLOYEEID";
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Employee employee = new Employee();

				employee.setEmployeeId(rs.getInt("EMPLOYEEID"));
				employee.setEmployeeName(rs.getString("EMPLOYEENAME"));
				employee.setSalary(rs.getDouble("SALARY"));
				employee.setEmailId(rs.getString("EMAILID"));
				employees.add(employee);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return employees;
	}

	public Employee getEmployeeById(int employeeId) {
		Employee employee = new Employee();
		try {
			PreparedStatement preparedStatement = dbConnection
					.prepareStatement("select * from employee where employeeid=?");
			preparedStatement.setInt(1, employeeId);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				employee.setEmployeeId(rs.getInt("employeeId"));
				employee.setEmployeeName(rs.getString("employeeName"));
				employee.setSalary(rs.getDouble("salary"));
				employee.setEmailId(rs.getString("emailId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return employee;
	}

	public List<Employee> getSearchEmployees(String searchKey){
		List<Employee> employees=new ArrayList<Employee>();
		String query="SELECT * FROM EMPLOYEE WHERE EMPLOYEENAME LIKE '"+searchKey+"%'";
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Employee employee = new Employee();

				employee.setEmployeeId(rs.getInt("EMPLOYEEID"));
				employee.setEmployeeName(rs.getString("EMPLOYEENAME"));
				employee.setSalary(rs.getDouble("SALARY"));
				employee.setEmailId(rs.getString("EMAILID"));
				employees.add(employee);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return employees;
	}
}
