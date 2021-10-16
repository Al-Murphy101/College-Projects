import java.util.ArrayList;
import java.util.List;


public class LettingCompany {
	
	private String name;
    private List<Property> properties = new ArrayList<>();


    public LettingCompany(String name) {
        this.name = name;
	}

	public void addProperty(Property property) {
            properties.add(property);
	}

	
	public double computeTotalMonthlyRent() {
        double computeRent = 0;
		for(int i = 0; i < properties.size(); i++){
            computeRent += properties.get(i).computeMonthlyRent();
            
        }
		return computeRent;
	}

    public String toString(){
        return "Letting Company name is: " + name;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}