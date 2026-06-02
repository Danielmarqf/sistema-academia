package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getSession().invalidate(); 
        response.sendRedirect("login.jsp");
    }
}
