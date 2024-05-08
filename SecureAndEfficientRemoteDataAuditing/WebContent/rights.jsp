<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="pack.MailUtil"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getQueryString();

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
			"root");

	Statement st = con.createStatement();

	Random r = new Random();
	int ran = r.nextInt();
	String mes = ran + "";

	int i = st
			.executeUpdate("update user set rights='all',status='yes' where iduser='"
					+ id + "'");
	if (i != 0) {

		response.sendRedirect("user_rights.jsp");

	} else {
		out.println("error");
	}
%>