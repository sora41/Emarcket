package fr.m2i.formation.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.m2i.formation.Dto.Commerciale;
import fr.m2i.formation.Dto.Internaute;
import fr.m2i.formation.Dto.User;
import fr.m2i.formation.jdbc.JdbcZero;
import fr.m2i.formation.service.IUserManager;

public class UserManagerImpl implements IUserManager {

	private final String SQL_AUTHENTICATE = " SELECT uhg.group_id FROM user_has_group uhg " + " JOIN emarket_user eu "
			+ " ON (eu.login= uhg.login) " + " WHERE ((eu.login = ? ) " + " AND (eu.password = ?))";
	private final String SQL_GET_GROUP_BY_LOGIN = " SELECT group_id FROM user_has_group " + " WHERE login = ? ";

	private String getUserGroup(String login, Connection mysqlConnection) throws SQLException {
		String result = "";
		// String sql_GetGroup = "SELECT group_id from user_has_group where
		// login = ? ";
		PreparedStatement preStatement = null;
		preStatement = (PreparedStatement) mysqlConnection.prepareStatement(SQL_GET_GROUP_BY_LOGIN);
		preStatement.setString(1, login);
		ResultSet rs = preStatement.executeQuery();
		while (rs.next()) {
			result = rs.getString("group_id");
		}
		return result;
	}

	private User doCheckAutenticate(String login, String pwd, Connection mysqlConnection) throws SQLException {
		User result = null;
		PreparedStatement preStatement = null;
		// String sql_checkUser = "SELECT login,password from emarket_user where
		// login = ?";

		preStatement = (PreparedStatement) mysqlConnection.prepareStatement(SQL_AUTHENTICATE);
		preStatement.setString(1, login);
		preStatement.setString(2, pwd);
		ResultSet rs = preStatement.executeQuery();
		while (rs.next()) {
			String group = rs.getString("group_id");
			// getUserGroup(login, mysqlConnection);
			switch (group) {
			case "admins":
				result = new Commerciale();
				break;
			case "webusers":
				result = new Internaute();
				break;
			}
			result.setLogin(login);
			result.setPwd(pwd);
		}
		return result;
	}

	@Override
	public User authenticate(String login, String pwd) {
		User result = null;
		Connection mysqlConnection = null;
		if ((login != null) && (pwd != null))
			if ((!login.isEmpty()) && (!pwd.isEmpty()))
				try {
					try {
						mysqlConnection = JdbcZero.getProductBase();
						result = doCheckAutenticate(login, pwd, mysqlConnection);
					} finally {
						if (mysqlConnection != null)
							mysqlConnection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}

		return result;
	}

}
