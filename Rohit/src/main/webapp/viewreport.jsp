<%@page import="user.dto.DateTime"%>
<%@page import="java.util.List"%>
<%@page import="user.dto.User"%>
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
	User user=(User) session.getAttribute("user");
	List <DateTime> dateTimes=user.getDateTimes();
	if(dateTimes.size()>0)
	{
%>
	<h2 align="center">Employee Login Details</h2>
	<table border="1px" align="center" cellpadding="20px" cellspacing="20px" >
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
	  
	</tr>
	<%} %>
	</table>

	
<%} 
	else
	{
		out.write("no data available");
	}
	%>
	
</body>
</html>