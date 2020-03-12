<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>

	<%
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			Connection con = DriverManager
					.getConnection("jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb");
			out.println(" Connected..");
		} catch (Exception e) {
			out.println(e);
		}
	%>

</body>
</html>