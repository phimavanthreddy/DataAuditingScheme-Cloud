<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String admin = request.getParameter("adminid");
	String pass = request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
			"root");

	System.out.println("Database connected");

	Statement st = con.createStatement();
	
	ResultSet rt = st.executeQuery("select count(*) from admin where adminid='"+admin+"' and password='"+pass+"'");
	
	if (rt.next()) {
	
		int p = rt.getInt(1);
		
		if (p==1) {

			response.sendRedirect("admin_upload.jsp");
		
		} else {

			response.sendRedirect("admin.jsp?msg=invalid credentials");
		}
	} else {

		response.sendRedirect("admin.jsp?msgg=invalid user name");

	}
%>
