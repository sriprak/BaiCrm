<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body bgcolor="#94B8FF">

	<h3 align="center">
		<font color="black">Welcome to CRM</font>
	</h3>
	<h3 align="right">
		<font size="3"><a href="login.jsp">Logout</a> <%
 	session.invalidate();
 %></font>
	</h3>
	<br>
	<center>
		<span id="menu"> <a href="future.jsp"><font size="5">Future
					Prospects</font></a> &nbsp;&nbsp;&nbsp; <a href="existing.jsp"><font
				size="5">Existing Clients</font></a> &nbsp;&nbsp;&nbsp; <a
			href="past.jsp"><font size="5">Past Clients</font></a>
			&nbsp;&nbsp;&nbsp; <a href="closed.jsp"><font size="5">Closed
					Cases</font></a>
		</span>
	</center>
</body>
</html>