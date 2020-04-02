package PresentationLayer;

import DBAccess.BottomMapper;
import DBAccess.ToppingMapper;
import FunctionLayer.*;
import UtilClass.Initializer;
import com.sun.org.apache.xpath.internal.operations.Or;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Bestilling extends Command {

    static OrderItem orderItem = null;
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        ArrayList<Bottom> bottoms = BottomMapper.getBottom();
        ArrayList<Topping> toppings = ToppingMapper.getTopping();

        request.setAttribute("toppings", Initializer.getToppingList());
        request.setAttribute("bottoms", Initializer.getBottomList());


        // Vi får "kurv" fra login
        Orderlist orderlist = (Orderlist) session.getAttribute("kurv");
        /*
        double finalPrice = orderlist.getTotalSum();
        System.out.println("finalprice before: " + finalPrice);

        request.setAttribute("finalPrice", orderlist.getTotalSum());
        System.out.println(orderlist.getTotalSum());
*/
        String antal = request.getParameter("quantity");
        String bottom = request.getParameter("bund");
        String topping = request.getParameter("top");

        if (antal == null || bottom == null || topping == null) {
            request.setAttribute("status", "error");
            request.setAttribute("message",
                    String.format("Du mangler at vælge bund, top eller antal!",
                            bottom, topping, antal));
        } else {
            int quantity = Integer.parseInt(antal);

            int topID = getTopping(toppings, topping).getId();
            double topPrice = getTopping(toppings, topping).getToppingPrice();
                session.setAttribute("topID", topID);
                session.setAttribute("toppingName", topping);
                session.setAttribute("topPrice", topPrice);

            int botID = getBottom(bottoms, bottom).getId();
            double botPrice = getBottom(bottoms, bottom).getBottomPrice();
                session.setAttribute("botID", botID);
                session.setAttribute("bottomName", bottom);
                session.setAttribute("botPrice", botPrice);

            orderItem = new OrderItem(getTopping(toppings, topping), getBottom(bottoms, bottom), quantity);
         // tilføjer ordren til kurve listen:
            orderlist.addOrderItem(orderItem);

            //System.out.println("finalprice after: " + finalPrice);

            request.setAttribute("status", "ok");
            request.setAttribute("message",
                    String.format("Bund: %s, Topping: %s, Antal: %d er nu lagt i kurven",
                            bottom, topping, quantity));

            request.setAttribute("orderItem", orderItem);
        }
        return "bestilling";
    }

    public static Bottom getBottom(ArrayList<Bottom> bottoms, String bottom) {
        for (Bottom b: bottoms) {
            if(bottom.contains(b.getName())) {
                Bottom bot = new Bottom(b.getId(), b.getName(), b.getBottomPrice());
                return bot;
            }
        }
        return null;
    }

    public static Topping getTopping(ArrayList<Topping> toppings, String topping) {
        for (Topping t: toppings) {
            if(topping.contains(t.getName())) {
                Topping top = new Topping(t.getId(), t.getName(), t.getToppingPrice());
                return top;
            }
        }
        return null;
    }


}
