package PresentationLayer;

import DBAccess.BottomMapper;
import DBAccess.ToppingMapper;
import DBAccess.UserMapper;
import FunctionLayer.*;
import UtilClass.Initializer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;

public class Employee extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LoginSampleException {

        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        double amount = Double.parseDouble(request.getParameter("amount"));

        double balance = UserMapper.findUser(email);

        double newBalance = balance+amount;

        UserMapper.updateBalance(newBalance, email);
        session.setAttribute("balance", newBalance);

        request.setAttribute("customers", Initializer.getCustomerList());

        return "employeepage";
    }

}
