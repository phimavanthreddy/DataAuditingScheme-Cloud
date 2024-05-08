<%@page import="org.apache.catalina.Session"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String user = request.getParameter("userid");
	String pass = request.getParameter("password");

	HttpSession session1 = request.getSession(true);

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
			"root");
	
	Statement st = con.createStatement();
	ResultSet rt = st.executeQuery("select * from user where userid='"
			+ user + "'");
	
	if (rt.next()) {
		String p = rt.getString("password");
		if (p.equals(pass)) {
			if (rt.getString("status").equalsIgnoreCase("yes")) {
				session1.setAttribute("userid", user);
				response.sendRedirect("user_upload.jsp");
			} else {
				out.println("your not yet Activated.....");
			}
		} else {

			response.sendRedirect("user.jsp?msg=failed");
		}
	} else {

		response.sendRedirect("user.jsp?msgg=failed");

	}
%>