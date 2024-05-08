<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>A secure and efficient remote data auditing scheme for cloud storage</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

<script type="text/javascript">
	function validate() {
		var x = document.getElementsByName('file').value();
		if (x == '') {
			alert('choose file');
			return false;
		}
	}

	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();"
	onUnload="">
	<%
			if (request.getParameter("error") != null) {
			out.println("<script>alert('error when uploading')</scipt>");
		}
	%>
	<div class="main">
		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>A secure and efficient remote data auditing scheme for cloud storage</h1>
				</div>
				<div class="menu_nav">
					<ul>

						<li><a href="user.jsp" style="font-size: 20px">Logout</a></li>

					</ul>
				</div>


				<div class="clr"></div>
				<div style="position: absolute; left: 210px; top: 150px">

					<h2>Download Files Here</h2>

					<form action="#">
						<table style="font-size: 20px">
							<tr style="height: 15px"></tr>
							<tr>
								<td><a href="user_download.jsp">Download File</a></td>
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
		<div class="fbg">
			<div class="fbg_resize">



				<div class="clr"></div>
			</div>
		</div>
		<div class="footer"></div>
	</div>
</body>
</html>
