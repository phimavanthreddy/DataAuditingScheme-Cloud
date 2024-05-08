<%@page import="java.sql.Blob"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
	try {
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/identitybasedremotedata", "roor",
				"root");
		
		Statement st = con.createStatement();
		
		ResultSet rt = st.executeQuery("select * from upload_files");

		if (rt.next()) {
		
			String user = rt.getString("userid");

			byte[] bt = new byte[256];
			Blob blob = rt.getBlob("file");
			InputStream isr = blob.getBinaryStream();
			FileOutputStream fos = new FileOutputStream(user + ".txt");

			while (isr.read(bt) > 0) {
				fos.write(bt);
			}
			fos.close();

		}
		out.println("<script>alert('file stored')</script>");
	} catch (Exception e) {
		out.println(e);
	}
%>