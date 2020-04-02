package DBAccess;

import FunctionLayer.*;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class OrderMapper {

    public static void insertOrder(Order order) {
        try {
            Connector con = new Connector();
            String SQL = "INSERT INTO tempcupcakes.orders (Email, UserID, Date) VALUES (?, ?, ?)";
            PreparedStatement ps = con.getConnector().prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, order.getEmail());
            ps.setInt(2, order.getUserID());
            ps.setDate(3, Date.valueOf(order.getSetDate()));
            ps.executeUpdate();
            ResultSet ids = ps.getGeneratedKeys();
            ids.next();
            int id = ids.getInt(1);
            order.setOrderID(id);
        } catch (SQLException | ClassNotFoundException ex) {
            try {
                throw new SQLException(ex.getMessage());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void insertOrderDetails(ArrayList<OrderItem> kurv, User user, OrderDetails orderDetails, Order order) {

        long millis=System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        try {
            Connector con = new Connector();
            String SQL = "INSERT INTO tempcupcakes.orderdetails (OrderID, Date, Email, ToppingID, Topping, " +
                    "ToppingPrice, BottomID, Bottom, BottomPrice, Quantity, Sum) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = null;
            for (OrderItem orderItem: kurv) {
                ps = con.getConnector().prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, order.getOrderID());
                ps.setDate(2, date);
                ps.setString(3, user.getEmail());
                ps.setInt(4, orderItem.getTopping().getId());
                ps.setString(5, orderItem.getTopping().getName());
                ps.setDouble(6, orderItem.getTopping().getToppingPrice());
                ps.setInt(7, orderItem.getBottom().getId());
                ps.setString(8, orderItem.getBottom().getName());
                ps.setDouble(9, orderItem.getBottom().getBottomPrice());
                ps.setInt(10, orderItem.getAntal());
                ps.setDouble(11, orderItem.getOrderPrice());
                ps.executeUpdate();

                orderDetails = new OrderDetails(orderItem.getOrderID(), date, user.getEmail(), orderItem.getTopping().getId(),
                        orderItem.getTopping().getName(), orderItem.getTopping().getToppingPrice(), orderItem.getBottom().getId(),
                        orderItem.getBottom().getName(), orderItem.getBottom().getBottomPrice(), orderItem.getAntal(),
                        orderItem.getOrderPrice());

                ResultSet ids = ps.getGeneratedKeys();
                ids.next();
                int id = ids.getInt(1);
                orderDetails.setId(id);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            try {
                throw new SQLException(ex.getMessage());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }





    public static ArrayList<Order> getOrders() throws LoginSampleException {

        ArrayList<Order> listOfOrders = null;

        try {
            Connector con = new Connector();
            String SQL = "SELECT * FROM tempcupcakes.orders";
            PreparedStatement ps = con.getConnector().prepareStatement( SQL );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {
                if (listOfOrders == null){
                    listOfOrders = new ArrayList<>();
                }
                String email = rs.getString("Email");
                int userID = rs.getInt("UserID");
                Date date = rs.getDate("Date");
                int orderID = rs.getInt("OrderID");
                Order order = new Order(email, userID, date);
                order.setOrderID(orderID);
                listOfOrders.add(order);

            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
        return listOfOrders;
    }


    public static ArrayList<OrderDetails> getOrdersDetails() throws LoginSampleException {

        ArrayList<OrderDetails> listOfOrderDetails = null;

        try {
            Connector con = new Connector();
            String SQL = "SELECT * FROM orderdetails";
            PreparedStatement ps = con.getConnector().prepareStatement( SQL );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {
                if (listOfOrderDetails == null){
                    listOfOrderDetails = new ArrayList<>();
                }

                int ID = rs.getInt("orderdetailID");
                int orderID = rs.getInt("OrderID");
                Date date = rs.getDate("Date");
                String email = rs.getString("Email");
                int toppingID = rs.getInt("ToppingID");
                String toppingName = rs.getString("Topping");
                double toppingPrice = rs.getDouble("ToppingPrice");
                int bottomID = rs.getInt("BottomID");
                String bottomName = rs.getString("Bottom");
                double bottomPrice = rs.getDouble("BottomPrice");
                int quantity = rs.getInt("Quantity");
                double sum = rs.getDouble("Sum");

                OrderDetails orderDetails = new OrderDetails(orderID, date, email, toppingID, toppingName, toppingPrice,
                        bottomID, bottomName, bottomPrice, quantity, sum);
                orderDetails.setId(ID);
                listOfOrderDetails.add(orderDetails);

            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
        return listOfOrderDetails;
    }

    public static boolean recordAdded;
    public static void deleteOrder(int orderID) throws SletOrdreException{
        Connector myConnector = new Connector();
        try {
            myConnector.getConnector();
            String sql = "delete from orders where OrderID =?";
            PreparedStatement ps = myConnector.getConnector().prepareStatement(sql);
            ps.setInt(1, orderID);
            //ps.executeUpdate();
            //ResultSet rs=ps.executeQuery();
            recordAdded = false;
            if(ps.executeUpdate() != 0){
                recordAdded = true;
            } else {
                throw new SletOrdreException("Ordren med OrdreID'et " + orderID + " findes ikke.");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw new SletOrdreException(ex.getMessage());
        }
    }

    public static void deleteOrderDetails(int orderID) {
        Connector myConnector = new Connector();

        try {
            myConnector.getConnector();
            String sql = "delete from orderdetails where OrderID =?";
            System.out.println("SQL:" + sql);
            PreparedStatement ps = myConnector.getConnector().prepareStatement(sql);
            ps.setInt(1, orderID);
            ps.executeUpdate();
            ps.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }



}
