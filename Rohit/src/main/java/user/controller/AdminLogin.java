package user.controller;

import java.io.IOException;
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

import user.dto.Admin;

@WebServlet("/adminlogin") 
public class AdminLogin extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=req.getParameter("user");
		String password=req.getParameter("password");
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Query query=em.createQuery("select a from a where a.username=?1 and a.password=?2");
		List<Admin>admins=query.getResultList();
		if(admins.size()>0)
		{
			Admin admin=admins.get(0);
			
			HttpSession httpSession=req.getSession();
			httpSession.setAttribute("admin", admin);
			
			RequestDispatcher requestDispatcher=req.getRequestDispatcher("setadmin.jsp");
			requestDispatcher.forward(req, resp);
			
		}
		
		
	}
}
