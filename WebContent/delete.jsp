<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
<link rel="stylesheet" type="text/css" href="delete_update.css">
</head>
<body> 
	
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	
	<%
	
String input = request.getParameter("empname");
String hrcode = request.getParameter("hrcode");
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String url = "jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb";
Connection con = DriverManager.getConnection(url);
Statement st = con.createStatement();

int a = st.executeUpdate(" delete from emptbl where fname = '"+input+"' ");

ResultSet rs = st.executeQuery("select * from emptbl ");
%>
	
	
<%
if(hrcode.equals("PCS@HR"))
{%>
		<center>
	 <span style="font-family:cursive;font-size:25px;font-weight:bolder; color:white;">
	 Deleted Successfully</span>
	 </center><br>
	 <span style="font-family:cursive;font-size:20px;color:maroon;float:left;">
	 Recently Deleted : <%= input %> 
	 </span>
	 
		<form action="frame1.html">
		<input type="submit" value="Back" 
		style="width:150px;height:35px;color:white;background-color:maroon; ;float:right;font-family: cursive;
				font-size:20px;margin-right:40px;">
		</form>
	 <br><br>
	
	<span style="font-family:cursive;font-size:20px;color:white;">Others</span><br>
<%
while(rs.next())
{
%>
<center>
	<table border="1px" cellpadding="5px" cellspacing="6px">
	
	<tr>
	<td class="lbl"><label><%out.println(rs.getString(1));%><%out.println(rs.getString(2)); %></label></td> 	
	<td class="lbl"><label><%out.println(rs.getString(3));%></label></td>
	<td class="lbl"><label><%out.println(rs.getString(4));%></label></td>
	<td class="lbl"><label><%out.println(rs.getString(5));%></label></td>
	</tr>
			
	</table>
</center>
	
<% 
}
} else {
%>
	<Center><h2 style="color:white;">Invalid HR-Code</h2></Center>
	<%@ include file="delete.html" %>
<%
}
%>
		
</body>
</html>
<%--
ResultSet rs1 = st.executeQuery("select * from emptbl where fname = '"+input+"' ");
while(rs1.next())
{
	String str = "insert into junktbl (Fname,Lname,email,skills,address) values('"+rs1.getString(1)+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+rs1.getString(4)+"','"+rs1.getString(5)+"')";
int b = st.executeUpdate(str);
}	
--%>