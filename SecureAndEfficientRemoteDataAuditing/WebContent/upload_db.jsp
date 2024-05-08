<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>

<%
	String filename = request.getParameter("file");
	System.out.println("filename:" + filename);

	String userid = request.getParameter("userid");
	try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
				"root");

		File file = new File(filename);
		FileInputStream fis = new FileInputStream(file);

		PreparedStatement st = con.prepareStatement("insert into upload_file('userid','file')values(?,?);");
		
		st.setString(1, userid);
		st.setBinaryStream(2, fis);
		int i = st.executeUpdate();

		fis.close();
		con.close();
		if (i != 0) {
			response.sendRedirect("user_upload.jsp");
		}

	} catch (Exception e) {
		out.println(e);
	}
%>