<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginValidate</title>
<link rel="stylesheet" type="text/css" href="info.css">
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
String id=request.getParameter("empid");
String password=request.getParameter("emppass");

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url = "jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb";
Connection con = DriverManager.getConnection(url);
Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select * from logintbl where empid ='"+id+"'");

if(rs.next())
{
	if(rs.getString(2).equals(password))
	{%>
		
    	<div class="top1">
            <span>Professionet Consultancy Services Pvt Ltd</span><br>
		    <marquee><span style="font-size: 20px;color:maroon;">London, 
		    <span style="font-size: 20px;font-style: italic;color:red;">Since-1992</span></span></marquee>       
        </div>
    	
		<div class="top2">

			<span><%out.println("Hi"+"&nbsp;"+id);%></span>
			<a href="index.html">Logout</a>
			
		</div>
		
		<div class="container1">
    			<br><br>
    	        <a href="index.html">Home</a><br><br>
    	        <a href="#">Client Details</a><br><br>
                <a href="#">Project Details</a><br><br>
                <a href="#">Services</a><br><br>
                <a href="#">News</a><br><br>
                <a href="search.jsp" target="frame1" style="color:red;">Search</a><br><br>
                <a href="delete.html" target="frame1" style="color:red;">Delete</a><br><br>
                <a href="update.html" target="frame1" style="color:red;">Update</a>
		</div>
		
		
			<iframe class="container2" src="frame1.html" name="frame1" scrolling="">
            
        	</iframe>
       
        /
        <div class="container3">
        
        </div>
        
		<div class="container4">
        
        </div>
<%
}
	else
	{%>
		<center><h2 style="color:white;"><% out.println("Invalid Password..!"); %></h2></center>
		<%@ include file="login.html" %>
<%
}
}
else
{
%> 
		<center>
		<h2 style="color:white;"><% out.println("Invalid Empid..!"); %></h2></center>
		<%@ include file="login.html" %>
<%} %>
</body>
</html>


<%--
Class.forName("");
String url = " ";
Connection con = DriverManager.getConnection(url);
Statement st = con.createStatement();

ResultSet rs = st.executeQuery("select * from emptbl where empid = ' "+id+" ' ");

if(rs.next())
{
	if(rs.getString("empid").equals(password))
	{
		out.pritln("Hai" + id);
	}
	else
	{
		out.println("Invalid password");
	}
}
if(id.equals("1234") && password.equals("1234"))
{%>
	<form action="frame2.html">
	<h2>Welcome <%= id %></h2>
	<input type="submit" value="OK" style="width:150px;height=30px;color:orange">
	</form>
<% }
else if(id.equals("1235") && password.equals("1235"))
{%>
	<form action="frame2.html">
	<h2>Welcome <%= id %></h2>
	<input type="submit" value="OK" style="width:150px;height=30px;color:orange">
	</form>
<%}
else if(id.equals("1236") && password.equals("1236"))
{%>
	<form action="frame2.html">
	<h2>Welcome <%= id %></h2>
	<input type="submit" value="OK" style="width:150px;height=30px;color:orange">
	</form>
<%}
else
{%>

 --%>
