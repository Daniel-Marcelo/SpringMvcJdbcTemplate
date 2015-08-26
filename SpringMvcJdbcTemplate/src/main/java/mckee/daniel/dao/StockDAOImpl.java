package mckee.daniel.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import mckee.daniel.model.Stock;

/**
 * An implementation of the ContactDAO interface.
 * @author www.codejava.net
 *
 */
public class StockDAOImpl implements StockDAO {

	private JdbcTemplate jdbcTemplate;
	
	public StockDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void save(Stock stock) {
			// insert
			String sql = "INSERT INTO Stock (CompanyName , Ticker) VALUES(?,?)";
			jdbcTemplate.update(sql, stock.getCompanyName(), stock.getTicker());

		
		
	}

	@Override
	public void delete(int contactId) {
		String sql = "DELETE FROM stock WHERE contact_id=?";
		jdbcTemplate.update(sql, contactId);
	}

	@Override
	public List<Stock> list() {
		String sql = "SELECT * FROM Stock";
		List<Stock> listContact = jdbcTemplate.query(sql, new RowMapper<Stock>() {

			@Override
			public Stock mapRow(ResultSet rs, int rowNum) throws SQLException {
				Stock aContact = new Stock();
	
				aContact.setCompanyName(rs.getString("CompanyName"));
				aContact.setTicker(rs.getString("Ticker"));
				
				return aContact;
			}
			
		});
		
		return listContact;
	}

	@Override
	public Stock get(String ticker) {
		String sql = "SELECT * FROM Stock WHERE Ticker='" + ticker+"'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Stock>() {

			@Override
			public Stock extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					Stock stock = new Stock();
					stock.setCompanyName(rs.getString("CompanyName"));
					stock.setTicker(rs.getString("Ticker"));
					return stock;
				}
				
				return null;
			}
			
		});
	}

}
