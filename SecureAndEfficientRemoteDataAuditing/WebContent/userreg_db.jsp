<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>

<%
	String mailid = request.getParameter("mail");
	String pass = request.getParameter("password");
	String ph = request.getParameter("phoneno");
	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
				"root");

		Statement st = con.createStatement();
		String status="yes";
		int i = st
				.executeUpdate("INSERT INTO user (userid,password,phoneno,status) VALUES('"
						+ mailid + "','" + pass + "','" + ph + "','"+status+"')");
		con.close();
		if (i != 0) {
			response.sendRedirect("user.jsp?msg=registered sucess..!");
		}

	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>