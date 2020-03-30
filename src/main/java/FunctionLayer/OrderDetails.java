package FunctionLayer;

import java.time.LocalDate;

public class OrderDetails {

    private int id;
    private int orderID;
    private LocalDate date;
    private String email;
    private int toppingID;
    private String toppingName;
    private double toppingPrice;
    private int bottomID;
    private String bottomName;
    private double bottomPrice;
    private int quantity;
    private double sum;

    public OrderDetails(int orderID, LocalDate date, String email, int toppingID, String toppingName,
                        double toppingPrice, int bottomID, String bottomName, double bottomPrice, int quantity, double sum) {
        this.orderID = orderID;
        this.date = date;
        this.email = email;
        this.toppingID = toppingID;
        this.toppingName = toppingName;
        this.toppingPrice = toppingPrice;
        this.bottomID = bottomID;
        this.bottomName = bottomName;
        this.bottomPrice = bottomPrice;
        this.quantity = quantity;
        this.sum = sum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getToppingID() {
        return toppingID;
    }

    public void setToppingID(int toppingID) {
        this.toppingID = toppingID;
    }

    public String getToppingName() {
        return toppingName;
    }

    public void setToppingName(String toppingName) {
        this.toppingName = toppingName;
    }

    public double getToppingPrice() {
        return toppingPrice;
    }

    public void setToppingPrice(double toppingPrice) {
        this.toppingPrice = toppingPrice;
    }

    public int getBottomID() {
        return bottomID;
    }

    public void setBottomID(int bottomID) {
        this.bottomID = bottomID;
    }

    public String getBottomName() {
        return bottomName;
    }

    public void setBottomName(String bottomName) {
        this.bottomName = bottomName;
    }

    public double getBottomPrice() {
        return bottomPrice;
    }

    public void setBottomPrice(double bottomPrice) {
        this.bottomPrice = bottomPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }
}
