package Login;

import java.io.IOException;
import java.sql.*;

import java.io.*;
import javax.servlet.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public Login() {
        super();
    
    
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
		PrintWriter out = response.getWriter();
		String id,pass;
		try
		{
			id = request.getParameter("empid");
			pass = request.getParameter("emppass");
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433;user=sa;password=Pass@123;databasename=empdb";
			Connection con = DriverManager.getConnection(url);
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery("select * from emptbl");
			
			if(id.equals("pcs"))
			{
				request.setAttribute("uname", rs);
				RequestDispatcher disp = request.getRequestDispatcher("login.jsp");
				disp.forward(request, response);
			}
			else
			{
				out.println("Sorry");
				RequestDispatcher disp = request.getRequestDispatcher("login.html");
				disp.include(request, response);
			}
				
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

}
