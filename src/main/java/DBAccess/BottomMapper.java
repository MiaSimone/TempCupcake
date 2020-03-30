package DBAccess;

import FunctionLayer.Bottom;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BottomMapper {

    public static ArrayList<Bottom> getBottom() {

        ArrayList<Bottom> bottomList = new ArrayList<>();
        Connector myConnector = new Connector();

        try {
            myConnector.getConnector();
            String SQL = "SELECT * FROM bottoms";
            PreparedStatement ps = myConnector.getConnector().prepareStatement( SQL );
            ResultSet rs = ps.executeQuery();
            while ( rs.next() ) {

                int bottomID = rs.getInt( "BottomID" );
                String name = rs.getString( "Name" );
                double price = rs.getDouble("Price");
                bottomList.add(new Bottom(bottomID, name, price));
            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            System.out.println(ex.getMessage());
        }
        return bottomList;
    }

}
