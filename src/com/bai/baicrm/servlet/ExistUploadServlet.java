package com.bai.baicrm.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ExistUploadServlet
 */
@WebServlet("/ExistUploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class ExistUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String dbURL = "jdbc:mysql://localhost:3306/baicrm";
	private String dbUser = "root";
	private String dbPass = "root";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExistUploadServlet() {
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
		String id = (String) request.getParameter("id");
		String name = (String) request.getParameter("fileName");

		InputStream inputStream = null;

		Part filePart = request.getPart("fileUpload");
		if (filePart != null) {
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			inputStream = filePart.getInputStream();
		}

		Connection conn = null;
		String message = null;

		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			String sql = "Insert into file_attachments(file_name,file,client_id) values (?,?,?)";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			if (inputStream != null) {
				stmt.setBlob(2, inputStream);
			}
			stmt.setString(3, id);

			int result = stmt.executeUpdate();

			if (result > 0) {
				message = "File uploaded and saved into the database";
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
			getServletContext().getRequestDispatcher("/existingclientinfo.jsp")
					.forward(request, response);
		}

	}

}
