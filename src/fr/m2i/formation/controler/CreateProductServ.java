package fr.m2i.formation.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.m2i.formation.Dto.Catalogue;
import fr.m2i.formation.service.impl.ProductManagerImpl;

/**
 * Servlet implementation class CreateProductServ
 */
@WebServlet("/CreateProductServ")
public class CreateProductServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductManagerImpl manager = new ProductManagerImpl();
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String nom = request.getParameter("name");
		String strPrice = request.getParameter("price");
		
		double price  =0;
		if (strPrice != null)	
			if (!strPrice.isEmpty())
				price =  Double.parseDouble(strPrice);
		Catalogue c = new Catalogue();
		manager.createProduct(c, nom, price);
		request.setAttribute("products", manager.getProducts());
		this.getServletContext().getRequestDispatcher("/Succes").forward(request, response);
	}

}
