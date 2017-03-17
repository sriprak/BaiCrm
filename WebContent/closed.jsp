<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Closed Cases Page</title>
<style>
#navcontainer ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	text-align: center;
}

#navcontainer ul li {
	display: inline;
}

#navcontainer ul li a {
	text-decoration: none;
	padding: .2em 1em;
}
</style>
<script type="text/javascript">
	function myFunctionClose() {
		window.open("searchClosed.jsp", "_self");
	}
</script>
</head>
<body bgcolor="#94B8FF">
	<%@ include file="main.jsp"%>
	<br>
	<center>Want to see today's important appointments??? <a href="remDateClient.jsp">Click Here</a></center>
	<br>
	<div id="navcontainer">
		<ul>
			<li><input type="button" name="search"
				value="Search a ClosedCase Client" onclick="myFunctionClose()" /></li>
		</ul>
	</div>
</body>
</html>