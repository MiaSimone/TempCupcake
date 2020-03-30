package DBAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 @author Mia
 */
public class Connector {

    public Connection getConnector() throws ClassNotFoundException, SQLException {
        Connection connector = null;
        String url = "jdbc:mysql://localhost:3306/tempcupcakes?serverTimezone=UTC&allowPublicKeyRetrieval=" +
                "true&useSSL=false";
        String user = "root";
        String password = "Kat4Kanin5Hund1Hamster1";
        Class.forName("com.mysql.cj.jdbc.Driver");
        connector = DriverManager.getConnection(url,user,password);

        return connector;
    }

}
