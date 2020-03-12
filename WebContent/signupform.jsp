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
String fname,lname,email,ph1,ph2,address,skills,dob;
String igen,iph1,iph2,idoor,istreet,itown,ilandmark;
String idistrict,ipincode,istate,inationality,ieducation,iinstitution,idept,icompletion,ipercentage;
String icom_name,iexp,iskills,ilanguage,ihobbies,im_status;
%>

<%	
	fname = request.getParameter("fname");
	lname = request.getParameter("lname");
	email = request.getParameter("email");
	address = request.getParameter("district");
	skills = request.getParameter("skills");
	
	dob = request.getParameter("dob");
	ph1 = request.getParameter("phno1");
	ph2 = request.getParameter("phno2");
	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	
    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb");

	
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("select * from emptbl where email = '"+email+"' ");
	
	if(!rs.next())
	{	
	int a = st.executeUpdate("insert into emptbl (Fname,Lname,email,skills,address) values('"+fname+"','"+lname+"','"+email+"','"+skills+"','"+address+"')");	
	%>
	<%! String str="Registered Successfully..."; %>
	
	<div class="container1">
	<br>
	<center>
	<span style="font-size:25px;color:maroon; font-family:cursive;"><%= str %></span></center>
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
			<td class="lbl1"><label><%= iph1 %></label>
		</tr>
		<tr>	
			<td class="lbl"><label>Skills</label></td>
			<td class="lbl1"><label><%= skills %></label></td>
		</tr>		

	</table>
	</center>
	<br><br>
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
				<span style="color:white;">Click here to&nbsp;<a href="recruite.html">Login</a></span>
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
	<%@ include file="signupform.html" %>
	
<% } %>
</body>
</html>

<%--
	igen = request.getParameter("gender");	
	idoor = request.getParameter("door");
	istreet = request.getParameter("street");
	itown = request.getParameter("town");
	ilandmark = request.getParameter("landmark");
	idistrict = request.getParameter("district");
	ipincode = request.getParameter("pincode");
	istate = request.getParameter("state");
	inationality = request.getParameter("nationality");
	
	ieducation = request.getParameter("education");
	iinstitution = request.getParameter("institution");
	idept = request.getParameter("department");
	icompletion = request.getParameter("completion");
	ipercentage = request.getParameter("percentage");
	icom_name = request.getParameter("company");
	iexp = request.getParameter("experience");
	iskills = request.getParameter("skills");
		
	
	<table>
		<tr>
			<td class="lbl"><label>Date of Birth</label></td>
			<td class="lbl1"><label><%= idob %></label>
		</tr>
		<tr>
			<td class="lbl"><label>Gender</label></td>
			<td class="lbl1"><label><%= igen %></label>
		</tr>
			
		<tr>
			<td class="lbl"><label>Address</label></td>
			<td class="lbl1"><label><%= idoor %>,<%= istreet %>,<br>
									<%= itown %>,<br><%= ilandmark %>,<br>
									<%= idistrict %>,<%= ipincode %>,<br>
									<%= istate %>.
							</label></td>
		</tr>
		<tr>
			<td class="lbl"><label>Qualification</label></td>
			<td class="lbl1"><label><%= ieducation %>,<br>
									<%= iinstitution %>,<br>
									<%= idept %>,<%= icompletion %>,<br>
									<%= ipercentage %>
							</label></td>
		</tr>
		<tr>
			<td class="lbl"><label>Experience</label></td>
			<td class="lbl1"><label><%= icom_name %>,<br>
									<%= iexp %>,<br>
							</label></td>
		</tr>

		
	</table>
<tr>	
			<td class="lbl"><label>Languages Known</label></td>
			<td class="lbl1"><label><%= ilanguage %>
							</label></td>
		</tr>
		<tr>	
			<td class="lbl"><label>Hobbies</label></td>
			<td class="lbl1"><label><%= ihobbies %>
							</label></td>
		</tr>
		<tr>	
			<td class="lbl"><label>Marital status</label></td>
			<td class="lbl1"><label><%= im_status %>
							</label></td>
		</tr>
 --%>