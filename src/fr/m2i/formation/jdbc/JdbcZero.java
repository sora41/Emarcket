package fr.m2i.formation.jdbc;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.PreparedStatement;

public class JdbcZero {
	public static void requeteSimple(Connection connection) {
		PreparedStatement prep1;
		String SimpleRequete = "SELECT *FROM product";
		try {
			prep1 = (PreparedStatement) connection.prepareStatement(SimpleRequete);

			ResultSet rs = prep1.executeQuery();
			while (rs.next()) {
				int idProduct = rs.getInt("id");
				System.out.println("id product:" + idProduct);
				String name = rs.getString("name");
				System.out.println("product name:" + name);
				double price = rs.getDouble("selling_price");
				System.out.println("product price:" + price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void requeteNamed(Connection connection) {
		PreparedStatement prep1;
		String simpleRequete = "SELECT * FROM product";
		String namedRequete = simpleRequete + " WHERE id = ?";

		try {
			prep1 = (PreparedStatement) connection.prepareStatement(namedRequete);

			prep1.setInt(1, 1);
			ResultSet rs = prep1.executeQuery();
			while (rs.next()) {
				int idProduct = rs.getInt("id");
				System.out.println("id product:" + idProduct);
				String name = rs.getString("name");
				System.out.println("product name:" + name);
				double price = rs.getDouble("selling_price");
				System.out.println("product price:" + price);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static Connection getConnection(String dbName,String login,String pwd) {
		Connection Result = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
		}

		try {
			Result = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, login, pwd);

		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
		}

		return Result;
	}
	
	public static Connection getProductBase()
	{
		String login = "root";
		String pwd = "root";
		String nameDb = "imarcket";
		Connection connection = null;
	
		connection =  getConnection(nameDb,login,pwd);
		
		return connection;
	}
	
	private static Connection getConnexionContext()
	{
		Connection connection = null;
		DataSource ds;
		InitialContext  ctx ;
		try {
		ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:com/env/jdbc/imarcketdb");
		connection = ds.getConnection();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static void main(String[] argv) {

		System.out.println("-------- MySQL JDBC Connection Testing ------------");
		String login = "root";
		String pwd = "root";
		String nameDb = "imarcket";
		

		System.out.println("MySQL JDBC Driver Registered!");
		Connection connection =  getConnection(nameDb,login,pwd);
		if (connection != null) {
			System.out.println("You made it, take control your database now!");
			// requeteSimple(connection);
			requeteSimple(connection);
		} else {
			System.out.println("Failed to make connection!");
		}
	}

}
