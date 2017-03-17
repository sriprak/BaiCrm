<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bai.baicrm.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#94B8FF">
	<%@ include file="main.jsp"%>
	<%
		ClientCommunications past = (ClientCommunications) request
				.getAttribute("pastComm");
		String commDate = "", comm = "", remdate = "";
		int id;
		if (past == null) {
	%>
	<center>
		<font size="4" color="RED">No Communications Available</font>
	</center>
	<%
		} else {
			id = past.getId();
			commDate = past.getDate();
			comm = past.getComm();
			remdate = past.getRemdate();
	%>
	<form action="updateFutComm.do" name="editFutComm" method="get">
		<table align="center">
			<tr>
				<td>Communication Date</td>
				<td>:</td>
				<td><input type="text" name="commDate" value="<%=commDate%>"
					width="304px" /></td>
			</tr>
			<tr>
				<td>Communication Done</td>
				<td>:</td>
				<td><textarea name="comm" style="height: 80px; width: 304px"><%=comm%></textarea></td>
			</tr>
			<tr>
				<td>Reminder Date</td>
				<td>:</td>
				<td><input type="text" name="remDate" value="<%=remdate%>"
					width="304px" /></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value="<%=id%>" /></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td><input type="submit" name="editFutComm" value="SAVE" /></td>
			</tr>
		</table>
	</form>
	<%
		}
%>
</body>
</html>