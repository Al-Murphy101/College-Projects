public class Apartment {

    private String aptNumber;
    private double monthlyRent;
    private boolean isOccupied;


    public Apartment(String aptNumber) {

		this.aptNumber = aptNumber;

	}

    public String toString(){
        return "\nApartment number: " + getAptNumber() + "\nMonthly Rent: " + getMonthlyRent() +
                "\nOccupied: " + getIsOccupied();
    }

	
	public String getAptNumber() {
		return aptNumber;
	}

	
	public void setAptNumber(String aptNumber) {
		this.aptNumber = aptNumber;
	}

	public double getMonthlyRent() {
		return monthlyRent;
	}

	public void setMonthlyRent(double monthlyRent) {
		this.monthlyRent = monthlyRent;
	}
	
	public boolean getIsOccupied() {
		return isOccupied;
	}

	public void setOccupied(boolean isOccupied) {
		this.isOccupied = isOccupied;
	}
	
}
    

