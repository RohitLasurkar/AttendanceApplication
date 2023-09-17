package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import user.dto.Admin;
import user.dto.User;

@WebServlet("/login")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
		EntityManager em=emf.createEntityManager();
		
		Query query=em.createQuery("select a from User a where a.email=?1 and a.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<User> users=query.getResultList();
		if(users.size()>0)
		{
			User user=users.get(0);
			
			HttpSession httpSession=req.getSession();
			httpSession.setAttribute("user", user);
			
			RequestDispatcher requestDispatcher=req.getRequestDispatcher("signin.html");
			requestDispatcher.forward(req, resp);
		}
		else if("admin@gmail.com".equalsIgnoreCase(email) && "admin".equalsIgnoreCase(password))
		{
			Query query1=em.createQuery("select a from Admin a where a.email=?1 and a.password=?2");
			query1.setParameter(1, email);
			query1.setParameter(2, password);
			List<Admin> admin=query1.getResultList();
			Admin admin2=(Admin)admin.get(0);
			
			EntityManagerFactory emf1=Persistence.createEntityManagerFactory("attendance");
			EntityManager em1=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			
			
			HttpSession httpSession=req.getSession();
			httpSession.setAttribute("admin", admin2);
			
			RequestDispatcher requestDispatcher=req.getRequestDispatcher("setadmin.jsp");
			requestDispatcher.forward(req, resp);
		}
		else
		{
			PrintWriter printWriter=resp.getWriter();
			printWriter.print("invalid username and password");
			RequestDispatcher requestDispatcher=req.getRequestDispatcher("login.html");
			requestDispatcher.include(req, resp);
			resp.setContentType("text/html"); 
		}
		
	}
}
