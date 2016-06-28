package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EmployeeDAO;
import com.model.Employee;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static String INSERT_OR_EDIT = "/Employee.jsp";
	private static String LIST_USER = "/listEmployees.jsp";
	private EmployeeDAO dao;

	public EmployeeController() {
		dao = new EmployeeDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String forward = "";
		String action = request.getParameter("action");
		
		List<Employee> employeeList = new ArrayList<Employee>();
		response.setContentType("text/html");

		if (action != null) {
			try {
				if (action.equals("delete")) {
					if (request.getParameter("employeeId") != null) {
						int employeeId = Integer.parseInt(request.getParameter("employeeId"));
						dao.deleteEmployee(employeeId);
						employeeList = dao.getAllEmployees();
						forward = LIST_USER;
						request.setAttribute("employees", employeeList);

					}
				}else if (action.equals("update")) {
						forward = INSERT_OR_EDIT;
						Employee employee = new Employee();
						int employeeId = Integer.parseInt(request.getParameter("employee_Id"));
						employee=dao.getEmployeeById(employeeId);
						request.setAttribute("employee", employee);

					}else if (action.equals("list")) {
					// Fetch Data from Employee Table
					employeeList = dao.getAllEmployees();
					forward = LIST_USER;
					request.setAttribute("employees", employeeList);

				} else  {
					forward = INSERT_OR_EDIT;
				}
				RequestDispatcher view = request.getRequestDispatcher(forward);
				view.forward(request, response);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Employee employee = new Employee();
		List<Employee> employeeList = new ArrayList<Employee>();
		
		employee.setEmployeeName(request.getParameter("employeename"));
		employee.setSalary(Double.parseDouble(request.getParameter("salary")));
		employee.setEmailId(request.getParameter("email"));
		String employeeID=request.getParameter("eid");

		if(employeeID==null||employeeID.isEmpty())
		{
			dao.addEmployee(employee);
		}else{
			employee.setEmployeeId(Integer.parseInt(employeeID));
			dao.updateEmployee(employee);
		}
		employeeList=dao.getAllEmployees();
		RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
		request.setAttribute("employees", employeeList);
		view.forward(request, response);
	}

}
