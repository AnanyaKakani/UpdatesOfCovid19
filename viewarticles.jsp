<%@page import="com.voidmain.pojo.Article"%>
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
		<h1 style="font-size:30px;text-align="center"">View Articles</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			
			<%
				for (Article article : HibernateDAO.getArticles()) {		
			%>
						<div >
			
							<center><font size="5"><%=article.getTitle()%>
							
							<%
								if(role.equals("admin"))
								{
							%>
									<a href="viewarticles.jsp?id=<%=article.getId()%>">delete</a>
							<%	
								}
							%>  
							
							<br/>
							
							<img src="appimages/<%=article.getImage()%>" style="width:500px;height:300px;padding:12px;"></center> <br/>
							<font size="2"><%=article.getPostDate()%> </font>
							<p align="center"><font size="3"><%=article.getDescription()%></font></p>
							
							<p align="center"><a href="<%=article.getVideoLink()%>" target="_blank"  style="color:blue;">Watch video</a></p>
				         
				         </div> <br/>
			<%
					}
			%>
				
		</table>
		
		<%
			String id=request.getParameter("id");
		
			if(id!=null)
			{
				if(HibernateTemplate.deleteObject(Article.class,Integer.parseInt(id))==1)
				{
					response.sendRedirect("viewarticles.jsp?status=success");
				}
				else
				{
					response.sendRedirect("viewarticles.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>