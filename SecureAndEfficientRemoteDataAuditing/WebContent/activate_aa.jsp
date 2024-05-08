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

	int i = st.executeUpdate("update aa set status='yes' where idaa='"
			+ id + "'");
	
	if (i != 0) {
	
		response.sendRedirect("aas.jsp");
	
	} else {
	
		out.println("error");
	
	}
%>