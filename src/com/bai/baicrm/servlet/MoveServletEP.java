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
 * Servlet implementation class MoveServletEP
 */
@WebServlet("/MoveServletEP")
public class MoveServletEP extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String dbURL = "jdbc:mysql://localhost:3306/baicrm";
	private String dbUser = "root";
	private String dbPass = "root";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MoveServletEP() {
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

		Connection conn = null;
		String query = null;
		PreparedStatement stmt = null;
		String message = null;
		int result = 0;

		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			for (int i = 0; i < checkBoxes.length; i++) {
				query = "Update clients c SET c.client_type='past' where c.client_id=?";
				stmt = conn.prepareStatement(query);
				stmt.setString(1, checkBoxes[i]);
				result = stmt.executeUpdate();
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
			getServletContext().getRequestDispatcher("/searchExisting.jsp")
					.forward(request, response);
		}
	}

}
