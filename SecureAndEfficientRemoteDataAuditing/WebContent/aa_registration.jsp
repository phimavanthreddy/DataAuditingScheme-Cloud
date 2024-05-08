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
		var mail = document.name.mail.value;
		var pass = document.name.password.value;
		var cpass = document.name.cpassword.value;
		var ph = document.name.phoneno.value;

		if (mail == 0) {
			alert("Enter your Mailid");
			document.name.mail.focus();
			return false;
		}
		if (pass == 0) {
			alert("Enter your password");
			document.name.password.focus();

			return false;
		}
		if (cpass == 0) {
			alert("Enter your password cofirmation");
			document.name.cpassword.focus();

			return false;
		}
		if (pass != cpass) {
			alert("Incorrect Confiorm password");
			document.name.password.focus();

			return false;
		}
		if (ph == 0) {
			alert("Enter your phone number");
			document.name.phoneno.focus();
			return false;
		}
		if (isNaN(ph)) {
			alert("Incorrect phone numbers");
			document.name.phoneno.focus();
			return false;
		}
	}
</script>
</head>
<body>
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
						<li><a href="index.html">Home</a></li>
						<li><a href="admin.jsp">Admin</a></li>
						<!--          <li><a href="about.html">About Us</a></li>-->
						<li><a href="user.jsp">User</a></li>
						
					</ul>
				</div>
				<div class="clr"></div>
				<div style="position: absolute; left: 210px; top: 100px;">
					
					<h2>AA Registraion</h2>

					<form action="aareg_db.jsp" method="get" name="name"
						onsubmit="return validate() ">
					
						<strong> USERNAME:<BR />
						<input type="text" name="uname" placeholder="Enter username"></input><br />
						
						EMAIL ID:<br />
						<input type="email" name="mail" placeholder="enter email id"></input><br />
						
						PASSWORD:<br /> <input type="password" name="password" placeholder="enter password"></input><br /> 
						
						CONFIRM PASSWORD:<br /><input type="password" name="cpassword" placeholder="enter confirm password"></input><br /> 
						
						PHONE NUMBER:<br />
						
						<input type="number" maxlength="10" name="phoneno" placeholder="enter your phoneno"></input><br /> 
						
						<input type="submit" value="SUBMIT"></input>
						
						</strong>
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

