package fr.m2i.formation.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.m2i.formation.Dto.Product;
import fr.m2i.formation.Dto.User;
import fr.m2i.formation.service.impl.ProductManagerImpl;

/**
 * Servlet implementation class DetailsProduitServ
 */
@WebServlet("/DetailsProduitServ")
public class DetailsProduitServ extends HttpServlet {
	private static final String ATT_USER = "utilisateur";
	private static final String ATT_SESSION_USER = "sessionUtilisateur";
	private static String[] outPage = {"index.jsp", "/DetailsProduitServ" };

	private static final long serialVersionUID = 1L;
	private ProductManagerImpl manager = new ProductManagerImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsProduitServ() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(ATT_SESSION_USER);
		int direction = 0;
		if (user == null) {
			session.invalidate();
		}else
			direction =1;
		//this.getServletContext().getRequestDispatcher(outPage[direction]).forward(request, response);
		// manque pour le page index le request get contextpath 
		response.sendRedirect(outPage[direction]);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strId= "";
		int intId =-1;
		Product itemProduct = null;
		strId =	request.getParameter("id");
		if (strId != null)
			if (!(strId.isEmpty()))
			{
				intId = Integer.parseInt(strId);
				itemProduct = manager.getProduct(intId);
				request.setAttribute("product",itemProduct );
				this.getServletContext().getRequestDispatcher("/ShowDetailProduct").forward(request, response);
			}
	}
}
