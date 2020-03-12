package ConnectDB;

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;

import javax.sql.*;

@WebServlet("/ConnectDB")
public class ConnectDB extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
  
	
    public ConnectDB() 
    {
        super();

        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
	//response.getWriter().append("Served at: ").append(request.getContextPath());
	
    
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
	//doGet(request, response);
	String ifname,ilname,iemail;
	
	ifname = request.getParameter("fname");
	ilname = request.getParameter("lname");
	iemail = request.getParameter("email");
	int a;
		
	PrintWriter out = response.getWriter();
		try
		{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb";
		Connection con = DriverManager.getConnection(url);

		Statement st = con.createStatement();
		
		out.println(ilname);
		out.println(ifname);

		a = st.executeUpdate("insert into emptbl (Fname,Lname,Email,Phone1,Phone2) values('"+ifname+"','"+ilname+"','"+iemail+"')");
		
//	    RequestDispatcher disp = request.getRequestDispatcher("signupform.jsp");
 //       disp.forward(request, response);
		}
		catch(Exception e)
		{
			out.println(e);
		}
    
    }

}
