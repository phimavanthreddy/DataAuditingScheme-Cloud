<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>A secure and efficient remote data auditing scheme for cloud storage</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
	function validate() {
		var aid = document.name.adminid.value;
		var pass = document.name.password.value;
		if (aid == 0) {
			alert("Enter Adminid");
			document.name.adminid.focus();
			return false;
		}
		if (pass == 0) {
			alert("Enter password");
			document.name.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%
		if (request.getParameter("msg") != null) {
			out.println("<script>alert('incorrect password')</script>");
		}
		if (request.getParameter("msgg") != null) {
			out.println("<script>alert('username not exist')</script>");
		}
	%>
	<div class="main">
		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.html">A secure and efficient remote data auditing scheme for cloud storage</a>
					</h1>
				</div>
				<div class="menu_nav">
					<ul>
						<li class="active"><a href="index.html">Home</a></li>
						<li><a href="admin.jsp">Auditor</a></li>
						<li><a href="aa.jsp">PKG</a></li>
						<li><a href="user.jsp">User</a></li>
						<li><a href="owner.jsp">Owner</a></li>
						
					</ul>
				</div>
				<div class="clr"></div>
				<div style="position: absolute; left: 210px; top: 150px">
					<h2>AUDITOR LOGIN PAGE</h2>

					<form action="admin_verify.jsp" method="get" name="name"
						onsubmit="return validate()">
						<strong> Auditor ID:</strong><br /> <input type="text"
							name="adminid" placeholder="enter auditor id"></input><br /> <strong>PASSWORD:</strong><br />
						<input type="password" name="password"
							placeholder="enter password"></input><br /> <input type="submit"
							value="SignIn"></input>

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
