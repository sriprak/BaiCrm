<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%--  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
    <%@page import="java.sql.*, java.text.*, java.util.*, java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Todays Appointments page</title>
<style type="text/css">
a.right {
	position: absolute;
	right: 0;
}
</style>
<script language="javascript">
$("a[href='#top']").click(function() {
	$("html, body").animate({
		scrollTop : 0
	}, "fast");
	return false;
});
</script>
</head>
<%
String date=new SimpleDateFormat("MM/dd/yyyy").format(new Date());
Connection conn = null;
Statement stmt = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/baicrm", "root", "root");
	stmt = conn.createStatement();
	ResultSet rs = stmt
			.executeQuery("Select c.*,cc.* from clients c inner join client_comm cc on c.client_id=cc.client_id where cc.remdate BETWEEN '07/27/2014' and '08/01/2014' ORDER BY cc.remdate,c.client_id");
%>
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
		<br><br><br>
		<b><font size="4" color="BLACK">Weekly Reminder</font></b> <div align="right">Want to see Monthly Reminders?? <strong><a href="remDateClientMon.jsp">Click Here</a></strong></div>
		<br><br>
		<table border="1" cellpadding="10px">
			<tr><th>Enquiry No.</th><th>Name of the Company</th><th>Turnover of the Company</th><th>Point of Contact in BAI</th><th>Point of Contact in Prospect's Company</th><th>Prospect's Point of Contact's Number</th><th>Prospect's Point of Contact's Email Id</th><th>Service Type</th><th>Location of the Company</th><th>Country of the Company</th><th>Reminder Date</th></tr>
		<%
		while(rs.next()){
		%>
			<tr>
				<td><%=rs.getString("c.client_id") %></td>
				<td><a href="futureclientinfo.jsp?id=<%=rs.getString("c.client_id")%>"><%=rs.getString("c.client_name") %></a></td>
				<td><%=rs.getString("c.client_turnover") %></td>
				<td><%=rs.getString("c.bai_poc") %></td>
				<td><%=rs.getString("c.client_poc") %></td>
				<td><%=rs.getString("c.client_poc_no") %></td>
				<td><%=rs.getString("c.client_poc_email") %></td>
				<td><strong><%=rs.getString("c.service_type") %></strong></td>
				<td><%=rs.getString("c.client_location") %></td>
				<td><%=rs.getString("c.client_country") %></td>
				<td><%=rs.getString("cc.remdate") %></td>
			</tr>
		<%
		}
		%>
		</table>
		<br>
		<a href="#top" class="right">TOP</a>
		<%
	}
	catch(Exception e){
		e.printStackTrace();
	}
finally{
	stmt.close();
	conn.close();
}
		%>
	</center>
</body>
</html>