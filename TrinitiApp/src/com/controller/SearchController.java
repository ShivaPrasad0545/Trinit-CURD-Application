package com.controller;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDAO dao;
	private static String LIST_USER = "/listEmployees.jsp";
	String forward = "";

	public SearchController() {
		dao = new EmployeeDAO();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Employee> employeeList = new ArrayList<Employee>();
		response.setContentType("text/html");
		
		
		String searchInput=request.getParameter("search");
		try{
		employeeList=dao.getSearchEmployees(searchInput);
		forward = LIST_USER;
		request.setAttribute("employees", employeeList);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
