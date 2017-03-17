<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<script>
	function validateForm() {
		var x = document.login.user.value;
		var y = document.login.pass.value;

		if (x == "" || x == null) {
			alert("Please enter your Username");
			return false;
		} else if (y == "" || y == null) {
			alert("Password is essential to verify your credential");
			return false;
		} else
			return true;
	}
</script>
</head>
<body bgcolor="#94B8FF">
	<center>
		<h1>
			<font color="Black">Welcome to BAI CRM</font>
		</h1>
	</center>
	<div align="center">
		<font color="red" size="4">Please provide your login
			credentials</font> <br> <br>
		<form method="post" name="login" action="auth.do">
			<table>
				<tr>
					<td>Username</td>
					<td>:</td>
					<td><input type="text" name="user" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td>:</td>
					<td><input type="password" name="pass" /></td>
				</tr>
			</table>
			<table>
				<tr>
					<td><input type="submit" name="submit" value="SUBMIT"
						onclick="return validateForm();" /></td>
				</tr>
			</table>
		</form>
	</div>
	<%
		Object obj = request.getAttribute("error");
		if (obj != null) {
			System.out.println(obj.toString());
	%>
	<h3 align="center">
		<font color="RED"><%=obj.toString()%></font>
	</h3>
	<%
		}
	%>

</body>
</html>