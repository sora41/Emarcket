package fr.m2i.formation.service;

import java.util.ArrayList;

import fr.m2i.formation.Dto.Catalogue;
import fr.m2i.formation.Dto.Product;
import fr.m2i.formation.service.exception.ProductException;
/**
 * Interface permetant la gestion des product
 * @author Florent
 *
 */
public interface IProductManager {
	/**
	 *  methode pour cree un produit
	 *  @return le product cree et qui a ete ajoute aux catalogue 
	 *  @author Florent 
	 */
	public abstract void createProduct(Product newProduct) throws ProductException;
	/**
	 * @param id identifiant de type int du produit a suprimer
	 *  efface un produit 
	 *  @author Florent 
	 */
	public abstract void deleteProduct(int id);
	/**
	 * met a jours le produit
	 * @param id entier representant l'identifant du produit 
	 * @param price double representant le prix du produit
	 * @return le produit mise a jours de ces donne 
	 * @author Florent
	 */
	public abstract Product updateProduct(int id,double price);
	
	public abstract ArrayList<Product> getProducts();
	
	public abstract Product getProduct(int id);

}
