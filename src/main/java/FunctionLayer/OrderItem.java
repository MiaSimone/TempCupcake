package FunctionLayer;

public class OrderItem{


    /**
     * @author Mia
     */

    private int orderID ;
    private Topping topping;
    private Bottom bottom;
    private int antal;
    private double cupcakePrice;

    private double orderPrice;

    public double getCupcakePrice(){
        cupcakePrice = (topping.getToppingPrice() + bottom.getBottomPrice());
        return cupcakePrice;
    }

    public double getOrderPrice() {
        orderPrice = cupcakePrice*antal;
        return orderPrice;
    }

    public OrderItem(Topping topping, Bottom bottom, int antal) {
        this.topping = topping;
        this.bottom = bottom;
        this.antal = antal;
        getOrderPrice();
    }


    public Topping getTopping() {
        return topping;
    }

    public void setTopping(Topping topping) {
        this.topping = topping;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public void setBottom(Bottom bottom) {
        this.bottom = bottom;
    }

    public int getAntal() {
        return antal;
    }

    public int getOrderID() {
        return orderID;
    }

    @Override
    public String toString() {
        return bottom.getName() + " bund med " + topping.getName() + " topping. " + antal + " stk.";
    }
}
