package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BudgetPlanner")
public class BudgetPlanner extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dailylimit = request.getParameter("dailylimit");
		String reg = request.getParameter("register");
		
		HttpSession session = request.getSession();
		if (reg.equals("Register")) {
			if (isNumeric(dailylimit)) {
				session.setAttribute("dailylimit", Integer.parseInt(dailylimit));
				session.setAttribute("messageBudget", "Updated budget plan successfully");
				response.sendRedirect("budgetplanner.jsp");
			} else {
				session.setAttribute("errorBudget", "Daily limit is required");
				
				response.sendRedirect("budgetplanner.jsp");
			}
		} else {
			session.setAttribute("dailylimit", -1);
			response.sendRedirect("budgetplanner.jsp");
		}
	}
	
	public static boolean isNumeric(String str) { 
		  try {  
		    Double.parseDouble(str); 
		    Integer.parseInt(str);
		    return true;
		  } catch(NumberFormatException e){  
		    return false;  
		  }  
		}

}
