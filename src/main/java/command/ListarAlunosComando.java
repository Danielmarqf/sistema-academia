package command;

import dao.AlunoDAO;
import model.Aluno;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarAlunosComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        AlunoDAO dao = new AlunoDAO();
        List<Aluno> alunos = dao.listarTodos();

        request.setAttribute("listaAlunos", alunos);
        request.getRequestDispatcher("listaAlunos.jsp").forward(request, response);
    }
}
