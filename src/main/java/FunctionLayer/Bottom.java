package FunctionLayer;

public class Bottom {

    /**
     * @author Emilie
     */

    private int id; // just used to demo retrieval of autogen keys in UserMapper
    private String name;
    private double bottomPrice;


    public Bottom(int id, String name, double bottomPrice) {
        this.id = id;
        this.name = name;
        this.bottomPrice = bottomPrice;
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

    public double getBottomPrice() {
        return bottomPrice;
    }

    public void setBottomPrice(double bottomPrice) {
        this.bottomPrice = bottomPrice;
    }

    @Override
    public String toString() {
        return name + " (" + bottomPrice + " kr)" + "\n";
    }
}
