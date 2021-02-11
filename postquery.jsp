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
		<h1>Post Query</h1>
		<%
			}
		%>
	
		<form action="VoidmainServlet" method="post" name="appform">

			<input type="hidden" name="type" value="com.voidmain.pojo.Query">
			<input type="hidden" name="redirect" value="postquery.jsp">
			<input type="hidden" name="postedBy" value="<%=username%>">
			<input type="hidden" name="queryDate" value="<%=new Date().toString()%>">
			<input type="hidden" name="reply" value="">
			
			<div class="form_settings">
				<p>
					<span>Enter Your Query</span><input class="contact" type="text" name="query"
						value="" required="required"/>
				</p>
				
				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="Post" onclick="return validate()"/>
				</p>
			</div>
		</form>
	</div>
<%@include file="footer.jsp"%>