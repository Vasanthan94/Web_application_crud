<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Validation</title>
<link rel="stylesheet" type="text/css" href="search.css">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
String input = request.getParameter("skills");
String hrcode = request.getParameter("hrcode");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url = "jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb";
Connection con = DriverManager.getConnection(url);
Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select * from emptbl where skills ='"+input+"'");

if(hrcode.equals("PCS@HR"))
{%>
	
	
	 <span style="font-family:cursive;font-size:30px;color:red;text-align:center;">
	 Employee Details</span>
	 <br>
<%	
while(rs.next())
{
%>

<center>
	<table cellpadding="5px" cellspacing="5px">
	<tr>
	<td class="lbl"><label><%out.println(rs.getString(4));%></label></td>
	
	<td class="lbl"><label><%out.println(rs.getString(1)); %>&nbsp;<%out.println(rs.getString(2)); %></label></td> 	
	<td class="lbl"><label><%out.println(rs.getString(3));%></label></td>
	
	<td class="lbl"><label><%out.println(rs.getString(5));%></label></td>
	</tr>
		
	</table>
</center>
	
<% }%>
	
	
		<br>
		<form action="frame1.html">
		
		<input type="submit" value="OK" 
		style="width:150px;height:30px;color:white;background-color: navy;float:right;font-family: cursive;
				font-size:15px;margin-rigth:35px;">
		
		</form>
<%	}
else
{%>
	<Center><h2 style="color:white;">Invalid HR-Code</h2></Center>
	<%@ include file="search.jsp" %>
<%
}

%>	
</body>
</html>


<%--
<td class="lbl"><label>E-Mail</label></td>
<td class="lbl"><label>Address</label></td>
<td class="lbl"><label>Skills</label></td>

if(rs.getString(1).equals(input)) {
--%>