<%@page import="com.voidmain.pojo.Query"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>

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
		<h1>View Query's</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>ID</th>
				<th>Posted By</th>
				<th>Date</th>
				<th>Query</th>
				<th>Reply</th>
				<%
					if(role.equals("admin"))
					{
				%>
						<th>Reply</th>
				<%
					}
				%>
				<th>Delete</th>
			</tr>
			
			<%
				if(role.equals("admin"))
				{
					for (Query query : HibernateDAO.getQuerys()) 
					{
			%>
						<tr>
							<td><%=query.getId()%></td>
							<td><%=query.getPostedBy()%></td>
							<td><%=query.getQueryDate()%></td>
							<td><%=query.getQuery()%></td>
							<td><%=query.getReply()%></td>
							<td> <a href="replyquery.jsp?queryid=<%=query.getId()%>">Reply</a></td>
							<td> <a href="viewquerys.jsp?id=<%=query.getId()%>">delete</a></td>
						</tr>
			<%
					}
				}
				else
				{
					for (Query query : HibernateDAO.getQuerys()) 
					{
						if(query.getPostedBy().equals(username))
						{
			%>
							<tr>
								<td><%=query.getId()%></td>
								<td><%=query.getPostedBy()%></td>
								<td><%=query.getQueryDate()%></td>
								<td><%=query.getQuery()%></td>
								<td><%=query.getReply()%></td>
								<td> <a href="viewquerys.jsp?id=<%=query.getId()%>">delete</a></td>
							</tr>
			<%
						}
					}
				}
			%>
		</table>
		
		<%
			String id=request.getParameter("id");
						
			if(id!=null)
			{
				if(HibernateTemplate.deleteObject(Query.class,Integer.parseInt(id))==1)
				{
					response.sendRedirect("viewquerys.jsp?status=success");
				}
				else
				{
					response.sendRedirect("viewquerys.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>