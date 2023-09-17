<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="user.dto.User"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="user.dto.DateTime"%>
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
	LocalDate localDate=LocalDate.now();
	LocalTime localTime=LocalTime.now(); 
	
	String date=localDate.toString();
	String signintime=localTime.toString(); 
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	DateTime dateTime=new DateTime(); 
	dateTime.setDate(date);
	dateTime.setSignintime(signintime);
	dateTime.setSignouttime(null);
	
	HttpSession httpSession=request.getSession();
	httpSession.setAttribute("datetime", dateTime);
	
	
	
	et.begin();
	em.persist(dateTime);
	et.commit();
	
	
	RequestDispatcher requestDispatcher=request.getRequestDispatcher("signout.html");
	requestDispatcher.forward(request, response);
%>

</body>
</html>