package PresentationLayer;


import UtilClass.Initializer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Mia
 */
public class Redirect extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) {

        String destination = request.getParameter("destination");

        if(destination.equals("bestilling")) {
            request.setAttribute("toppings", Initializer.getToppingList());
            request.setAttribute("bottoms", Initializer.getBottomList());
        }
        if(destination.equals("employee")) {
            request.setAttribute("customers", Initializer.getCustomerList());
        }

        return destination;
    }
}
