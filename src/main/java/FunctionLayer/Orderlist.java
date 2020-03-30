package FunctionLayer;

import java.util.ArrayList;

public class Orderlist {

    ArrayList<OrderItem> orderlist = new ArrayList<>();
    private int quantity = 0;

    public Orderlist() {
        this.quantity = 0;
    }

    /**
     * @author Rasmus
     * @param orderItem er den cupcake der er blevet tilføjet til kurven
     */
    public void addOrderItem(OrderItem orderItem) {
        orderlist.add(orderItem);
        quantity++;
    }

    public void emptyKurv() {
        orderlist.clear();
        this.quantity = 0;
    }

    /**
     * @author Rasmus
     * @return metoden returnerer den totale pris for hele ordren, alle cupcakesne
     */
    public double getTotalSum() {
        double sum = 0.0;
        for (OrderItem orderItem : orderlist) {
            sum += orderItem.getOrderlinePrice();
        }
        return sum;
    }


    public ArrayList<OrderItem> getOrderlist() {
        return orderlist;
    }

    public void setOrderlist(ArrayList<OrderItem> orderlist) {
        this.orderlist = orderlist;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
