<!DOCTYPE HTML>
<%@page import="com.voidmain.pojo.User"%>
<%@page import="com.voidmain.service.MailService"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<html>

<head>
<title>UOC19</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="#">Updates of COVID-19</a>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					<li><a href="index.jsp">Login</a></li>
					<li><a href="userregistration.jsp">User Registration</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->
				<%
					String status = request.getParameter("status");

							if (status != null) {
				%>
				<h1><%=status%></h1>
				<%
					} else {
				%>
				<h1>Get Your Password</h1>
				<%
					}
				%>

				<form action="forgotpassword.jsp">
					<div class="form_settings">

						<p>
							<span>User Name :</span><input class="contact" type="text"
								name="username" value=""  required="required"/>
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Get Password" />
						</p>
					</div>
				</form>

				<%
					String username = request.getParameter("username");

							if (username != null) {
								User user = HibernateDAO.getUserById(username);

								MailService.mailsend("Your Account Passwordd is :", user.getPassword(), user.getEmail());

								response.sendRedirect("index.jsp");
							}
				%>
			</div>
		</div>
	</div>
</body>
</html>
