<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>A secure and efficient remote data auditing scheme for cloud storage</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>-->

<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<style>
table, td {
	border: yellowgreen;
	border-style: outset;
	border-collapse: collapse;
	text-align: center;
}

table {
	width: 600px;
}
</style>
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();"
	onUnload="">

	<%
		String user, file, status;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
				"root");

		try {
		
			if (request.getParameter("msg") != null) {
				out.println("<script>alert('File uploaded')</script>");
			}
			
			if (request.getParameter("msgg") != null) {
				out.println("<script>alert('failed')</script>");
			}
			
			if (request.getParameter("ms") != null) {
				out.println("<script>alert('File not found to send')</script>");
			}
			
			Statement st = con.createStatement();
			ResultSet rt = st.executeQuery("select * from auditingresults");
	%>

	<div class="main">
		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>A secure and efficient remote data auditing scheme for cloud storage</h1>
				</div>
				<div class="menu_nav">
					<ul>
						
						<li><a href="admin_upload.jsp" style="font-size: 20px">Home</a></li>
						<li><a href="auditresults.jsp" style="font-size: 20px">View Auditing Results</a></li>
						<li><a href="index.html" style="font-size: 20px">Logout</a></li>

					</ul>
				</div>

				<div class="clr"></div>
				<div style="position: absolute; left: 100px; top: 100px">
					
					<br/><br/><br/><br/><br/><br/><br/><br/><br/>
					<h2>Auditing Results</h2>

					<form action="upload.jsp" method="post" name="name">
						<table>
							<tr style="font-size: 18px; background-color: gray">
								<td align="center">USERID</td>
								<td></td>
								<td align="center">FILE NAME</td>
								<td></td>
								<td align="center">KEY</td>
								<td></td>
								<td align="center">STATUS</td>
								<td align="center">BLOCK USER</td>
							</tr>
							<%
								while (rt.next()) {
									
							%>
							<tr>
								<td><%=rt.getString(2)%></td>
								<td></td>
								<td align="center"><%=rt.getString(3)%></td>
								<td></td>
								<td align="center"><%=rt.getString(4)%></td>
								<td></td>
								<td align="center"><%=rt.getString(5)%></td>
								<td align="center"><a href="blockuser.jsp?userid=<%=rt.getString(2)%>">block</a></td>
							</tr>
							<%
								}
									con.close();
								} catch (Exception e) {
									out.println(e);
								}
							%>

							<tr>
								<td align="center"></td>
								<td></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="clr"></div>
			</div>
		</div>
		<div class="content">
			<div class="content_resize">
				<div class="mainbar"></div>
				<div class="sidebar">
					<div class="gadget">

						<div class="clr"></div>

					</div>

				</div>
				<div class="clr"></div>
			</div>
		</div>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div class="fbg">
			<div class="fbg_resize">
				<div class="clr"></div>
			</div>
		</div>
		
		<div class="footer"></div>
	</div>

</body>
</html>
