<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="login.css">

</head>
<body background="D:\vasanth\NetBeans\Project\images\bg66.jpg"> 
	    <%@ page include="java.sql.ResultSet" %>
	    <%@ page include="java.sql.*" %>
	    <%@ page include="javax.sql.*" %>
		
		<h1>
			<%
                ResultSet data = (ResultSet)request.getAttribute("UName");
			%>
            <table>
				<%
                while (data.next()) {
                %>
                <tr> 
                    <td><%= data.getString("fname")%>  </td>
                    <td> <%= data.getString("lname")%></td>
                    <td><%= data.getString("email")%> </td>
                    
                </tr>
                <% }%>

            </table>

        </h1>

	</body>
</html>