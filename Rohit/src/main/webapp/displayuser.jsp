<%@page import="user.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="user.dto.Admin"%>
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
	Admin admin=(Admin)session.getAttribute("admin");
	List<User> users=admin.getUsers();
	if(users.size()>0)
	{
%>
<h2 align="center">Employee Details</h2>
<table border="0px" align="center" cellpadding="50px" cellspacing="50px">
<tr>
<th>User Name</th>
</tr>
<%
	for(User u: users)
	{
		String name=u.getName();
%>
	<tr>
	<td><a href="userdetails.jsp?id=<%=u.getId()%>"><%=name %></a></td>
	
	</tr>
	<%} %>
</table> 

<%} else
{
	out.write("No user available");
	}%>
</body>
</html>