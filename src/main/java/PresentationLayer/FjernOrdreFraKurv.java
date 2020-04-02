package PresentationLayer;

import FunctionLayer.LoginSampleException;
import FunctionLayer.OrderDetails;
import FunctionLayer.OrderItem;
import FunctionLayer.Orderlist;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FjernOrdreFraKurv extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response)  {
        HttpSession session = request.getSession();
        Orderlist kurv = (Orderlist) session.getAttribute("kurv");

        OrderItem orderItem = Bestilling.orderItem;

        kurv.fjernOrdre(orderItem);

        return "kurv";
    }
}
