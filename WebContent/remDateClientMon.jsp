<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*, java.text.*, java.util.*, java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Monthly Appointments</title>
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

function show(){
	var div=document.getElementById('displayId');
	div.style.display = (div.style.display == "none")? "block":"none";
}
</script>
</head>
<body bgcolor="#94B8FF">
	<%@include file="main.jsp" %>
	<br>
	<center><font size="4">Please provide the respective month and year for getting reminders</font></center>
	<br>
	<div align="center">
	<form id="remMonId" name="monthlyRemainderForm" method="post">
		<table>
			<tr><td>Month</td><td>:</td><td><select id="months" name="months"
					style="width: 65px; height: 20px;">
						<option value="Select">Select</option>
						<option value="01">JAN</option>
						<option value="02">FEB</option>
						<option value="03">MAR</option>
						<option value="04">APR</option>
						<option value="05">MAY</option>
						<option value="06">JUN</option>
						<option value="07">JUL</option>
						<option value="08">AUG</option>
						<option value="09">SEP</option>
						<option value="10">OCT</option>
						<option value="11">NOV</option>
						<option value="12">DEC</option>
						</select>
						</td></tr>
			<tr><td>Year</td><td>:</td><td><select id="years" name="years"
					style="width: 65px; height: 20px;">
						<option value="Select">Select</option>
						<option value="1950">1950</option>
						<option value="1951">1951</option>
						<option value="1952">1952</option>
						<option value="1953">1953</option>
						<option value="1954">1954</option>
						<option value="1955">1955</option>
						<option value="1956">1956</option>
						<option value="1957">1957</option>
						<option value="1958">1958</option>
						<option value="1959">1959</option>
						<option value="1960">1960</option>
						<option value="1961">1961</option>
						<option value="1962">1962</option>
						<option value="1963">1963</option>
						<option value="1964">1964</option>
						<option value="1965">1965</option>
						<option value="1966">1966</option>
						<option value="1967">1967</option>
						<option value="1968">1968</option>
						<option value="1969">1969</option>
						<option value="1970">1970</option>
						<option value="1971">1971</option>
						<option value="1972">1972</option>
						<option value="1973">1973</option>
						<option value="1974">1974</option>
						<option value="1975">1975</option>
						<option value="1976">1976</option>
						<option value="1977">1977</option>
						<option value="1978">1978</option>
						<option value="1979">1979</option>
						<option value="1980">1980</option>
						<option value="1981">1981</option>
						<option value="1982">1982</option>
						<option value="1983">1983</option>
						<option value="1984">1984</option>
						<option value="1985">1985</option>
						<option value="1986">1986</option>
						<option value="1987">1987</option>
						<option value="1988">1988</option>
						<option value="1989">1989</option>
						<option value="1990">1990</option>
						<option value="1991">1991</option>
						<option value="1992">1992</option>
						<option value="1993">1993</option>
						<option value="1994">1994</option>
						<option value="1995">1995</option>
						<option value="1996">1996</option>
						<option value="1997">1997</option>
						<option value="1998">1998</option>
						<option value="1999">1999</option>
						<option value="2000">2000</option>
						<option value="2001">2001</option>
						<option value="2002">2002</option>
						<option value="2003">2003</option>
						<option value="2004">2004</option>
						<option value="2005">2005</option>
						<option value="2006">2006</option>
						<option value="2007">2007</option>
						<option value="2008">2008</option>
						<option value="2009">2009</option>
						<option value="2010">2010</option>
						<option value="2011">2011</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
						<option value="2025">2026</option>
						<option value="2027">2027</option>
						<option value="2028">2028</option>
						<option value="2029">2029</option>
						<option value="2030">2030</option>
						<option value="2031">2031</option>
						<option value="2032">2032</option>
						<option value="2033">2033</option>
						<option value="2034">2034</option>
						<option value="2035">2035</option>
						<option value="2036">2036</option>
						<option value="2037">2037</option>
						<option value="2038">2038</option>
						<option value="2039">2039</option>
						<option value="2040">2040</option>
						<option value="2041">2041</option>
						<option value="2042">2042</option>
						<option value="2043">2043</option>
						<option value="2044">2044</option>
						<option value="2045">2045</option>
						<option value="2046">2046</option>
						<option value="2047">2047</option>
						<option value="2048">2048</option>
						<option value="2049">2049</option>
						<option value="2050">2050</option>
						<option value="2051">2051</option>
						<option value="2052">2052</option>
						<option value="2053">2053</option>
						<option value="2054">2054</option>
						<option value="2055">2055</option>
						<option value="2056">2056</option>
						<option value="2057">2057</option>
						<option value="2058">2058</option>
						<option value="2059">2059</option>
						<option value="2060">2060</option>
						<option value="2061">2061</option>
						<option value="2062">2062</option>
						<option value="2063">2063</option>
						<option value="2064">2064</option>
						<option value="2065">2065</option>
						<option value="2066">2066</option>
						<option value="2067">2067</option>
						<option value="2068">2068</option>
						<option value="2069">2069</option>
						<option value="2070">2070</option>
						<option value="2071">2071</option>
						<option value="2072">2072</option>
						<option value="2073">2073</option>
						<option value="2074">2074</option>
						<option value="2075">2075</option>
						<option value="2076">2076</option>
						<option value="2077">2077</option>
						<option value="2078">2078</option>
						<option value="2079">2079</option>
						<option value="2080">2080</option>
						<option value="2081">2081</option>
						<option value="2082">2082</option>
						<option value="2083">2083</option>
						<option value="2084">2084</option>
						<option value="2085">2085</option>
						<option value="2086">2086</option>
						<option value="2087">2087</option>
						<option value="2088">2088</option>
						<option value="2089">2089</option>
						<option value="2090">2090</option>
						<option value="2091">2091</option>
						<option value="2092">2092</option>
						<option value="2093">2093</option>
						<option value="2094">2094</option>
						<option value="2095">2095</option>
						<option value="2096">2096</option>
						<option value="2097">2097</option>
						<option value="2098">2098</option>
						<option value="2099">2099</option>
						<option value="2100">2100</option>
				</select></td></tr>
		</table>
		<table>
			<tr><td><input type="button" name="remDate" value="FIND" onclick="show()"></td></tr>
		</table>
	</form>
</div>
<div id="displayId">	
	<% 
	String month=(String)request.getParameter("months");
	String year=(String)request.getParameter("years");
Connection conn = null;
Statement stmt = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/baicrm", "root", "root");
	stmt = conn.createStatement();
	ResultSet rs = stmt
			.executeQuery("Select c.*,cc.* from clients c inner join client_comm cc on c.client_id=cc.client_id where cc.remdate LIKE '"+month+"/%/"+year+"' ORDER BY cc.remdate,c.client_id");
%>
	<br><br><br>
		<b><font size="4" color="BLACK">Monthly Reminder</font></b> 
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
	</div>
</body>
</html>