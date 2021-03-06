package DBAccess;

import FunctionLayer.InsertAmountException;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Topping;
import FunctionLayer.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 The purpose of UserMapper is to...

 @author kasper
 */
public class UserMapper {

// Registrer:
    public static void createUser(User user) throws LoginSampleException {
        try {
            Connector con = new Connector();
            String SQL = "INSERT INTO users (name, email, password, role, balance) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.getConnector().prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            ps.setDouble(5, user.getBalance());
            ps.executeUpdate();
            ResultSet ids = ps.getGeneratedKeys();
            ids.next();
            int id = ids.getInt(1);
            user.setUserID(id);
        } catch (SQLException | ClassNotFoundException ex) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

// Login
    public static User login(String email, String password) throws LoginSampleException {
        try {
            Connector con = new Connector();
            String SQL = "SELECT UserID, Name, Role, Balance FROM users "
                    + "WHERE Email=? AND Password=?";
            PreparedStatement ps = con.getConnector().prepareStatement(SQL);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String name = rs.getString("Name");
                String role = rs.getString("Role");
                double balance = rs.getDouble("Balance");
                int id = rs.getInt("UserID");
                User user = new User(name, email, password, role, balance);
                user.setUserID(id);
                return user;
            } else {
                throw new LoginSampleException("Kunne ikke finde brugeren.");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw new LoginSampleException(ex.getMessage());
        }
    }

    public static void updateBalance(double amount, String email) {

        String SQL = "UPDATE users SET Balance = ? WHERE Email = ?";

        Connector conn = new Connector();
        try (
                PreparedStatement pstmt = conn.getConnector().prepareStatement(SQL)) {

            pstmt.setDouble(1, amount);
            pstmt.setString(2, email);

            int rowAffected = pstmt.executeUpdate();
            System.out.println(String.format("Row affected %d", rowAffected));

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static double findUser(String email) throws InsertAmountException {
        try {
            Connector con = new Connector();
            String SQL = "SELECT Balance FROM users "
                    + "WHERE Email=?";
            PreparedStatement ps = con.getConnector().prepareStatement(SQL);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double balance = rs.getDouble("Balance");
                return balance;
            } else {
                throw new InsertAmountException("Brugeren findes ikke.");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw new InsertAmountException(ex.getMessage());
        }
    }

    public static ArrayList<User> getCustomer() throws LoginSampleException {

        ArrayList<User> listOfCustomers = null;

        try {
            Connector con = new Connector();
            String SQL = "SELECT * FROM tempcupcakes.users where Role='customer'";
            PreparedStatement ps = con.getConnector().prepareStatement( SQL );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {
                if (listOfCustomers == null){
                    listOfCustomers = new ArrayList<>();
                }
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String role = rs.getString("Role");
                double balance = rs.getDouble("Balance");
                int id = rs.getInt("UserID");
                User tmpCus = new User(name, email, password, role, balance);
                tmpCus.setUserID(id);
                listOfCustomers.add(tmpCus);

            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
        return listOfCustomers;
    }


    /*
    public static ArrayList<User> customerList() throws LoginSampleException {

        ArrayList<User> listOfCustomers = null;

        try {
            Connector con = new Connector();
            String SQL = "SELECT * FROM tempcupcakes.users WHERE Role=customer";
            PreparedStatement ps = con.getConnector().prepareStatement( SQL );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {
                if (listOfCustomers == null){
                    listOfCustomers = new ArrayList<>();
                }
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String role = rs.getString("Role");
                double balance = rs.getDouble("Balance");
                int id = rs.getInt("CustomerID");
                User tmpCus = new User(name, email, password, role, balance);
                tmpCus.setUserID(id);
                listOfCustomers.add(tmpCus);

            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LoginSampleException(ex.getMessage());
        }
        return listOfCustomers;
    }
*/

}
