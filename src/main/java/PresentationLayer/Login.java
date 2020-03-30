package PresentationLayer;

import FunctionLayer.LogicFacade;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Orderlist;
import FunctionLayer.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 The purpose of Login is to...

 @author kasper
 */
public class Login extends Command {

    @Override
    String execute( HttpServletRequest request, HttpServletResponse response ) throws LoginSampleException {
        String email = request.getParameter( "email" );
        String password = request.getParameter( "password" );
        User user = LogicFacade.login( email, password );

        HttpSession session = request.getSession();
        Orderlist kurv = (Orderlist) session.getAttribute("kurv");
        if (kurv == null) {
            kurv = new Orderlist();
        }

        session.setAttribute("kurv", kurv);
        session.setAttribute( "user", user);
        session.setAttribute( "role", user.getRole());
        session.setAttribute("email", email);  // ellers skal man skrive  user.email på jsp siderne og det er sgu lidt mærkeligt at man har adgang til private felter. Men måske er det meget fedt , jeg ved det ikke
        session.setAttribute("balance", user.getBalance());
        session.setAttribute("navn", user.getName());

        return user.getRole() + "page";
    }

}
