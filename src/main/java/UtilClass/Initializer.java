package UtilClass;



import DBAccess.BottomMapper;
import DBAccess.ToppingMapper;
import DBAccess.UserMapper;
import FunctionLayer.*;

import java.util.List;

/**
 * @author Mia
 */
public class Initializer {

    private static List<Topping> toppingList;
    private static List<Bottom> bottomList;

    public static void initToppings() {
        if (toppingList == null){
            toppingList = ToppingMapper.getTopping();
        }
    }
    public static void initBottoms() {
        if (bottomList == null){
            bottomList = BottomMapper.getBottom();
        }
    }
    public static List<Bottom> getBottomList(){
        return bottomList;
    }
    public static List<Topping> getToppingList() {
        return toppingList;
    }

    private static List<User> customerList;
    public static void initCustomers() throws LoginSampleException {
        if (customerList == null){
            customerList = UserMapper.getCustomer();
        }
    }
    public static List<User> getCustomerList(){
        return customerList;
    }
}