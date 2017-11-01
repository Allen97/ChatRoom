package com.iss.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddMsgServlet
 */
@WebServlet("/addMsgServlet")
public class AddMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddMsgServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String msg = request.getParameter("msg");
		HttpSession session = request.getSession();
		String uname = "";
		if (session.getAttribute("uname") != null)
			uname = session.getAttribute("uname").toString();
		ServletContext servletContext = getServletContext();
		List list = new ArrayList();
		if (servletContext.getAttribute("msgList") != null) {
			list = (List) servletContext.getAttribute("msgList");
		}
		list.add(uname + "˵" + msg + "&nbsp;&nbsp;&nbsp;&nbsp;" + sdf.format(new Date()) + "<br>");
		servletContext.setAttribute("msgList", list);

		response.sendRedirect("weChat.jsp");

	}

}
