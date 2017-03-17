package com.bai.baicrm.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MoveServletFuture
 */
@WebServlet("/MoveServletFuture")
public class MoveServletFuture extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String dbURL = "jdbc:mysql://localhost:3306/baicrm";
	private String dbUser = "root";
	private String dbPass = "root";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MoveServletFuture() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] checkBoxes = request.getParameterValues("chkbx");
		String action = request.getParameter("moveFutureClient");

		Connection conn = null;
		String query = null;
		PreparedStatement stmt = null;
		String message = null;
		int result = 0;

		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			if ("MOVE TO EXISTING CLIENTS".equals(action)) {
				for (int i = 0; i < checkBoxes.length; i++) {
					query = "Update clients c SET c.client_type='exist' where c.client_id=?";
					stmt = conn.prepareStatement(query);
					stmt.setString(1, checkBoxes[i]);
					result = stmt.executeUpdate();
				}
			} else if ("MOVE TO CLOSED CASES".equals(action)) {
				for (int i = 0; i < checkBoxes.length; i++) {
					query = "Update clients c SET c.client_type='closed' where c.client_id=?";
					stmt = conn.prepareStatement(query);
					stmt.setString(1, checkBoxes[i]);
					result = stmt.executeUpdate();
				}
			}

			if (result > 0) {
				message = "Values successfully moved to Future Prospects Page";
			}
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			request.setAttribute("message", message);
			getServletContext().getRequestDispatcher("/searchFuture.jsp")
					.forward(request, response);
		}
	}
}