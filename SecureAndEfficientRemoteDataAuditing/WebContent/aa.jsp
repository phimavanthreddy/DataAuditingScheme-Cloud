<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>A secure and efficient remote data auditing scheme for cloud storage</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script>
	function validate() {
		var uname = document.name.userid.value;
		var pass = document.name.password.value;
		if (uname == 0) {
			alert("Enter your id");
			document.name.userid.focus();
			return false;
		}
		if (pass == 0) {
			alert("Enter your password");
			document.name.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%
		if (request.getParameter("msg") != null) {
			out.println("<script>alert('Registered!')</script>");
		}
		if (request.getParameter("msgg") != null) {
			out.println("<script>alert('user not exist')</script>");
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
					<h2>PKG LOGIN PAGE</h2>

					<form action="aa_login.jsp" method="get" name="name"
						onsubmit="return validate()">
						<strong> PKG ID:</strong><br /> <input type="text" name="userid"
							placeholder="enter user id"></input><br /> <strong>PASSWORD:</strong><br />
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
