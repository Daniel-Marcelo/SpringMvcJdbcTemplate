package mckee.daniel.dao;

import java.util.List;

import mckee.daniel.model.Stock;

/**
 * Defines DAO operations for the contact model.
 * @author www.codejava.net
 *
 */
public interface StockDAO {
	
	public void save(Stock contact);
	
	public void delete(int contactId);
	
	public Stock get(String ticker);
	
	public List<Stock> list();
}
