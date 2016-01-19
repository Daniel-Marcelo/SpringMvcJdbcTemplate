package mckee.daniel.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import mckee.daniel.dao.StockDAO;
import mckee.daniel.dao.UserDAO;
import mckee.daniel.model.Stock;
import mckee.daniel.model.User;
import yahoofinance.YahooFinance;
import yahoofinance.histquotes.HistoricalQuote;
import yahoofinance.histquotes.Interval;

/**
 * This controller routes accesses to the application to the appropriate
 * hanlder methods. 
 * @author www.codejava.net
 *
 */
@Controller
public class HomeController {

	@Autowired
	private StockDAO stockDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value="/") //TEST COMMENT
	public ModelAndView listContact(ModelAndView model) throws IOException{
    	
		
		List<Stock> listContact = stockDAO.list();
		model.addObject("listContact", listContact);
		model.setViewName("home");
		
		return model;
	}
	
	@RequestMapping(value = "/newContact", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Stock newContact = new Stock();
		model.addObject("contact", newContact);
		model.setViewName("ContactForm");
		return model;
	}
	
	@RequestMapping(value = "/checkingIfUserExists", method = RequestMethod.POST)
	public ModelAndView checkUser(@ModelAttribute User newUser) {
		//userDAO.saveNewUser(newUser);
		int count = userDAO.doesUserExist(newUser);
		System.out.println("COUNT = "+count);
		
		if(count == 0){
			ModelAndView model = new ModelAndView();
			model.addObject("newLogin", new User());
			
			model.setViewName("LoginForm");
			return model;
		}
		else
			return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView newUser(ModelAndView model) {

		
		User newUser = new User();
		model.addObject("newReg", newUser);
		model.setViewName("RegistrationForm");
		return model;
	}
	
	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public ModelAndView displayCharts(ModelAndView model) {

		
		model.setViewName("charts");
		return model;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView userLogin(ModelAndView model) {
		
		
		yahoofinance.Stock stock = YahooFinance.get("AAPL");
		BigDecimal price = stock.getQuote().getPrice();
		//System.out.println("STOCK PRICE: "+ price);
		
		Calendar from = Calendar.getInstance();
		Calendar to = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy MMM dd HH:mm:ss");	
		from.add(Calendar.YEAR, -1); // from 5 years ago
		System.out.println("FROM: "+sdf.format(from.getTime()));


		System.out.println("TO: "+sdf.format(to.getTime()));




		 
		yahoofinance.Stock google = YahooFinance.get("GOOG", from, to,Interval.DAILY);
		google.print();
		
		List<HistoricalQuote> googleHistQuotes = google.getHistory();
		System.out.println("Size of list: "+googleHistQuotes.size());
		
		
		for(HistoricalQuote q: googleHistQuotes){
			System.out.println("Quote: "+q.toString());

			
		}

			
		
		User newUser = new User();
		model.addObject("newLogin", newUser);
		model.setViewName("LoginForm");
		return model;
	}
	
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User newUser) {
		userDAO.saveNewUser(newUser);		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/saveContact", method = RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute Stock contact) {
		stockDAO.save(contact);		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
	public ModelAndView deleteContact(HttpServletRequest request) {
		int contactId = Integer.parseInt(request.getParameter("id"));
		stockDAO.delete(contactId);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/editContact", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
		String contactId = request.getParameter("CompanyName");
		Stock contact = stockDAO.get(contactId);
		ModelAndView model = new ModelAndView("ContactForm");
		model.addObject("contact", contact);
		
		return model;
	}
	
	@RequestMapping(value = "StockPrice/{value}", method = RequestMethod.GET)
	public @ResponseBody String getStockPrice(@PathVariable String value){
		
		Stock stock = new Stock();
		Gson gson = new Gson();
		stock = stockDAO.get(value);
		String json = gson.toJson(stock);
		System.out.println(json);
		return json;
		
		
	}
	

    @RequestMapping(value = "checkIfEmailAlreadyUsed/{uemail:.+}", method = RequestMethod.GET)
 //   @ResponseStatus(HttpStatus.OK)
    public @ResponseBody String getEmailsOfRegisteredUsers(@PathVariable String uemail) {
 
    //	uemail = uemail+".com";
    	System.out.println("1 - Checking email: "+ uemail);	
    	int count = userDAO.isEmailAlreadyInUse(uemail);
    	//System.out.println("Checking email: "+ uemail);	
    	System.out.println("IN HERE NOW - count = "+count);
    	
		Gson gson = new Gson();
		String json = gson.toJson(count);
		return json;

       // return count;
    }
{
		

}
}
