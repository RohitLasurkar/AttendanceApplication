<%@page import="user.dto.User"%>
<%@page import="user.dto.DateTime"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
	EntityManager em=emf.createEntityManager();
	User user=(User)session.getAttribute("user");
	List<DateTime> dateTimes=user.getDateTimes();
	if(dateTimes.size()>0 )
	{
%>
<h2 align="center">Employee Login Details</h2>
<table border="1px" align="center" cellpadding="20px" >
<tr>
	<th>Date</th>
	<th>SignInTime</th>
	<th>SignoutTime</th>	
</tr>

<%
	for(DateTime d:dateTimes )
	{
%>
	<tr>
	<td><%=d.getDate() %></td>
	<td><%=d.getSignintime() %></td>
	<td><%=d.getSignouttime() %></td> 
	</tr>
<%} %>

<%
	DateTime dateTime =(DateTime) session.getAttribute("datetime");
%>
	<tr>
	<td><%=dateTime.getDate() %></td>
	<td><%=dateTime.getSignintime() %></td>
	<td><%=dateTime.getSignouttime() %></td> 
	</tr>

</table>

<%}else
	{
		out.print("data not available");
	}%>
</body>
</html>	