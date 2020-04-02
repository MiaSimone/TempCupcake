package PresentationLayer;

import FunctionLayer.LogicFacade;
import FunctionLayer.LoginSampleException;
import FunctionLayer.Orderlist;
import FunctionLayer.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Registrer extends Command {

    @Override
    String execute( HttpServletRequest request, HttpServletResponse response ) throws LoginSampleException {

        String navn = request.getParameter( "navn" );
        String email = request.getParameter( "email" );
        String password1 = request.getParameter( "password1" );
        String password2 = request.getParameter( "password2" );
        if ( password1.equals( password2 ) ) {

            User user = LogicFacade.createUser(navn, email, password1);

            HttpSession session = request.getSession();
            Orderlist kurv = (Orderlist) session.getAttribute("kurv");
            if (kurv == null) {
                kurv = new Orderlist();
            }

            session.setAttribute("kurv", kurv);

            session.setAttribute("navn",navn);
            session.setAttribute("email",email);

            session.setAttribute("user", user);

            session.setAttribute( "role", user.getRole());

            session.setAttribute("balance", user.getBalance());
            return user.getRole() + "page";
        } else {
            throw new LoginSampleException( "De to passwords var ikke ens." );
        }
    }

}
