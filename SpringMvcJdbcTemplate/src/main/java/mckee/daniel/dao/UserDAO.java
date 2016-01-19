package mckee.daniel.dao;

import java.util.List;

import mckee.daniel.model.User;

public interface UserDAO {

	public void saveNewUser(User user);
	public int doesUserExist(User user);
	public int isEmailAlreadyInUse(String email);

}
