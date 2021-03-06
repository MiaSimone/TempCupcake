package PresentationLayer;

import FunctionLayer.LoginSampleException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

abstract class Command {

    private static HashMap<String, Command> commands;

    private static void initCommands() {
        commands = new HashMap<>();
        commands.put( "login", new Login() );
        commands.put( "registrer", new Registrer() );
        commands.put("redirect", new Redirect());
        commands.put("bestilling", new Bestilling());
        commands.put("kurv", new Kurv());
        commands.put("insertAmount", new InsertAmount());
        commands.put("sletOrdre", new SletOrdre());
        commands.put("fjernOrdre", new FjernOrdreFraKurv());
    }

    static Command from( HttpServletRequest request ) {
        String TagetName = request.getParameter( "target" );
        if ( commands == null ) {
            initCommands();
        }
        return commands.getOrDefault(TagetName, new UnknownCommand() );   // unknowncommand er default.
    }

    abstract String execute( HttpServletRequest request, HttpServletResponse response )
            throws Exception;

}
