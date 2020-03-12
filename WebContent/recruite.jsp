<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recruitement Details</title>
<link rel="stylesheet" type="text/css" href="recruit.css">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
String code = request.getParameter("code");
String email = request.getParameter("email");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url = "jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb";
Connection con = DriverManager.getConnection(url);
Statement st = con.createStatement();



if(code.equals("PCS@job"))
{
	//ResultSet rs = st.executeQuery("select * from logintbl where empid ='"+id+"'");
	//if(rs.next())
	//{
		//if(rs.getString(3).equals(email))
		//{%>
		
       	
       	<div class="top2">
			<a href="frame1.html">SignOut</a>
			<a href="#">More</a>
			
		</div>
       	<iframe class="container2" src="frame1.html" name="frame1" scrolling="">
            
       </iframe>
       
		
<%
} else {%>
	<h1>Invalid code</h1>
<%} %>
</body>
</html>