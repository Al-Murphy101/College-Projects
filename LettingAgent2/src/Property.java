import java.util.ArrayList;
import java.util.List;



public class Property {
	
	private String name;
    private List<Apartment> apartments = new ArrayList<>();


    public Property(String name) {

        this.name = name;
		
	}

	public double computeMonthlyRent() {
        double monthlyRent = 0;

		for(int i = 0; i < apartments.size(); i++){

            if (!apartments.get(i).getIsOccupied()){
                
                //System.out.println(apartments.get(i).getIsOccupied());
                apartments.get(i).setMonthlyRent(0);
            }
            monthlyRent += apartments.get(i).getMonthlyRent();
            
        }
		return monthlyRent;
	}


	//Add apartments to Arraylist
    public void addApartment(Apartment apartment){

        apartments.add(apartment); 

    }

    public String toString(){
        return "Property name is: " + name;
    }

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
}
