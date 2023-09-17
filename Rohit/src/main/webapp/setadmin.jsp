<%@page import="user.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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
	Admin admin=(Admin) session.getAttribute("admin");
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Query query=em.createQuery("select a from User a");
	List<User> users=query.getResultList();
	
	admin.setUsers(users);
	
	et.begin();
	em.merge(admin);
	et.commit();
	
	RequestDispatcher rd=request.getRequestDispatcher("displayuser.jsp");
	rd.forward(request, response);
	
%>
</body>
</html>