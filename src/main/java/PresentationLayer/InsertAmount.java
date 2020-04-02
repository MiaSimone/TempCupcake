package PresentationLayer;

import DBAccess.BottomMapper;
import DBAccess.OrderMapper;
import DBAccess.ToppingMapper;
import DBAccess.UserMapper;
import FunctionLayer.*;
import UtilClass.Initializer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertAmount extends Command {
    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws InsertAmountException {

        HttpSession session = request.getSession();

// Indsæt beløb:
        String email = request.getParameter("email");
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Finder balancen på den givne kunde:
        double balance = UserMapper.findUser(email);

        double newBalance = balance+amount;

        if (UserMapper.findUser(email) != 0){
            UserMapper.updateBalance(newBalance, email);
            session.setAttribute("balance", newBalance);

            request.setAttribute("status", "ok");
            request.setAttribute("message", "Pengene er nu sat ind på kundens konto.");
        }
        if (amount<=0){
            request.setAttribute("status", "error");
            request.setAttribute("message", "Beløbet må ikke være negativt.");
        }

        return "employeepage";
    }

}
