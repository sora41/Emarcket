package fr.m2i.formation.service;

import fr.m2i.formation.Dto.User;

public interface IUserManager {

	public abstract User authenticate(String login,String pwd);
	
	
	
}
