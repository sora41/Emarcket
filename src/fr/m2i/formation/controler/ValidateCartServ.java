package fr.m2i.formation.controler;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;



/**
 * Servlet implementation class ShowtProductCart
 */
@WebServlet("/ValidateCartServ")
public class ValidateCartServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateCartServ() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private  void recuperationPanier1(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			System.out.println( "methode 1:"); // print the key and value
			JSONObject jObj = new JSONObject(request.getParameter("panier"));
			System.out.println(request.getParameter("panier"));
			Iterator it = jObj.keys(); //gets all the keys

			while(it.hasNext())
			{
			    Object key = it.next(); // get key
			    JSONObject o = (JSONObject) jObj.get(key.toString()); // get value
			    System.out.println(key + " : " +  o); // print the key and value
			  
			}	

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private  void recuperationPanier2(HttpServletRequest request, HttpServletResponse response)
	{
		Cookie[] cookies = request.getCookies();
		if ( cookies != null)
			if (cookies.length >0)
			{
				Cookie c;
				System.out.println("test HTTP COoKIE "+cookies[0]);
				c = cookies[0];
				//request.is
				System.out.println("Domaine"+c.getDomain());
				System.out.println("Value: "+c.getValue());
			
				System.out.println("Name: "+c.getName());
			}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		recuperationPanier2(request, response);
		recuperationPanier1(request,response);
	
		
		/*
		  response.setContentType("text/plain");
			response.setCharacterEncoding("UTF8");
			response.getWriter().write("ok");*/
	}

	
}
