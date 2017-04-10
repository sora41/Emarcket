package fr.m2i.formation.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fr.m2i.formation.Dto.Catalogue;
import fr.m2i.formation.Dto.Component;
import fr.m2i.formation.Dto.Product;
import fr.m2i.formation.jdbc.JdbcZero;
import fr.m2i.formation.service.IProductManager;
import fr.m2i.formation.service.exception.ProductException;

public class ProductManagerImpl implements IProductManager {

	private final String SQL_SELECT_ALL_PRODUCT = " SELECT id,name,selling_price,image_URL,description"
			+ " FROM `product`";
	private final String SQL_SELECT_BY_ID_PRODUCT = SQL_SELECT_ALL_PRODUCT + " WHERE ID = ?";
	private final String SQL_DELETE_PRODUCT_BY_ID = " DELETE FROM product WHERE id = ?;";
	private final String SQL_INSERT_INTO_PRODUCT = " INSERT INTO "
			+ "`product`( `name`, `selling_price`,`image_URL`,`description`) " + " VALUES (?,?,?,?)";
	private final String SQL_SELECT_COMPONENTS_BY_PRODUCT_ID = " SELECT product_id,component_id,quantity "
			+ " FROM product_has_component" + " WHERE product_id = ?";
	private final String SQL_SELECT_JOIN_COMPONENTS_BY_PRODUCT_ID = " SELECT p.name as nameProdcut,"
			+ " c.name as nameComponent,c.supplier,c.value,c.unit,c.libelle," + " phc.quantity,phc.component_id  "
			+ " FROM product_has_component phc,component c,product p " + " WHERE (phc.component_id = c.id) "
			+ " AND (p.id = phc.product_id) " + " AND( p.id =?)";

	private void insertProduct(Product p) throws Exception {
		if (p != null) {
			PreparedStatement prep1 = null;
			Connection mysqlConnection = null;
			mysqlConnection = JdbcZero.getProductBase();
			ResultSet rs = null;
			try {
				prep1 = mysqlConnection.prepareStatement(SQL_INSERT_INTO_PRODUCT, Statement.RETURN_GENERATED_KEYS);
				prep1.setString(1, p.getName());
				prep1.setDouble(2, p.getSellingPrice());
				prep1.setString(3, p.getPathImg());
				prep1.setString(4, p.getDescription());
				prep1.executeUpdate();
				// recupere le id autogenere par le base
				rs = prep1.getGeneratedKeys();
				rs.next();
				// maj l object ajouter
				p.setId(rs.getInt(1));

			} finally {
				if (mysqlConnection != null)
					mysqlConnection.close();
			}
		}
	}

	public void createProduct(Product newProduct) {
		if (newProduct != null) {

			try {
				doCheckProduct(newProduct);
				insertProduct(newProduct);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private void doChekcValue(String name,String value )throws ProductException
	{
		if ((value == null) || value.isEmpty()) {
			throw new ProductException( name +"vide");
		}
	}
	private void doChekcValueName(String value )throws ProductException
	{
		doChekcValue("name",value);
	}
	
	private void doChekcValueDescription(String value )throws ProductException
	{
		doChekcValue("Description",value);
	}
	
	private void doChekcValueUrlImg(String value )throws ProductException
	{
		doChekcValue("UrlImage",value);
	}
	

	private void doCheckProduct(Product newProduct) throws ProductException {

		if (newProduct == null)
			throw new ProductException("Produit null");

		doChekcValueName( newProduct.getName());
		
		double price = newProduct.getSellingPrice();

		if (Double.compare(price, 0) < 0) {
			throw new ProductException("prix negatif");
		}
		
		doChekcValueDescription(newProduct.getDescription());
		
		doChekcValueUrlImg(newProduct.getPathImg());		
	}

	private void doDeleteProduct(int id) throws SQLException {

		PreparedStatement prep1 = null;
		Connection mysqlConnection = null;
		mysqlConnection = JdbcZero.getProductBase();
		try {
			prep1 = mysqlConnection.prepareStatement(SQL_DELETE_PRODUCT_BY_ID);
			prep1.setInt(1, id);
			prep1.executeUpdate();
		} finally {
			if (mysqlConnection != null)
				mysqlConnection.close();
		}
	}

	@Override
	public void deleteProduct(int id) {
		if (id >= 0) {
			try {
				doDeleteProduct(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public Product updateProduct(int id, double price) {
		return null;
	}

	private ArrayList<Component> doGetProductComponents(int id) {
		Connection mysqlConnection = null;
		ArrayList<Component> components = null;
		PreparedStatement prep1 = null;
		Component componentItem = null;
		int idItem = -1;
		try {
			try {
				mysqlConnection = JdbcZero.getProductBase();
				prep1 = (PreparedStatement) mysqlConnection.prepareStatement(SQL_SELECT_JOIN_COMPONENTS_BY_PRODUCT_ID);

				prep1.setInt(1, id);
				ResultSet rs = prep1.executeQuery();

				components = new ArrayList<Component>();
				while (rs.next()) {
					componentItem = new Component();
					idItem = rs.getInt("component_id");
					componentItem.setId(idItem);
					componentItem.setName(rs.getString("nameComponent"));
					componentItem.setSupplier(rs.getString("supplier"));
					componentItem.setUnit(rs.getString("unit"));
					componentItem.setValue(rs.getDouble("value"));
					componentItem.setLibelle(rs.getString("libelle"));

					components.add(componentItem);
				}
			} finally {
				if (mysqlConnection != null)
					mysqlConnection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return components;
	}

	@Override
	public ArrayList<Product> getProducts() {

		ArrayList<Product> results = null;
		PreparedStatement prep1 = null;
		Connection mysqlConnection = null;
		ArrayList<Component> components = null;
		Product productItem;
		int idItem = -1;
		try {
			try {
				mysqlConnection = JdbcZero.getProductBase();
				prep1 = (PreparedStatement) mysqlConnection.prepareStatement(SQL_SELECT_ALL_PRODUCT);

				ResultSet rs = prep1.executeQuery();
				results = new ArrayList<Product>();
				while (rs.next()) {
					productItem = new Product();
					idItem = rs.getInt("id");
					productItem.setId(idItem);

					productItem.setName(rs.getString("name"));
					productItem.setSellingPrice(rs.getDouble("selling_price"));
					productItem.setPathImg(rs.getString("image_URL"));
					productItem.setDescription(rs.getString("description"));
					components = doGetProductComponents(idItem);
					productItem.setComponents(components);
					results.add(productItem);
				}

			} finally {
				if (mysqlConnection != null)
					mysqlConnection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}

	@Override
	public Product getProduct(int id) {
		Product itemProduct = null;
		PreparedStatement prep1 = null;
		Connection mysqlConnection = null;
		int idItem = -1;
		try {
			try {
				mysqlConnection = JdbcZero.getProductBase();
				prep1 = (PreparedStatement) mysqlConnection.prepareStatement(SQL_SELECT_BY_ID_PRODUCT);
				prep1.setInt(1, id);
				ResultSet rs = prep1.executeQuery();
				while (rs.next()) {
					itemProduct = new Product();
					idItem = rs.getInt("id");
					itemProduct.setId(idItem);
					itemProduct.setName(rs.getString("name"));
					itemProduct.setSellingPrice(rs.getDouble("selling_price"));
					itemProduct.setPathImg(rs.getString("image_URL"));
					itemProduct.setDescription(rs.getString("description"));
					itemProduct.setComponents(doGetProductComponents(idItem));
				}
			} finally {
				if (mysqlConnection != null)
					mysqlConnection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return itemProduct;
	}
}
