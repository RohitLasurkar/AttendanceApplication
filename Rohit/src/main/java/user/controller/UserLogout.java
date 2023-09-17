package user.controller;

import java.awt.print.Printable;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;

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
import javax.servlet.http.HttpSession;

import user.dto.DateTime;
import user.dto.User;

@WebServlet("/signout")
public class UserLogout extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LocalDate localDate=LocalDate.now();
		LocalTime localTime=LocalTime.now();
		
				
		String date=localDate.toString();
		String signouttime=localTime.toString(); 
		
		HttpSession httpSession=req.getSession();
		DateTime dateTime=(DateTime)httpSession.getAttribute("datetime");
		
		dateTime.setSignouttime(signouttime);
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("attendance");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.merge(dateTime);
		et.commit();
		
		
		
		RequestDispatcher requestDispatcher=req.getRequestDispatcher("uaserdate.jsp");
		requestDispatcher.forward(req, resp);
		
	}
}
