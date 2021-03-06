<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.bai.baicrm.entity.Client"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FutureClients Page</title>
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
		}, "fast");
		return false;
	});
</script>
</head>
<body bgcolor="#94B8FF">
	<%@ include file="remDateClient.jsp"%>
	<br>
	<br>
	<center>
		Want to add a new prospect?? <a href="addFuture.jsp">Click Here!!</a>
	</center>
	<center>
		<form name="searchForm" method="get" action="searchFuture.do">
			<table>
				<tr>
					<td>Your Search Criteria</td>
				</tr>
			</table>
			<table>
				<tr>
					<td><input type="text" name="searchValue" /></td>
					<td><input type="submit" name="search" value="SEARCH in FP" /></td>
				</tr>
			</table>
		</form>
		<%
			Object obj = request.getAttribute("error");
			if (obj != null) {
				System.out.println(obj.toString());
		%>
		<h4 align="center">
			<font color="RED"><%=obj.toString()%></font>
		</h4>
		<%
			} else {
				Object obj1 = request.getAttribute("success");
				if (obj1 != null) {
					System.out.println(obj1.toString());
		%>
		<h4 align="center">
			<font color="BLACK"><%=obj1.toString()%></font>
		</h4>
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
		<form action="MoveServletFuture" method="post" name="moveFut">
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
					<th>Point of Contact in BAI</th>
					<th>Point of Contact in Client's Company</th>
					<th>Client's POC's Contact No.</th>
					<th>Client's POC's Email Id</th>
					<th>Service Type</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${ futureclient }" var="client1">
					<tr>
						<td align="center"><input type="checkbox" name="chkbx"
							value="<c:out value="${ client1.id }"></c:out>" /></td>
						<td align="center"><c:out value="${ client1.id }"></c:out></td>
						<td align="center"><a
							href="futureclientinfo.jsp?id=<c:out value="${ client1.id }"></c:out>"><c:out
									value="${ client1.name }"></c:out></a></td>
						<td align="center"><c:out value="${ client1.address }"></c:out>
						</td>
						<td align="center"><c:out value="${ client1.turnover }"></c:out>
						</td>
						<td align="center"><c:out value="${ client1.noe }"></c:out></td>
						<td align="center"><c:out value="${ client1.location }"></c:out></td>
						<td align="center"><c:out value="${ client1.country }"></c:out></td>
						<td align="center"><c:out value="${ client1.contactperson }"></c:out></td>
						<td align="center"><c:out value="${ client1.clientcontact }"></c:out></td>
						<td align="center"><c:out value="${ client1.clientnumber }"></c:out></td>
						<td align="center"><c:out value="${ client1.clientemail }"></c:out></td>
						<td align="center"><c:out value="${ client1.servicetype }"></c:out></td>
						<td align="center"><a
							href="editFutClient.do?id=<c:out value="${ client1.id }"></c:out>">Edit</a></td>
						<td align="center"><a
							href="deleteFutureClient.do?id=<c:out value="${ client1.id }"></c:out>">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
			<br> <br> <input type="submit" name="moveFutureClient"
				value="MOVE TO EXISTING CLIENTS" /> <input type="submit"
				name="moveFutureClient" value="MOVE TO CLOSED CASES" /> <a
				href="#top" class="right">TOP</a>
		</form>
		<%
			}
				Object obj2 = request.getAttribute("successes1");
				Object obj3 = request.getAttribute("successes5");
				if (obj2 != null) {
					System.out.println(obj2.toString());
		%>
		<h3 align="center">
			<font color="BLACK"><%=obj2.toString()%></font>
		</h3>
		<%
			}
				if (obj3 != null) {
					System.out.println(obj3.toString());
		%>
		<h3 align="center">
			<font color="BLACK"><%=obj3.toString()%></font>
		</h3>
		<%
		}
		}
	%>
	</center>
</body>
</html>