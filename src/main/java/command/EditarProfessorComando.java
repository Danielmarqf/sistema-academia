package command;

import dao.ProfessorDAO;
import model.Professor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditarProfessorComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idStr = request.getParameter("idProfessor");
        if (idStr != null) {
            Long id = Long.parseLong(idStr);
            Professor prof = new ProfessorDAO().buscarPorId(id);
            request.setAttribute("professor", prof);
            request.getRequestDispatcher("editarProfessor.jsp").forward(request, response);
        }
    }
}
