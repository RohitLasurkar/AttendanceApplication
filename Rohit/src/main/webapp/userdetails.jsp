<%@page import="java.util.List"%>
<%@page import="user.dto.DateTime"%>
<%@page import="user.dto.User"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	int id1=Integer.parseInt(id);
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
	EntityManager em=emf.createEntityManager();
	
	User user=em.find(User.class, id1);
	List<DateTime> dateTimes=user.getDateTimes();
	if(dateTimes.size()>0)
	{
%>
<h2 align="center">Employee Login Details</h2>
<table border="0px" align="center" cellpadding="50px" cellspacing="50px">
	<tr>
	<th>Date</th>
	<th>SignInTime</th>
	<th>SignoutTime</th>	
	</tr>
	
	<%
		for(DateTime d: dateTimes)
		{
	%>
	<tr>
	<td><%=d.getDate() %></td>
	<td><%=d.getSignintime() %></td>
	<td><%=d.getSignouttime() %></td> 
	<td></td>  
	</tr>
	<%} %>
	</table>

<%}else
	{
		out.print("data not available");	
	}
%>
</body>
</html>