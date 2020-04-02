package PresentationLayer;

import DBAccess.OrderMapper;
import FunctionLayer.LoginSampleException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SletOrdre extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {
        // Slet ordre:
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        request.setAttribute("orderID", orderID);

        OrderMapper.deleteOrder(orderID);
        OrderMapper.deleteOrderDetails(orderID);

        request.setAttribute("messageOrdre", "Ordre slettet");

        return "employeepage";
    }
}
