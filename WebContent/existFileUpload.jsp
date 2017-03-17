<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Existing File Upload Page</title>
</head>
<body bgcolor="#94B8FF">
	<%@ include file="main.jsp"%>
	<%
		String id = (String) request.getParameter("id");
	%>
	<h3 align="center">Upload a file to the server</h3>
	<center>
		<form action="ExistUploadServlet" method="post" name="upFileExist"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="<%=id%>" />
			<table>
				<tr>
					<td>Name of the file</td>
					<td>:</td>
					<td><input type="text" name="fileName" /></td>
				</tr>
				<tr>
					<td>File to be Stored</td>
					<td>:</td>
					<td><input type="file" name="fileUpload" /></td>
			</table>
			<br> <br> <input type="submit" name="upload" value="UPLOAD" />
		</form>
	</center>
</body>
</html>