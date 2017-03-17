<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, java.text.*, java.util.*, java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Info Page</title>
</head>
<%
	String id = (String) request.getParameter("id");
	Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/baicrm", "root", "root");
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();
		stmt3 = conn.createStatement();
		ResultSet rs = stmt
				.executeQuery("Select * from clients as f where f.client_id='"
						+ id + "' AND f.client_type='future'");
		ResultSet rs2 = stmt2
				.executeQuery("Select * from client_comm as fc where fc.client_id='"
						+ id + "'");
		ResultSet rs3 = stmt3
				.executeQuery("Select * from file_attachments as fa where fa.client_id='"
						+ id + "'");
%>
<body bgcolor="#94B8FF">
	<%@ include file="main.jsp"%>
	<h3 align="center">Client Info</h3>
	<center>
		<b><font size="5">To upload a file &nbsp;<a
				href="futureFileUpload.jsp?id=<%=id%>"><strong>Click
						Here!</strong></a></font></b>
	</center>
	<%
		String message = (String) request.getAttribute("message");
			if (message != null) {
	%>
	<center>
		<font size="3" color="black"><%=message%></font>
	</center>
	<%
		}
	%>
	<br>
	<br>
	<table align="center">
		<%
			while (rs.next()) {
		%>
		<tr>
			<td>Enquiry No.</td>
			<td>:</td>
			<td><%=rs.getString("client_id")%></td>
		</tr>
		<tr>
			<td>Company Name</td>
			<td>:</td>
			<td><%=rs.getString("client_name")%></td>
		</tr>
		<tr>
			<td>Company Address</td>
			<td>:</td>
			<td><%=rs.getString("client_address")%></td>
		</tr>
		<tr>
			<td>Company Turnover</td>
			<td>:</td>
			<td><%=rs.getString("client_turnover")%></td>
		</tr>
		<tr>
			<td>No. of Employees in the Company</td>
			<td>:</td>
			<td><%=rs.getString("client_employees")%></td>
		</tr>
		<tr>
			<td>Location of the Company</td>
			<td>:</td>
			<td><%=rs.getString("client_location")%></td>
		</tr>
		<tr>
			<td>Country of the Company</td>
			<td>:</td>
			<td><%=rs.getString("client_country")%></td>
		</tr>
		<tr>
			<td>Point of Contact in Business Access</td>
			<td>:</td>
			<td><%=rs.getString("bai_poc")%></td>
		</tr>
		<tr>
			<td>Point of Contact in <%=rs.getString("client_name") %></td>
			<td>:</td>
			<td><%=rs.getString("client_poc")%></td>
		</tr>
		<tr>
			<td>Point of Contact in <%=rs.getString("client_name")%>'s Contact No.</td>
			<td>:</td>
			<td><%=rs.getString("client_poc_no")%></td>
		</tr>
		<tr>
			<td>Point of Contact in <%=rs.getString("client_name") %>'s Email Id</td>
			<td>:</td>
			<td><%=rs.getString("client_poc_email")%></td>
		</tr>
		<tr>
			<td>Service Type Opted for</td>
			<td>:</td>
			<td><%=rs.getString("service_type")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<br>
	<table align="center" border="1">
		<tr>
			<th colspan="4">Communication History</th>
		</tr>
		<tr>
			<th>Date of Communication</th>
			<th>Communication done</th>
			<th>Reminder Date</th>
			<th>Edit Communication</th>
		</tr>
		<%
			while (rs2.next()) {
		%>
		<tr>
			<td align="center"><%=rs2.getString("comm_date")%></td>
			<td><%=rs2.getString("comm")%></td>
			<td><%=rs2.getString("remdate")%></td>
			<td align="center"><a
				href="editFutComm.do?id=<%=rs2.getInt("comm_id")%>">EDIT</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<br>
	<table align="center" border="1">
		<tr>
			<th>Attachments History</th>
		</tr>
		<tr>
			<th>Attached Files</th>
		</tr>
		<%
			while (rs3.next()) {
		%>
		<tr>
			<td><a href="DownloadServlet?id=<%=rs3.getInt("file_id")%>"><%=rs3.getString("file_name")%></a></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			stmt2.close();
			stmt3.close();
			conn.close();

		}
	%>

</body>
</html>