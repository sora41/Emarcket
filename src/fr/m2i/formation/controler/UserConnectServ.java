package fr.m2i.formation.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.m2i.formation.Dto.Catalogue;
import fr.m2i.formation.Dto.User;
import fr.m2i.formation.service.impl.UserManagerImpl;

/**
 * Servlet implementation class UserConnectServ
 */
@WebServlet("/UserConnectServ")
public class UserConnectServ extends HttpServlet {
	private static final String ATT_USER = "utilisateur";
	private static final String ATT_SESSION_USER = "sessionUtilisateur";
	private static String[] outPage = { "/index.jsp", "/WellcomeCommerciale", "/WellcomeInternaute" };
	private static final long serialVersionUID = 1L;
	private UserManagerImpl managerUser;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserConnectServ() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private int ChoseRedirection(User user) {
		int direction = 0;

		if (user != null) {
			if (user.getRole().equals("Commerciale")) {
				direction = 1;
			} else {
				direction = 2;
			}
		}
		return direction;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(ATT_SESSION_USER);
		int direction = 0;
		if (user == null) {
			session.invalidate();
		}
		direction = ChoseRedirection(user);
		this.getServletContext().getRequestDispatcher(outPage[direction]).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login = request.getParameter("login");
		String pwd = request.getParameter("password");
		int direction = 0;
		int errorLogin = 0;
		managerUser = new UserManagerImpl();
		HttpSession session = request.getSession();
		User user = managerUser.authenticate(login, pwd);

		if (user != null) {
			direction = ChoseRedirection(user);
			session.setAttribute(ATT_SESSION_USER, user);
		} else {
			errorLogin = 1;
			session.invalidate();
		}
		request.setAttribute("errorLogin", errorLogin);
		this.getServletContext().getRequestDispatcher(outPage[direction]).forward(request, response);
	}

}
