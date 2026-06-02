package command;

import dao.AlunoDAO;
import dao.TreinoDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcluirAlunoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String idStr = request.getParameter("idAluno");

        if (idStr != null && !idStr.isEmpty()) {
            Long id = Long.parseLong(idStr);

            new TreinoDAO().excluirPorAluno(id);

            new AlunoDAO().excluir(id);
        }

        response.sendRedirect("sistema?acao=listarAlunos");
    }
}
