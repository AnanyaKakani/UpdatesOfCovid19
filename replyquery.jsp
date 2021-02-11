<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.Query"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>

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
	<h1>Send Reply</h1>
	<%
		}
	%>

	<%
		String queryid = request.getParameter("queryid");

		if (queryid != null) {

			Query query = HibernateDAO.getQueryById(Integer.parseInt(queryid));
	%>

	<form action="replyquery.jsp" name="appform">

		<input type="hidden" value="<%=queryid%>" name="queryid">

		<div class="form_settings">
			<p>
				<span>Reply:</span>
				<textarea class="contact" name="reply" required="required"></textarea>
			</p>

			<p style="padding-top: 15px">
				<span>&nbsp;</span><input class="submit" type="submit"
					name="contact_submitted" value="Send Reply"
					onclick="return validate()" />
			</p>
		</div>
	</form>

	<%
		}
	%>

	<%
		String reply = request.getParameter("reply");
		String qid = request.getParameter("queryid");

		if (reply != null && qid != null) {
			Query query = HibernateDAO.getQueryById(Integer.parseInt(qid));
			query.setReply(reply);

			if (HibernateTemplate.updateObject(query) == 1) {
				response.sendRedirect("replyquery.jsp?status=success");
			} else {
				response.sendRedirect("replyquery.jsp?status=failed");
			}
		}
	%>
</div>
<%@include file="footer.jsp"%>