package command;

import dao.ProfessorDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrepararTreinoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("listaProfessores", new ProfessorDAO().listarTodos());

        String idAluno = request.getParameter("idAluno");
        request.setAttribute("idAluno", idAluno);

        request.getRequestDispatcher("cadastroTreino.jsp").forward(request, response);
    }
}
