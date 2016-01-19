package mckee.daniel.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import mckee.daniel.model.User;

public class UserDAOImpl implements UserDAO{
	
	private JdbcTemplate jdbcTemplate;

	
	public UserDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	@Override
	public void saveNewUser(User user) {
		String sql = "INSERT INTO User (name, email, password, country) VALUES(?,?,?,?)";
		jdbcTemplate.update(sql, user.getName(), user.getEmail(), user.getPassword(), user.getCountry());		
	}
	@Override
	public int doesUserExist(User user) {

		String sql = "SELECT count(*) FROM User WHERE email = ? AND password = ?";
		int count = jdbcTemplate.queryForObject(sql, new Object[]{user.getEmail(), user.getPassword()},Integer.class );

		return count;
	}
	@Override
	public int isEmailAlreadyInUse(String email) {

		String sql = "SELECT count(*) FROM User WHERE email = ?";
		int count = jdbcTemplate.queryForObject(sql, new Object[]{email},Integer.class );

		return count;
	}
	


}
