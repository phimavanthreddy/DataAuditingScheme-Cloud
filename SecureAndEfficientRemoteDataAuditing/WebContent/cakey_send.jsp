<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>
	Cloud Storage Systems</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}

	function validate() {

	}
</script>
<style>
table, td, tr {
	border-style: solid;
	border-collapse: collapse;
}
</style>
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();"
	onUnload="">

	<%
		String user, file, key;
		try {

			if (request.getParameter("msg") != null) {
				out.println("<script>alert('key sent')</script>");
			}

			if (request.getParameter("msgg") != null) {
				out.println("<script>alert('failed')</script>");
			}

			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
					"root");

			Statement st = con.createStatement();
			Statement st1 = con.createStatement();
			ResultSet rt = st.executeQuery("select * from upload_file ");
	%>
	<div class="main">
		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>A secure and efficient remote data auditing scheme for cloud storage</h1>
				</div>
				<div class="menu_nav">
					<ul>
						<li><a href="aa_page.jsp" style="font-size: 20px">back</a></li>
						<li><a href="index.html" style="font-size: 20px">Logout</a></li>

					</ul>
				</div>

				<div class="clr"></div>
				<div style="position: absolute; left: 100px; top: 100px">
					<h2>Send Keys</h2>
					<table>
						<tr>
							<td align="center">OWNER</td>
							<td align="center">FILE</td>
							<td align="center">KEY</td>
							<td align="center">User</td>
							<td align="center">Send</td>
						</tr>
						<%
							while (rt.next()) {
									user = rt.getString("userid");
									file = rt.getString("filename");
									key = rt.getString("skey");
						%>
						<tr>
							<form action="send.jsp">
								<td><%=user%></td>
								<td align="center"><input type="text" value="<%=file%>"
									readonly="readonly" name="filename" /></td>
								<td align="center"><input type="text" value="<%=key%>"
									readonly="readonly" name="key" /></td>
								<td><select name="mail">
										<%
											ResultSet rt1 = st1
															.executeQuery("select * from user where rights='all' AND status='yes'");
													while (rt1.next()) {

														String userID = rt1.getString("userid");
										%>
										<option value="<%=userID%>"><%=userID%></option>
										<%
											}
										%>
								</select></td>
								<td><input type="submit" value="send" /></td>
							</form>
						</tr>
						<%
							}
						%>
					</table>

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

	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>
