<%@page import="pack.MailUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	
	String key = request.getParameter("key");
	String user = request.getParameter("mail");
	String filename = request.getParameter("filename");
	
	key=filename+"\t"+key;
	
	boolean status=MailUtil.mailsend(key,user);
	
	if(status)
	{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/identitybasedremotedata", "root","root");

		Statement st = con.createStatement();

		int count= st.executeUpdate("insert into access(username,filename) values('"+user+"','"+filename+"')");

		if(count==1)
		{
			response.sendRedirect("cakey_send.jsp?status=success");
		}
		else
		{
			response.sendRedirect("cakey_send.jsp?status=failed");
		}
	}
	else
	{
		response.sendRedirect("cakey_send.jsp?status=failed");
	}
	
%>