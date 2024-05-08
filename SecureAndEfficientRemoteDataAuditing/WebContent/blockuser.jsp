<%@page import="pack.MailUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String userid = request.getParameter("userid");

	System.out.println("user id :\t"+userid);

	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
			"root");

	Statement st = con.createStatement();
	
	String rights="no";

	int count = st
			.executeUpdate("update user set status='no',rights='"+rights+"' where userid='"+userid+"'");

	if (count == 1) {
		response.sendRedirect("auditresults.jsp?status=success");
	} else {
		response.sendRedirect("auditresults.jsp?status=failed");
	}
%>