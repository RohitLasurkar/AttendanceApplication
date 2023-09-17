package user.controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import user.dto.User;
@WebServlet("/usersave")
public class Usersave extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=req.getParameter("user");
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		String phoneno=req.getParameter("phono");
		
		long phoneno1=Long.parseLong(phoneno);
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		User user=new User();
		user.setName(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhoneno(phoneno1);
		
		
		
		et.begin();
		em.persist(user);
		et.commit();
		
		RequestDispatcher rd=req.getRequestDispatcher("login.html");
		rd.forward(req, resp);
	}
}
