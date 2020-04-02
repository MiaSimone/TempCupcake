package FunctionLayer;

import java.sql.Date;
import java.time.LocalDate;

public class Order {

    private int orderID;
    private String email;
    private int userID;
    private LocalDate setDate;
    private Date getDate;

    public Order(String email, int userID, LocalDate setDate) {
        this.email = email;
        this.userID = userID;
        this.setDate = setDate;
    }

    public Order(String email, int userID, Date getDate) {
        this.email = email;
        this.userID = userID;
        this.getDate = getDate;
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

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public LocalDate getSetDate() {
        return setDate;
    }

    public void setSetDate(LocalDate setDate) {
        this.setDate = setDate;
    }

    public Date getGetDate() {
        return getDate;
    }

    public void setGetDate2(Date getDate) {
        this.getDate = getDate;
    }
}
