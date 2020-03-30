package FunctionLayer;

public class Topping {

    /**
     * @author Andreas
     */

    private int id; // just used to demo retrieval of autogen keys in UserMapper
    private String name;
    private double toppingPrice;

    public Topping(String name, double toppingPrice) {
        this.name = name;
        this.toppingPrice = toppingPrice;
    }

    public Topping(int id, String name, double toppingPrice) {
        this.id = id;
        this.name = name;
        this.toppingPrice = toppingPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getToppingPrice() {
        return toppingPrice;
    }

    public void setToppingPrice(double toppingPrice) {
        this.toppingPrice = toppingPrice;
    }

    @Override
    public String toString() {
        return name + " (" +toppingPrice + " kr)" + "\n";
    }
}
