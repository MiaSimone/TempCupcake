package PresentationLayer;

import DBAccess.BottomMapper;
import DBAccess.OrderMapper;
import DBAccess.ToppingMapper;
import DBAccess.UserMapper;
import FunctionLayer.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;

public class Kurv extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        Orderlist kurv = (Orderlist) session.getAttribute("kurv");
        session.setAttribute("finalPrice", kurv.getTotalSum());
        request.setAttribute("kurv", kurv.getOrderlist());

        User user = (User) session.getAttribute("user");
        Topping topping = (Topping) session.getAttribute("top");
        Bottom bottom = (Bottom) session.getAttribute("bund");

        OrderItem orderItem = (OrderItem) request.getAttribute("orderItem");

        // Trækker beløb fra saldo:
        double currentBalance = user.getBalance();
        double newBalance = currentBalance-kurv.getTotalSum();
        if (newBalance>0){

            UserMapper.buyBalance(newBalance, user.getEmail());
            user.setBalance(newBalance);
            session.setAttribute("balance", newBalance);

            // Indsætter i databasen:
            String email = user.getEmail();
            int userID = user.getUserID();
            LocalDate date = LocalDate.now();

            int quantity = Bestilling.orderItem.getQuantity();
            double sum = OrderItem.orderlinePriceCalculator();

            Order order = new Order(email, userID, date);
            OrderMapper.insertOrder(order);

                int topID = (int) session.getAttribute("topID");
                String topName = (String) session.getAttribute("toppingName");
                double topPrice = (double) session.getAttribute("topPrice");
                int botID = (int) session.getAttribute("botID");
                String botName = (String) session.getAttribute("bottomName");
                double botPrice = (double) session.getAttribute("botPrice");

            OrderDetails orderDetails = new OrderDetails(order.getOrderID(), date, email, topID,
                    topName, topPrice, botID, botName, botPrice, quantity, sum);
            OrderMapper.insertOrderDetails(orderDetails);

            // Tømmer kurven:
            kurv.emptyKurv();

        } else {
            request.setAttribute("balanceMessage", "Du har ikke nok penge til at gennemføre købet.");
        }
        return "kurv";
    }


}
