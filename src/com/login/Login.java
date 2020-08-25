package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uName = request.getParameter("userName");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		if (uName.equals("testuser") && password.equals("testuser123")) {
			
			int[] transactionNumber = new int[0];
			int[] transactionAmount = new int[0];
			String[] transationAccount = new String[0];
			String[] transationDate = new String[0];
			int[] transactionBalance = new int[0];
			
			session.setAttribute("user", uName);
			session.setAttribute("accountNo", "1234567890");
			session.setAttribute("accountType", "Savings");
			session.setAttribute("balance", 200);
			session.setAttribute("registered", false);
			session.setAttribute("dailylimit", -1);
			
			session.setAttribute("transactionNumber",transactionNumber);
			session.setAttribute("transactionAmount",transactionAmount);
			session.setAttribute("transationAccount",transationAccount);
			session.setAttribute("transationDate",transationDate);
			session.setAttribute("transactionBalance",transactionBalance);
			
			response.sendRedirect("home.jsp");
		} else {
			session.setAttribute("errorLogin", "Invalid credentials");
			response.sendRedirect("login.jsp");
		}
	}
	
}
