package DBAccess;

import FunctionLayer.Topping;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ToppingMapper {

    public static ArrayList<Topping> getTopping() {

        ArrayList<Topping> toppingList = new ArrayList<>();
        Connector myConnector = new Connector();

        try {
            myConnector.getConnector();
            String SQL = "SELECT * FROM toppings";
            PreparedStatement ps = myConnector.getConnector().prepareStatement( SQL );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {

                int toppingID = rs.getInt( "ToppingID" );
                String name = rs.getString( "Name" );
                double price = rs.getDouble("Price");
                toppingList.add(new Topping(toppingID, name, price));
            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            System.out.println(ex.getMessage());
        }
        return toppingList;
    }

}
