package fr.m2i.formation.controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import fr.m2i.formation.service.impl.ProductManagerImpl;

@WebServlet("/CatalogueServ")
public class CatalogueServ extends HttpServlet {
	private ProductManagerImpl manager = new ProductManagerImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("products", manager.getProducts());		
		this.getServletContext().getRequestDispatcher("/catalogue").forward(request, response);
	}

}
