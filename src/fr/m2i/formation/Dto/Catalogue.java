package fr.m2i.formation.Dto;

import java.util.ArrayList;
/**
 * Catalogue list de produit
 * @author Florent
 *
 */
public class Catalogue {
	private ArrayList<Product> listProducts= new ArrayList<Product>();

	public ArrayList<Product> getListProducts() {
		return listProducts;
	}

	public void setListProducts(ArrayList<Product> listProducts) {
		this.listProducts = listProducts;
	}
	
}
