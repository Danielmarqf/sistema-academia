package command;

import dao.ProfessorDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcluirProfessorComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idStr = request.getParameter("idProfessor");

        if (idStr != null && !idStr.isEmpty()) {
            Long id = Long.parseLong(idStr);

            new ProfessorDAO().excluir(id);
        }

        response.sendRedirect("sistema?acao=listarProfessores");
    }
}
