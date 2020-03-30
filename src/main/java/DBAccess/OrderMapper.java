package DBAccess;

import FunctionLayer.*;

import java.sql.*;

public class OrderMapper {

    public static void insertOrder(Order order) {
        try {
            Connector con = new Connector();
            String SQL = "INSERT INTO tempcupcakes.orders (Email, UserID, Date) VALUES (?, ?, ?)";
            PreparedStatement ps = con.getConnector().prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, order.getEmail());
            ps.setInt(2, order.getUserID());
            ps.setDate(3, Date.valueOf(order.getDate()));
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

    public static void insertOrderDetails(OrderDetails orderDetails) {
        try {
            Connector con = new Connector();
            String SQL = "INSERT INTO tempcupcakes.individualorders (OrderID, Date, Email, ToppingID, Topping, " +
                    "ToppingPrice, BottomID, Bottom, BottomPrice, Quantity, Sum) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.getConnector().prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, orderDetails.getOrderID());
            ps.setDate(2, Date.valueOf(orderDetails.getDate()));
            ps.setString(3, orderDetails.getEmail());
            ps.setInt(4, orderDetails.getToppingID());
            ps.setString(5, orderDetails.getToppingName());
            ps.setDouble(6, orderDetails.getToppingPrice());
            ps.setInt(7, orderDetails.getBottomID());
            ps.setString(8, orderDetails.getBottomName());
            ps.setDouble(9, orderDetails.getBottomPrice());
            ps.setInt(10, orderDetails.getQuantity());
            ps.setDouble(11, orderDetails.getSum());

            ps.executeUpdate();
            ResultSet ids = ps.getGeneratedKeys();
            ids.next();
            int id = ids.getInt(1);
            orderDetails.setId(id);
        } catch (SQLException | ClassNotFoundException ex) {
            try {
                throw new SQLException(ex.getMessage());
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



}
