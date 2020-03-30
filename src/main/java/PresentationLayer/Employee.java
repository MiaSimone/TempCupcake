package PresentationLayer;

import DBAccess.UserMapper;
import FunctionLayer.LogicFacade;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Orderlist;
import FunctionLayer.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Employee extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        double amount = Double.parseDouble(request.getParameter("amount"));

        User user = UserMapper.findUser(email);

        double currentBalance = user.getBalance();
        double newBalance = currentBalance-amount;
        
        UserMapper.updateBalance(newBalance, user.getEmail());
        user.setBalance(newBalance);
        session.setAttribute("balance", newBalance);

        return "employeepage";
    }
}
