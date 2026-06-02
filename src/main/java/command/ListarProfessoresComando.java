package command;

import dao.ProfessorDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarProfessoresComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ProfessorDAO dao = new ProfessorDAO();
        request.setAttribute("listaProfessores", dao.listarTodos());
        request.getRequestDispatcher("listaProfessores.jsp").forward(request, response);
    }
}
