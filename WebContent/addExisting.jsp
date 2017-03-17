<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bai.baicrm.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding a Client Page</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#datepicker").datepicker();
	});

	$(function() {
		$("#datepicker2").datepicker();
	});

	function validateForm() {
		var a = document.addExist.cname.value;
		var b = document.addExist.caddress.value;
		var c = document.addExist.cturnover.value;
		var d = document.addExist.cnoe.value;
		var e = document.addExist.cloc.value;
		var f = document.getElementById("countries").value;
		var g = document.addExist.cassgn.value;
		var h = document.addExist.cassgnsect.value;
		var i = document.getElementById("years").value;
		var j = document.addExist.poc.value;
		if (a == "" || a == null) {
			alert('please enter the name of the company');
			return false;
		} else if (b == "" || b == null) {
			alert('please enter the address of the company');
			return false;
		} else if (c == "" || c == null) {
			alert('please mention the turnover of the company');
			return false;
		} else if (d == "" || d == null) {
			alert('please enter the No. of Employees working in your company');
			return false;
		} else if (e == "" || e == null) {
			alert('please enter the location of your company');
			return false;
		} else if (f == "Select") {
			alert('Please enter the name of the country where your company is located');
			return false;
		} else if (g == "" || g == null) {
			alert('please enter the assignment category');
			return false;
		} else if (h == null || h == "") {
			alert('please enter the sector of the assignment');
			return false;
		} else if (i == "Select") {
			alert('please enter the year in which the assignment was given');
			return false;
		} else if (j == "" || j == null) {
			alert('please enter the name of Point of Contact in your firm');
			return false;
		} else
			return true;

	}
