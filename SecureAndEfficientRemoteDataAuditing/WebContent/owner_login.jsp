<%@page import="org.apache.catalina.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String user = request.getParameter("userid");
	String pass = request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
			"root");
	
	Statement st = con.createStatement();
	ResultSet rt = st
			.executeQuery("select * from owner where username='" + user
					+ "'");
	
	if (rt.next()) {
	
		String p = rt.getString("password");
		
		if (p.equals(pass)) {
			request.getSession().setAttribute("userid", user);
			System.out.println("prasad login user id :\t"+request.getSession().getAttribute("userid"));
			response.sendRedirect("owner_page.jsp");
		} else {

			response.sendRedirect("owner.jsp?msg=failed");
		}
	
	} else {

		response.sendRedirect("owner.jsp?msgg=failed");
	}
%>