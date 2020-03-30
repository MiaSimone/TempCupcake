package FunctionLayer;

public class OrderItem {

    private static Topping topping;
    private static Bottom bottom;
    private static double orderlinePrice;

    private static int quantity;

    public static double orderlinePriceCalculator() {
        orderlinePrice = (topping.getToppingPrice() + bottom.getBottomPrice())*quantity;
        return orderlinePrice;
    }

    public OrderItem(Topping topping, Bottom bottom, int quantity) {
        this.topping = topping;
        this.bottom = bottom;
        this.quantity = quantity;
        orderlinePriceCalculator();
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getOrderlinePrice() {
        return orderlinePrice;
    }

    public void setOrderlinePrice(double orderlinePrice) {
        this.orderlinePrice = orderlinePrice;
    }
}