</script>
</head>
<body bgcolor="#94B8FF">
	<%@ include file="main.jsp"%>
	<%
		Client exist = (Client) request.getAttribute("existclient");
		String name = "", address = "", turnover = "", location = "", country = "", poc = "", year = "", assign = "", sector = "", sub = "SUBMIT";
		String id;
		String cPoc="", cPocNo="", cPocId="", serviceType="";
		long noe;
		if (exist == null) {
	%>
	<br>
	<center>Want to search a Existing Client???? <a href="searchExisting.jsp">Click Here!!</a></center>
	<h3 align="center">Add an Existing Client</h3>
	<br>
	<form name="addExist" method="get" action="addExisting.do"
		enctype="multipart/form-data">

		<table align="center">
			<tr>
				<td>Enquiry No.</td>
				<td>:</td>
				<td><input type="text" name="enqno" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Name of the company</td>
				<td>:</td>
				<td><input type="text" name="cname" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Address of the company</td>
				<td>:</td>
				<td><input type="text" name="caddress" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Turnover of the company</td>
				<td>:</td>
				<td><input type="text" name="cturnover" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Number of Employees in the company</td>
				<td>:</td>
				<td><input type="text" name="cnoe" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Location of the company</td>
				<td>:</td>
				<td><input type="text" name="cloc" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Country</td>
				<td>:</td>
				<td><select id="countries" name="countries"
					style="width: 310px; height: 20px;">
						<option value="Select">Select</option>
						<option value="Afghanistan">Afghanistan</option>
						<option value="Åland Islands">Åland Islands</option>
						<option value="Albania">Albania</option>
						<option value="Algeria">Algeria</option>
						<option value="American Samoa">American Samoa</option>
						<option value="Andorra">Andorra</option>
						<option value="Angola">Angola</option>
						<option value="Anguilla">Anguilla</option>
						<option value="Antarctica">Antarctica</option>
						<option value="Antigua and Barbuda">Antigua and Barbuda</option>
						<option value="Argentina">Argentina</option>
						<option value="Armenia">Armenia</option>
						<option value="Aruba">Aruba</option>
						<option value="Australia">Australia</option>
						<option value="Austria">Austria</option>
						<option value="Azerbaijan">Azerbaijan</option>
						<option value="Bahamas">Bahamas</option>
						<option value="Bahrain">Bahrain</option>
						<option value="Bangladesh">Bangladesh</option>
						<option value="Barbados">Barbados</option>
						<option value="Belarus">Belarus</option>
						<option value="Belgium">Belgium</option>
						<option value="Belize">Belize</option>
						<option value="Benin">Benin</option>
						<option value="Bermuda">Bermuda</option>
						<option value="Bhutan">Bhutan</option>
						<option value="Bolivia">Bolivia</option>
						<option value="Bosnia and Herzegovina">Bosnia and
							Herzegovina</option>
						<option value="Botswana">Botswana</option>
						<option value="Bouvet Island">Bouvet Island</option>
						<option value="Brazil">Brazil</option>
						<option value="British Indian Ocean Territory">British
							Indian Ocean Territory</option>
						<option value="Brunei Darussalam">Brunei Darussalam</option>
						<option value="Bulgaria">Bulgaria</option>
						<option value="Burkina Faso">Burkina Faso</option>
						<option value="Burundi">Burundi</option>
						<option value="Cambodia">Cambodia</option>
						<option value="Cameroon">Cameroon</option>
						<option value="Canada">Canada</option>
						<option value="Cape Verde">Cape Verde</option>
						<option value="Cayman Islands">Cayman Islands</option>
						<option value="Central African Republic">Central African
							Republic</option>
						<option value="Chad">Chad</option>
						<option value="Chile">Chile</option>
						<option value="China">China</option>
						<option value="Christmas Island">Christmas Island</option>
						<option value="Cocos (Keeling) Islands">Cocos (Keeling)
							Islands</option>
						<option value="Colombia">Colombia</option>
						<option value="Comoros">Comoros</option>
						<option value="Congo">Congo</option>
						<option value="Congo, The Democratic Republic of The">Congo,
							The Democratic Republic of The</option>
						<option value="Cook Islands">Cook Islands</option>
						<option value="Costa Rica">Costa Rica</option>
						<option value="Cote D'ivoire">Cote D'ivoire</option>
						<option value="Croatia">Croatia</option>
						<option value="Cuba">Cuba</option>
						<option value="Cyprus">Cyprus</option>
						<option value="Czech Republic">Czech Republic</option>
						<option value="Denmark">Denmark</option>
						<option value="Djibouti">Djibouti</option>
						<option value="Dominica">Dominica</option>
						<option value="Dominican Republic">Dominican Republic</option>
						<option value="Ecuador">Ecuador</option>
						<option value="Egypt">Egypt</option>
						<option value="El Salvador">El Salvador</option>
						<option value="Equatorial Guinea">Equatorial Guinea</option>
						<option value="Eritrea">Eritrea</option>
						<option value="Estonia">Estonia</option>
						<option value="Ethiopia">Ethiopia</option>
						<option value="Falkland Islands (Malvinas)">Falkland
							Islands (Malvinas)</option>
						<option value="Faroe Islands">Faroe Islands</option>
						<option value="Fiji">Fiji</option>
						<option value="Finland">Finland</option>
						<option value="France">France</option>
						<option value="French Guiana">French Guiana</option>
						<option value="French Polynesia">French Polynesia</option>
						<option value="French Southern Territories">French
							Southern Territories</option>
						<option value="Gabon">Gabon</option>
						<option value="Gambia">Gambia</option>
						<option value="Georgia">Georgia</option>
						<option value="Germany">Germany</option>
						<option value="Ghana">Ghana</option>
						<option value="Gibraltar">Gibraltar</option>
						<option value="Greece">Greece</option>
						<option value="Greenland">Greenland</option>
						<option value="Grenada">Grenada</option>
						<option value="Guadeloupe">Guadeloupe</option>
						<option value="Guam">Guam</option>
						<option value="Guatemala">Guatemala</option>
						<option value="Guernsey">Guernsey</option>
						<option value="Guinea">Guinea</option>
						<option value="Guinea-bissau">Guinea-bissau</option>
						<option value="Guyana">Guyana</option>
						<option value="Haiti">Haiti</option>
						<option value="Heard Island and Mcdonald Islands">Heard
							Island and Mcdonald Islands</option>
						<option value="Holy See (Vatican City State)">Holy See
							(Vatican City State)</option>
						<option value="Honduras">Honduras</option>
						<option value="Hong Kong">Hong Kong</option>
						<option value="Hungary">Hungary</option>
						<option value="Iceland">Iceland</option>
						<option value="India">India</option>
						<option value="Indonesia">Indonesia</option>
						<option value="Iran, Islamic Republic of">Iran, Islamic
							Republic of</option>
						<option value="Iraq">Iraq</option>
						<option value="Ireland">Ireland</option>
						<option value="Isle of Man">Isle of Man</option>
						<option value="Israel">Israel</option>
						<option value="Italy">Italy</option>
						<option value="Jamaica">Jamaica</option>
						<option value="Japan">Japan</option>
						<option value="Jersey">Jersey</option>
						<option value="Jordan">Jordan</option>
						<option value="Kazakhstan">Kazakhstan</option>
						<option value="Kenya">Kenya</option>
						<option value="Kiribati">Kiribati</option>
						<option value="Korea, Democratic People's Republic of">Korea,
							Democratic People's Republic of</option>
						<option value="Korea, Republic of">Korea, Republic of</option>
						<option value="Kuwait">Kuwait</option>
						<option value="Kyrgyzstan">Kyrgyzstan</option>
						<option value="Lao People's Democratic Republic">Lao
							People's Democratic Republic</option>
						<option value="Latvia">Latvia</option>
						<option value="Lebanon">Lebanon</option>
						<option value="Lesotho">Lesotho</option>
						<option value="Liberia">Liberia</option>
						<option value="Libyan Arab Jamahiriya">Libyan Arab
							Jamahiriya</option>
						<option value="Liechtenstein">Liechtenstein</option>
						<option value="Lithuania">Lithuania</option>
						<option value="Luxembourg">Luxembourg</option>
						<option value="Macao">Macao</option>
						<option value="Macedonia, The Former Yugoslav Republic of">Macedonia,
							The Former Yugoslav Republic of</option>
						<option value="Madagascar">Madagascar</option>
						<option value="Malawi">Malawi</option>
						<option value="Malaysia">Malaysia</option>
						<option value="Maldives">Maldives</option>
						<option value="Mali">Mali</option>
						<option value="Malta">Malta</option>
						<option value="Marshall Islands">Marshall Islands</option>
						<option value="Martinique">Martinique</option>
						<option value="Mauritania">Mauritania</option>
						<option value="Mauritius">Mauritius</option>
						<option value="Mayotte">Mayotte</option>
						<option value="Mexico">Mexico</option>
						<option value="Micronesia, Federated States of">Micronesia,
							Federated States of</option>
						<option value="Moldova, Republic of">Moldova, Republic of</option>
						<option value="Monaco">Monaco</option>
						<option value="Mongolia">Mongolia</option>
						<option value="Montenegro">Montenegro</option>
						<option value="Montserrat">Montserrat</option>
						<option value="Morocco">Morocco</option>
						<option value="Mozambique">Mozambique</option>
						<option value="Myanmar">Myanmar</option>
						<option value="Namibia">Namibia</option>
						<option value="Nauru">Nauru</option>
						<option value="Nepal">Nepal</option>
						<option value="Netherlands">Netherlands</option>
						<option value="Netherlands Antilles">Netherlands Antilles</option>
						<option value="New Caledonia">New Caledonia</option>
						<option value="New Zealand">New Zealand</option>
						<option value="Nicaragua">Nicaragua</option>
						<option value="Niger">Niger</option>
						<option value="Nigeria">Nigeria</option>
						<option value="Niue">Niue</option>
						<option value="Norfolk Island">Norfolk Island</option>
						<option value="Northern Mariana Islands">Northern Mariana
							Islands</option>
						<option value="Norway">Norway</option>
						<option value="Oman">Oman</option>
						<option value="Pakistan">Pakistan</option>
						<option value="Palau">Palau</option>
						<option value="Palestinian Territory, Occupied">Palestinian
							Territory, Occupied</option>
						<option value="Panama">Panama</option>
						<option value="Papua New Guinea">Papua New Guinea</option>
						<option value="Paraguay">Paraguay</option>
						<option value="Peru">Peru</option>
						<option value="Philippines">Philippines</option>
						<option value="Pitcairn">Pitcairn</option>
						<option value="Poland">Poland</option>
						<option value="Portugal">Portugal</option>
						<option value="Puerto Rico">Puerto Rico</option>
						<option value="Qatar">Qatar</option>
						<option value="Reunion">Reunion</option>
						<option value="Romania">Romania</option>
						<option value="Russian Federation">Russian Federation</option>
						<option value="Rwanda">Rwanda</option>
						<option value="Saint Helena">Saint Helena</option>
						<option value="Saint Kitts and Nevis">Saint Kitts and
							Nevis</option>
						<option value="Saint Lucia">Saint Lucia</option>
						<option value="Saint Pierre and Miquelon">Saint Pierre
							and Miquelon</option>
						<option value="Saint Vincent and The Grenadines">Saint
							Vincent and The Grenadines</option>
						<option value="Samoa">Samoa</option>
						<option value="San Marino">San Marino</option>
						<option value="Sao Tome and Principe">Sao Tome and
							Principe</option>
						<option value="Saudi Arabia">Saudi Arabia</option>
						<option value="Senegal">Senegal</option>
						<option value="Serbia">Serbia</option>
						<option value="Seychelles">Seychelles</option>
						<option value="Sierra Leone">Sierra Leone</option>
						<option value="Singapore">Singapore</option>
						<option value="Slovakia">Slovakia</option>
						<option value="Slovenia">Slovenia</option>
						<option value="Solomon Islands">Solomon Islands</option>
						<option value="Somalia">Somalia</option>
						<option value="South Africa">South Africa</option>
						<option value="South Georgia and The South Sandwich Islands">South
							Georgia and The South Sandwich Islands</option>
						<option value="Spain">Spain</option>
						<option value="Sri Lanka">Sri Lanka</option>
						<option value="Sudan">Sudan</option>
						<option value="Suriname">Suriname</option>
						<option value="Svalbard and Jan Mayen">Svalbard and Jan
							Mayen</option>
						<option value="Swaziland">Swaziland</option>
						<option value="Sweden">Sweden</option>
						<option value="Switzerland">Switzerland</option>
						<option value="Syrian Arab Republic">Syrian Arab Republic</option>
						<option value="Taiwan, Province of China">Taiwan,
							Province of China</option>
						<option value="Tajikistan">Tajikistan</option>
						<option value="Tanzania, United Republic of">Tanzania,
							United Republic of</option>
						<option value="Thailand">Thailand</option>
						<option value="Timor-leste">Timor-leste</option>
						<option value="Togo">Togo</option>
						<option value="Tokelau">Tokelau</option>
						<option value="Tonga">Tonga</option>
						<option value="Trinidad and Tobago">Trinidad and Tobago</option>
						<option value="Tunisia">Tunisia</option>
						<option value="Turkey">Turkey</option>
						<option value="Turkmenistan">Turkmenistan</option>
						<option value="Turks and Caicos Islands">Turks and Caicos
							Islands</option>
						<option value="Tuvalu">Tuvalu</option>
						<option value="Uganda">Uganda</option>
						<option value="Ukraine">Ukraine</option>
						<option value="United Arab Emirates">United Arab Emirates</option>
						<option value="United Kingdom">United Kingdom</option>
						<option value="United States">United States</option>
						<option value="United States Minor Outlying Islands">United
							States Minor Outlying Islands</option>
						<option value="Uruguay">Uruguay</option>
						<option value="Uzbekistan">Uzbekistan</option>
						<option value="Vanuatu">Vanuatu</option>
						<option value="Venezuela">Venezuela</option>
						<option value="Vietnam">Vietnam</option>
						<option value="Virgin Islands, British">Virgin Islands,
							British</option>
						<option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
						<option value="Wallis and Futuna">Wallis and Futuna</option>
						<option value="Western Sahara">Western Sahara</option>
						<option value="Yemen">Yemen</option>
						<option value="Zambia">Zambia</option>
						<option value="Zimbabwe">Zimbabwe</option>
				</select></td>
			</tr>
			<tr>
				<td>Assignment Done</td>
				<td>:</td>
				<td><input type="text" name="cassgn" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Sector of the Assignment</td>
				<td>:</td>
				<td><input type="text" name="cassgnsect" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Year of the Assignment</td>
				<td>:</td>
				<td><select id="years" name="years"
					style="width: 310px; height: 20px;">
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
				</select></td>
			</tr>
			<tr>
				<td>Point of Contact in BAI</td>
				<td>:</td>
				<td><input type="text" name="poc" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Client's Point of Contact </td>
				<td>:</td>
				<td><input type="text" name="cpoc" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Client's POC's number</td>
				<td>:</td>
				<td><input type="text" name="cpocno" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Client's POC's Email id</td>
				<td>:</td>
				<td><input type="text" name="cpocid" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Date of Communication</td>
				<td>:</td>
				<td><input type="text" id="datepicker" name="commdate"
					style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Communication Done</td>
				<td>:</td>
				<td><textarea style="width: 304px; height: 80px;"
						name="commhist"></textarea></td>
			</tr>
			<tr>
				<td>Set a Date for Reminder</td>
				<td>:</td>
				<td><input type="text" name="remdate" id="datepicker2"
					style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Service Type</td>
				<td>:</td>
				<td><input type="text" name="servicetype"
					style="width: 304px;" /></td>
			</tr>
			<tr>
				<td><input type="hidden" name="type" value="exist" /></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td><input type="submit" name="submit" value="ADD"
					onclick="return validateForm();" /></td>
				<td><input type="reset" name="reset" value="RESET" /></td>
			</tr>
		</table>
	</form>
	<%
		Object obj = request.getAttribute("success");
			if (obj != null) {
				System.out.println(obj.toString());
	%>
	<h3 align="center">
		<font color="RED"><%=obj.toString()%></font>
	</h3>
	<%
		}
		} else {
			name = exist.getName();
			address = exist.getAddress();
			turnover = exist.getTurnover();
			noe = exist.getNoe();
			location = exist.getLocation();
			country = exist.getCountry();
			poc = exist.getContactperson();
			cPoc=exist.getClientcontact();
			cPocNo=exist.getClientnumber();
			cPocId=exist.getClientemail();
			serviceType= exist.getServicetype();
			id = exist.getId();
			year = exist.getAssignyear();
			assign = exist.getAssignment();
			sector = exist.getAssignsector();
			sub = "EDIT";
	%>
	<h3 align="center">Edit an Existing Client</h3>
	<br>
	<form name="editFut" method="get" action="updateExisting.do">
		<table align="center">
			<tr>
				<td>Enquiry No.</td>
				<td>:</td>
				<td><input type="text" name="enqno" style="width: 304px;"
					value="<%=id%>" /></td>
			</tr>
			<tr>
				<td>Name of the company</td>
				<td>:</td>
				<td><input type="text" name="cname" style="width: 304px;"
					value="<%=name%>" /></td>
			</tr>
			<tr>
				<td>Address of the company</td>
				<td>:</td>
				<td><input type="text" name="caddress" style="width: 304px;"
					value="<%=address%>" /></td>
			</tr>
			<tr>
				<td>Turnover of the company</td>
				<td>:</td>
				<td><input type="text" name="cturnover" style="width: 304px;"
					value="<%=turnover%>" /></td>
			</tr>
			<tr>
				<td>Number of Employees in the company</td>
				<td>:</td>
				<td><input type="text" name="cnoe" style="width: 304px;"
					value="<%=noe%>" /></td>
			</tr>
			<tr>
				<td>Location of the company</td>
				<td>:</td>
				<td><input type="text" name="cloc" style="width: 304px;"
					value="<%=location%>" /></td>
			</tr>
			<tr>
				<td>Country</td>
				<td>:</td>
				<td><input type="text" name="country" style="width: 304px;"
					value="<%=country%>" /></td>
			</tr>
			<tr>
				<td>Assignment</td>
				<td>:</td>
				<td><input type="text" name="assignment" style="width: 304px;"
					value="<%=assign%>" /></td>
			</tr>
			<tr>
				<td>Sector of the Assignment</td>
				<td>:</td>
				<td><input type="text" name="assignsector"
					style="width: 304px;" value="<%=sector%>" /></td>
			</tr>
			<tr>
				<td>Contact Person in BAI</td>
				<td>:</td>
				<td><input type="text" name="contactperson" value="<%=poc%>"
					style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Client's Point of Contact </td>
				<td>:</td>
				<td><input type="text" name="cpoc" value="<%=cPoc%>" style="width: 304px;"  /></td>
			</tr>
			<tr>
				<td>Client's POC's number</td>
				<td>:</td>
				<td><input type="text" name="cpocno" value="<%=cPocNo %>" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Client's POC's Email id</td>
				<td>:</td>
				<td><input type="text" name="cpocid" value="<%=cPocId %>" style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Year of the Assignment</td>
				<td>:</td>
				<td><input type="text" name="assignyear" style="width: 304px;"
					value="<%=year%>" /></td>
			</tr>
			<tr>
				<td>Date of Communication</td>
				<td>:</td>
				<td><input type="text" id="datepicker" name="commdate"
					style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Communication Done</td>
				<td>:</td>
				<td><textarea style="width: 304px; height: 80px;"
						name="commhist"></textarea></td>
			</tr>
			 <tr>
				<td>Set a Date for Reminder</td>
				<td>:</td>
				<td><input type="text" name="remdate" id="datepicker2"
					style="width: 304px;" /></td>
			</tr>
			<tr>
				<td>Service Type</td>
				<td>:</td>
				<td><input type="text" name="servicetype" value="<%=serviceType %>"
					style="width: 304px;" /></td>
			</tr>
			<tr>
				<td><input type="hidden" name="type" value="exist" /></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td><input type="submit" name="submit" value="<%=sub%>" /></td>
				<td><input type="reset" name="reset" value="RESET" /></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>

</body>
</html>