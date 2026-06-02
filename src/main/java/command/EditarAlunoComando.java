package command;

import dao.AlunoDAO;
import model.Aluno;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditarAlunoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idStr = request.getParameter("idAluno");

        if (idStr != null && !idStr.isEmpty()) {
            Long id = Long.parseLong(idStr);

            Aluno aluno = new AlunoDAO().buscarPorId(id);
            request.setAttribute("aluno", aluno);

            request.getRequestDispatcher("editarAluno.jsp").forward(request, response);
        } else {
            response.sendRedirect("sistema?acao=listarAlunos");
        }
    }
}
