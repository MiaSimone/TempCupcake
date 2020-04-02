package PresentationLayer;

import FunctionLayer.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class FjernOrdreFraKurv extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response)  {

        HttpSession session = request.getSession();

        Orderlist orderlist = (Orderlist) session.getAttribute("kurv");

        ArrayList<OrderItem> kurv = orderlist.getOrderlist();

        int cartIndexToRemove = Integer.parseInt(request.getParameter("removeorderline"));
        kurv.remove(cartIndexToRemove);
        session.setAttribute("kurv", orderlist);

        return "kurv";
    }

}
