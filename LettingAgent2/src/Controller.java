public class Controller {
    public static void main(String[] args) {
        // create apartments
        Apartment a1 = new Apartment("1a");
        Apartment a2 = new Apartment("2b");
        Apartment a3 = new Apartment("3c");
        Apartment a4 = new Apartment("4d");
        Apartment a5 = new Apartment("5e");
        Apartment a6 = new Apartment("6f");
        a1.setMonthlyRent(1400);
        a2.setMonthlyRent(1500);
        a3.setMonthlyRent(1600);
        a4.setMonthlyRent(1700);
        a5.setMonthlyRent(1800);
        a6.setMonthlyRent(1900);
        a1.setOccupied(false);
        a2.setOccupied(false);
        a3.setOccupied(true);
        a4.setOccupied(true);
        a5.setOccupied(true);
        a6.setOccupied(true);

        // create properties
        Property p1 = new Property("The Ups");
        Property p2 = new Property("The Downs");
       

        // create letting company
        LettingCompany l1 = new LettingCompany("Java Properties");

        // do the links here
        p1.addApartment(a1);
        p1.addApartment(a2);
        p1.addApartment(a3);
        p2.addApartment(a4);
        p2.addApartment(a5);
        p2.addApartment(a6);

        l1.addProperty(p1);
        l1.addProperty(p2);

        
        System.out.println(a1.toString());
        System.out.println(p1.toString());
        System.out.println(l1.toString());
        System.out.println();
        System.out.println("Total Rent For: " + l1 + " is e" + l1.computeTotalMonthlyRent());
        System.out.println();
        System.out.println("Total Rent For Property: " + p1 + " is e" + p1.computeMonthlyRent());
        System.out.println();
        System.out.println("Total Rent For Property: " + p2 + " is e" + p2.computeMonthlyRent());
    

    }
}
