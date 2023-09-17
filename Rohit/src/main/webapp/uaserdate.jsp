<%@page import="java.util.ArrayList"%>
<%@page import="user.dto.User"%>
<%@page import="user.dto.DateTime"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityTransaction"%>
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
	EntityTransaction et=em.getTransaction();

	User user =(User)session.getAttribute("user");
	
	DateTime dateTime =(DateTime) session.getAttribute("datetime");
	List<DateTime>dateTimes2=user.getDateTimes();
	List <DateTime> dateTimes=new ArrayList();
	
	for(DateTime dt:dateTimes2)
	{
		dateTimes.add(dt);	
	}
	dateTimes.add(dateTime);
	
	user.setDateTimes(dateTimes);
	
	et.begin();
	em.merge(user);
	et.commit();
	

	
	RequestDispatcher rd=request.getRequestDispatcher("logoutuser.html");
	rd.forward(request, response);
	
%>

</body>
</html>