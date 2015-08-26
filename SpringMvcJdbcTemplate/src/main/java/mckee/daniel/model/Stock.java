package mckee.daniel.model;

public class Stock {

private String CompanyName;
private String Ticker;

	public Stock() {
	}

	public Stock(String companyName, String ticker) {
		this.CompanyName = companyName;
		this.Ticker = ticker;

	}

	public String getCompanyName() {
		return CompanyName;
	}

	public void setCompanyName(String companyName) {
		this.CompanyName = companyName;
	}

	public String getTicker() {
		return Ticker;
	}

	public void setTicker(String ticker) {
		this.Ticker = ticker;
	}

}
