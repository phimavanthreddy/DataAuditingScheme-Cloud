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
	
</script>
<style>
table, td, tr {
	border-collapse: collapse;
	border-style: solid;
}

table {
	width: 500px;
}

td {
	font-size: medium;
	text-align: center;
}
</style>
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();"
	onUnload="">

	<%
		String id = request.getQueryString();

		String user, file;
		HttpSession session1 = request.getSession(true);
		user = (String) session1.getAttribute("userid");

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
					"root");

			Statement st = con.createStatement();
			Statement st1 = con.createStatement();

			ResultSet rt1 = st
					.executeQuery("select * from user where rights='all' and userid='"
							+ user + "'");
			
			System.out.println("id file is :\t"+id);
			
			if (rt1.next()) {

				ResultSet rt = st
						.executeQuery("select * from upload_file where idupload_file='"
								+ id + "'");
	%>

	<div class="main">
		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>A secure and efficient remote data auditing scheme for cloud storage</h1>
				</div>
				<div class="menu_nav">
					<ul>
						<li><a href="user_download.jsp" style="font-size: 20px">back</a></li>
						<li><a href="index.html" style="font-size: 20px">Logout</a></li>

					</ul>
				</div>

				<div class="clr"></div>
				<div style="position: absolute; left: 100px; top: 100px">
					<h2>Enter key to Download</h2>

					<form action="userdownload" method="post" name="name"
						onsubmit="return check()">
						
						<table>
							<tr
								style="background: scroll; font-size: 18px; background-color: slategray; color: #ffffff">
							</tr>

							<%
								while (rt.next()) {
								
									file = rt.getString("filename");
							%>

							<tr>

								<td align="center"><input type="text" name="file" value="<%=file%>"></input></td>
								<td><input type="text" name="key" placeholder="Enter key"></input></td>
								<td><input type="submit" value="download"></input></td>
							</tr>
							<tr>

							</tr>

							<%
								}
									} else {
							%>
							<script>
								alert('your not having permission');
								window.location.href = "user_download.jsp";
							</script>
							<%
								out.println("you are not having rights to download....");
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
