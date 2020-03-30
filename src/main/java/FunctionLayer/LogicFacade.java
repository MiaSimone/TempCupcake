package FunctionLayer;

import DBAccess.UserMapper;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * The purpose of LogicFacade is to...
 * @author kasper
 */
public class LogicFacade {

    public static User login( String email, String password ) throws LoginSampleException {
        return UserMapper.login( email, password );
    } 

    public static User createUser( String name, String email, String password ) throws LoginSampleException {
        User user = new User(name, email, password, "customer", 500);
        UserMapper.createUser( user );
        return user;
    }

    public static ArrayList<User> getAllCustomers() throws LoginSampleException, SQLException, ClassNotFoundException {
        return UserMapper.customerList();
    }
}
