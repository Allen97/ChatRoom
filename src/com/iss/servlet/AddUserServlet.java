package com.iss.servlet;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/addUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		HttpSession session = request.getSession();
		session.setAttribute("uname", uname);
		ServletContext servletContext = getServletContext();
		Set set = new HashSet();
		if (servletContext.getAttribute("userList") != null)
			set = (Set) servletContext.getAttribute("userList");
		if (set.contains(uname)) {
			response.sendRedirect("login.jsp?errormsg=exists");
		} else {
			set.add(uname);
			servletContext.setAttribute("userList", set);

			response.sendRedirect("weChat.jsp");
		}
	}

}
