package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrepararProfessorComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.getRequestDispatcher("cadastroProfessor.jsp").forward(request, response);
    }
}
