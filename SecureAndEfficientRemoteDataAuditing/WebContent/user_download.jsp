<%@page import="java.util.Random"%>
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

<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>

<script>
	function check() {

		var f = document.name.filename.value();
		var k = document.name.key.value();

		if (f == 0) {
			alert("Enter filename");
			document.name.filename.focus();
			return false;
		}
		if (k == 0) {
			alert("Enter key ");
			document.name.key.focus();
			return false;
		}

	}
</script>
<style>
table, td, tr {
	border-collapse: collapse;
	border-style: solid;
}

table {
	width: 600px;
}

td {
	text-align: center;
	font-size: medium;
}
</style>
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();"
	onUnload="">

	<%
		if (request.getParameter("file") != null) {
			out.println("<script>alert('file downloaded')</script>");
		}

		if (request.getParameter("ms") != null) {
			out.println("<script>alert('file not found')</script>");
		}

		String user, file;
		HttpSession session1 = request.getSession(true);
		user = (String) session1.getAttribute("userid");

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
					"root");
			Statement st = con.createStatement();

			ResultSet rt = st
					.executeQuery("select * from upload_file where status='yes'");
	%>
	<div class="main">
		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>A secure and efficient remote data auditing scheme for cloud storage</h1>
				</div>
				<div class="menu_nav">
					<ul>

						<li><a href="index.html" style="font-size: 20px">Logout</a></li>

					</ul>
				</div>

				<div class="clr"></div>
				<div style="position: absolute; left: 100px; top: 100px">
					<h2>FILES ON CLOUD</h2>

					<form action="down.jsp" method="post" name="name"
						onsubmit="return check()">
						<table>


							<tr
								style="background: scroll; font-size: 18px; background-color: slategray; color: #ffffff">
								
								<td align="center">User ID</td>
								<td align="center">Mail ID</td>
								<td align="center">Phone Number</td>
								<td align="center">FILES</td>
								<td>DOWNLOAD</td>

							</tr>

							<%
								while (rt.next()) {

										file = rt.getString("filename");
										String id = rt.getString("idupload_file");
										String ownerid=rt.getString("userid");
										
										ResultSet myrs=con.createStatement().executeQuery("select * from owner where username='"+ownerid+"'");
										
										String mobile="";
										String mail="";
										
										while(myrs.next())
										{
											mail=myrs.getString("mailid");
											mobile=myrs.getString("phoneno");
										}
							%>

							<tr>
								<td align="center"><%=ownerid%></td>
								<td align="center"><%=mail%></td>
								<td align="center"><%=mobile%></td>
								<td align="center"><%=file%></td>
								<td><a href="view.jsp?<%=id%>">Download</a></td>

							</tr>



							<%
								}
									con.close();
								} catch (Exception e) {
									out.println(e);
								}
							%>

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
		<div class="fbg">
			<div class="fbg_resize">



				<div class="clr"></div>
			</div>
		</div>
		<div class="footer"></div>
	</div>

</body>
</html>
