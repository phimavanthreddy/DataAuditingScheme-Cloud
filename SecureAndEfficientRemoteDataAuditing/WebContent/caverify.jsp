<%@page import="org.apache.catalina.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String ca = request.getParameter("caid");
	String pass = request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
			"root");
	
	Statement st = con.createStatement();
	ResultSet rt = st.executeQuery("select * from ca where caid='" + ca
			+ "'");
	
	if (rt.next()) {
	
		String p = rt.getString("password");
		
		if (p.equals(pass)) {
			response.sendRedirect("ca_page.jsp");
		} else {

			response.sendRedirect("ca.jsp?msg=failed");
		}
	} else {

		response.sendRedirect("ca.jsp?msgg=failed");
	}
%>