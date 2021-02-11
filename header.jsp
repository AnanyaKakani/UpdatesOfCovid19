<!DOCTYPE HTML>
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
						<a href="#">Updates on COVID-19</a>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					 <%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute( "username");

						if (role.equals("admin")) {
					%>
						<li><a href="viewquerys.jsp">View Queries</a></li>
						<li><a href="postarticle.jsp">Post Article</a></li>
						<li><a href="viewarticles.jsp">View Articles</a></li>
					<%
						}
					%>
					<%
						if (role.equals("user")) {
					%>
						<li><a href="home.html">Home</a></li>
						<li><a href="postquery.jsp">Post Query</a></li>
						<li><a href="viewquerys.jsp">View Replies</a></li>
						<li><a href="viewarticles.jsp">View Articles</a></li>
					
					<%
						}
					%>
					
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">