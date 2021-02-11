<%@page import="java.util.Date"%>
<%@include file="header.jsp"%>
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
	<h1>Post Article</h1>
	<%
		}
	%>

	<form action="VoidmainServlet" method="post" name="appform" enctype="multipart/form-data">

			<input type="hidden" name="type" value="com.voidmain.pojo.Article">
			<input type="hidden" name="redirect" value="postarticle.jsp">
			<input type="hidden" name="postDate" value="<%=new Date().toString()%>">

		<div class="form_settings">

			<p>
				<span>Title</span><input class="contact" type="text" name="title"
					value=""  required="required"/>
			</p>
			<p>
				<span>Description</span>
				<textarea class="contact" name="description"  required="required"></textarea>

			</p>
			<p>
				<span>Image</span>
				<input class="contact" type="file" name="image" value=""  required="required"/>

			</p>
			<p>
				<span>Youtube Link</span><input class="contact" type="text" name="videoLink"
					value="" />
			</p>
			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Post"
					onclick="return validate()" />
			</p>
		</div>

	</form>
</div>
<%@include file="footer.jsp"%>