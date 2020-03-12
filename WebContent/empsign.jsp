<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp Details</title>
<link rel="stylesheet" type="text/css" href="registered.css">
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%!
	String fname,lname,email,ph1,address,skills,com_name,experience;
%>
<%	
	fname = request.getParameter("fname");
	lname = request.getParameter("lname");
	email = request.getParameter("email");
	ph1 = request.getParameter("phno1");
	address = request.getParameter("address");
	skills = request.getParameter("skills");
	com_name = request.getParameter("com_name");
	experience = request.getParameter("experience");
	
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb");

	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("select * from expemptbl where email = '"+email+"' ");
	
	if(!rs.next())
	{	
	int a = st.executeUpdate("insert into expemptbl (Fname,Lname,email,skills,address,CompanyName,Experience) values('"+fname+"','"+lname+"','"+email+"','"+skills+"','"+address+"','"+com_name+"','"+experience+"')");	
	%>
	<%! String str="Registered Successfully..."; %>
	<div class="container1">
	<br>
	<center>
	<span style="font-size:25px;color:red; font-family:cursive;"><%= str %></span></center>
	<%--<%@ include file="signupform.html" %> --%>
	
	<br>
	<center>
	<table cellspacing="5px" cellpadding="5px">
		<tr>
			<td class="lbl"><label>Name</label></td>
			<td class="lbl1"><label><%= fname %>&nbsp;<%= lname %></label></td>
		</tr>
		<tr>
			<td class="lbl"><label>E-mail</label></td>
			<td class="lbl1"><label><%= email %></label>
		</tr>
		<tr>
			<td class="lbl"><label>Phone Number</label></td>
			<td class="lbl1"><label><%= ph1 %></label>
		</tr>
		<tr>	
			<td class="lbl"><label>Skills</label></td>
			<td class="lbl1"><label><%= skills %></label></td>
		</tr>		

	</table>
	</center>
	<br><br><br><br><br>
			<div class="code">
				<span>To view the Recruitment Details&nbsp;&nbsp;&nbsp;- 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				use this code 
				<span style="color:red;">"PCS@job"</span> as 'Password'<br> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				& <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				Your <span style="color:red;">"Registered Email-id"</span>  as 'Username'&nbsp;</span>
				<span style="color:white;">Click here to&nbsp;<a href="login.html">Login</a></span>
			</div>
			<br><br><br><br><br>
	
			<form action="index.html">
			<table cellspacing="8px" cellpadding="5px" style="float:right;margin-right:100px;">
           	<tr>
           	<td>
           	<input type="submit" value="  OK  " 
           	style="color:blue;font-weight:bolder; font-family:cursive;font-size:20px; width:80px;height:40px;">
           	</td>
           	
           	</tr>
    </table>
	</form>
</div>
<%	}
	else
	{
	%>
	<center><span style="color:red;font-size:25px;font-family: cursive;">Email-id already exists.. </span></center>
	<%@ include file="employeesignup.html" %>
	
<% } %>
	
</body>
</html>