<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.bai.baicrm.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Closed Cases Page</title>
<style type="text/css">
a.right {
	position: absolute;
	right: 0;
}
</style>
<script language="javascript">
	function checkAll() {
		for ( var i = 0; i < document.forms[1].elements.length; i++) {
			var e = document.forms[1].elements[i];
			if ((e.name != 'chkbxs') && (e.type == 'checkbox')) {
				e.checked = document.forms[1].chkbxs.checked;
			}
		}
	}

	$("a[href='#top']").click(function() {
		$("html, body").animate({
			scrollTop : 0
		}, "slow");
		return false;
	});
</script>
</head>
<body bgcolor="#94B8FF">
	<%@ include file="main.jsp"%>
	<br>
	<br>
	<center>
		<form name="searchForm" method="get" action="searchClosed.do">
			<table>
				<tr>
					<td>Your Search Criteria</td>
				</tr>
			</table>
			<table>
				<tr>
					<td><input type="text" name="searchValue" /></td>
					<td><input id="search" type="submit" name="search"
						value="SEARCH in CC" /></td>
				</tr>
			</table>
		</form>
		<%
			Object obj = request.getAttribute("error");
			if (obj != null) {
				System.out.println(obj.toString());
		%>
		<h3 align="center">
			<font color="RED"><%=obj.toString()%></font>
		</h3>
		<%
			} else {
				Object obj1 = request.getAttribute("successc");
				if (obj1 != null) {
					System.out.println(obj1.toString());
		%>
		<h3 align="center">
			<font color="BLACK"><%=obj1.toString()%></font>
		</h3>
		<br>
		<%
			Object objCount = request.getAttribute("total");
					if (objCount != null) {
						System.out.println(objCount.toString());
		%>
		<h4>
			<font color="black"><%=Integer.parseInt(objCount.toString())%>
				records were found for this particular search</font>
		</h4>
		<%
			}
		%>
		<form action="MoveServletCF" method="post" name="moveCF">
			<table align="center" border="1" cellpadding="10px">
				<tr>
					<th><input type="checkbox" name="chkbxs" onclick="checkAll();" /></th>
					<th>Enquiry No.</th>
					<th>Name of the Company</th>
					<th>Address of the Company</th>
					<th>Turnover of the Company</th>
					<th>No. of Employees</th>
					<th>Location of the Company</th>
					<th>Country</th>
					<th>Contact Person in BAI</th>
					<th>Point of Contact in Client's Company</th>
					<th>Client's POC's Contact No.</th>
					<th>Client's POC's Email Id</th>
					<th>Service Type</th>
				</tr>
				<c:forEach items="${ closedcases }" var="closedclient">
					<tr>
						<td align="center"><input type="checkbox" name="chkbx"
							value="<c:out value="${ closedclient.id }"></c:out>" /></td>
						<td align="center"><c:out value="${ closedclient.id }"></c:out>
						</td>
						<td align="center"><a
							href="closedclientinfo.jsp?id=<c:out value="${ closedclient.id }"></c:out>"><c:out
									value="${ closedclient.name }"></c:out></a></td>
						<td align="center"><c:out value="${ closedclient.address }"></c:out>
						</td>
						<td align="center"><c:out value="${ closedclient.turnover }"></c:out>
						</td>
						<td align="center"><c:out value="${ closedclient.noe }"></c:out></td>
						<td align="center"><c:out value="${ closedclient.location }"></c:out></td>
						<td align="center"><c:out value="${ closedclient.country }"></c:out></td>
						<td align="center"><c:out
								value="${ closedclient.contactperson }"></c:out></td>
								<td align="center"><c:out value="${ closedclient.clientcontact }"></c:out></td>
						<td align="center"><c:out value="${ closedclient.clientnumber }"></c:out></td>
						<td align="center"><c:out value="${ closedclient.clientemail }"></c:out></td>
						<td align="center"><c:out value="${ closedclient.servicetype }"></c:out></td>
					</tr>
				</c:forEach>
			</table>
			<br> <br> <input type="submit" name="moveClosedClient"
				value="MOVE" /> <a href="#top" class="right">TOP</a>
		</form>
		<%
			}
				Object obj2 = request.getAttribute("successcc");
				if (obj2 != null) {
					System.out.println(obj2.toString());
		%>
		<h3 align="center">
			<font color="BLACK"><%=obj2.toString()%></font>
		</h3>
		<%
			}
			}
		%>
	</center>
</body>
</html>