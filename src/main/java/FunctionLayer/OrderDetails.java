package FunctionLayer;

import java.sql.Date;
import java.time.LocalDate;

public class OrderDetails {

    private int id;
    private int orderID;

    private LocalDate localDate;
    private Date date;

    private String email;
    private int toppingID;
    private String toppingName;
    private double toppingPrice;
    private int bottomID;
    private String bottomName;
    private double bottomPrice;
    private int quantity;
    private double sum;
// date date
    public OrderDetails(int orderID, Date date, String email, int toppingID, String toppingName,
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
// Localdate
    public OrderDetails(int orderID, LocalDate localDate, String email, int toppingID, String toppingName,
                        double toppingPrice, int bottomID, String bottomName, double bottomPrice, int quantity, double sum) {
        this.orderID = orderID;
        this.localDate = localDate;
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


    public LocalDate getLocalDate() {
        return localDate;
    }

    public void setLocalDate(LocalDate localDate) {
        this.localDate = localDate;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
