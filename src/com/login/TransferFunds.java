package com.login;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/TransferFunds")
public class TransferFunds extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String toAcc = request.getParameter("toAccount");
		int amount = 0;
		HttpSession session = request.getSession();
		
		if (isNumeric(request.getParameter("txnAmount"))) {
			amount = Integer.parseInt(request.getParameter("txnAmount"));

				if ((toAcc.length() != 10) || (toAcc.matches("^[0-9]*$") == false)) {
					session.setAttribute("errorTransfer", "To account is not valid");
					
					response.sendRedirect("fundtransfer.jsp");
				} else {
					int balance = (int) session.getAttribute("balance");
					int dailyLimit = (int) session.getAttribute("dailylimit");
					int[] transactionNumber = (int[]) session.getAttribute("transactionNumber");
					int[] transactionAmount = (int[]) session.getAttribute("transactionAmount");
					String[] transationAccount = (String[]) session.getAttribute("transationAccount");
					String[] transationDate = (String[]) session.getAttribute("transationDate");
					int[] transactionBalance = (int[]) session.getAttribute("transactionBalance");
					
					if (dailyLimit < 0 ) {
						session.setAttribute("errorTransfer", "No kitty balance set");
						
						response.sendRedirect("fundtransfer.jsp");
					} else {
						int remainAmountforSpending = dailyLimit;
						if (transationDate.length > 0) {
							remainAmountforSpending = dailyLimit - getTotalSpendToday(transationDate, transactionAmount);
						}
						
						if (amount > remainAmountforSpending) {
							session.setAttribute("errorTransfer", "You've transfered too much today. You're kitty balance is too low to alow this transfer. Please check your budget planner");
							
							response.sendRedirect("fundtransfer.jsp");
						} else {

							if ( amount < balance ) {
								session.setAttribute("balance", balance - amount);
								
								int[] newtransactionNumber = new int[transactionNumber.length + 1];
								System.arraycopy(transactionNumber, 0, newtransactionNumber, 0, transactionNumber.length);
								newtransactionNumber[newtransactionNumber.length - 1] = newtransactionNumber.length;
								
								int[] newtransactionAmount = new int[transactionAmount.length + 1];
								System.arraycopy(transactionAmount, 0, newtransactionAmount, 0, transactionAmount.length);
								newtransactionAmount[newtransactionAmount.length - 1] = amount;
								
								String[] newtransationAccount = new String[transationAccount.length + 1];
								System.arraycopy(transationAccount, 0, newtransationAccount, 0, transationAccount.length);
								newtransationAccount[newtransationAccount.length - 1] = toAcc;
								
								String[] newtransationDate = new String[transationDate.length + 1];
								System.arraycopy(transationDate, 0, newtransationDate, 0, transationDate.length);
								DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
								LocalDate localDate = LocalDate.now();
								newtransationDate[newtransationDate.length - 1] = dtf.format(localDate);
								
								int[] newtransactionBalance = new int[transactionBalance.length + 1];
								System.arraycopy(transactionBalance, 0, newtransactionBalance, 0, transactionBalance.length);
								newtransactionBalance[newtransactionBalance.length - 1] = balance - amount;
								
								session.setAttribute("transactionNumber",newtransactionNumber);
								session.setAttribute("transactionAmount",newtransactionAmount);
								session.setAttribute("transationAccount",newtransationAccount);
								session.setAttribute("transationDate",newtransationDate);
								session.setAttribute("transactionBalance",newtransactionBalance);
								
								session.setAttribute("errorTransfer", "The amount is transferred successfully");
								
								response.sendRedirect("fundtransfer.jsp");
							} else {
								session.setAttribute("errorTransfer", "Balance is too low");
								
								response.sendRedirect("fundtransfer.jsp");
							}
						}
					}
				}
		} else {
			session.setAttribute("errorTransfer", "Amount is not valid");
			
			response.sendRedirect("fundtransfer.jsp");
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
	
	public static int getTotalSpendToday(String[] dateArray, int[] amountArray) { 
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate localDate = LocalDate.now();
		if (dateArray[dateArray.length - 1] != dtf.format(localDate)) {
			return 0;
		}else {
			int index = 0;
			int sum = 0;
			for (int i = 0; i < dateArray.length; i++) {
				if (dateArray[i] == dtf.format(localDate)) {
					index = i;
					break;
				}
			}
			
			for (int i = index; i < dateArray.length; i++) {
				sum = sum + amountArray[i];
			}
			return sum;
		}
	}
}
