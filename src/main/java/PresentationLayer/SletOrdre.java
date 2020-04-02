package PresentationLayer;

import DBAccess.OrderMapper;
import DBAccess.UserMapper;
import FunctionLayer.LoginSampleException;
import FunctionLayer.SletOrdreException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SletOrdre extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws SletOrdreException {
        // Slet ordre:
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        request.setAttribute("orderID", orderID);

        OrderMapper.deleteOrder(orderID);
        OrderMapper.deleteOrderDetails(orderID);

        if (OrderMapper.recordAdded){
            request.setAttribute("status", "ok");
            request.setAttribute("message", "Ordren er slettet!");
        }

        return "employeepage";
    }
}
