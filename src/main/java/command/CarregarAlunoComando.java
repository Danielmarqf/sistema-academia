package command;

import dao.AlunoDAO;
import model.Aluno;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CarregarAlunoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));

        AlunoDAO dao = new AlunoDAO();
        Aluno alunoEncontrado = dao.buscarPorId(id);

        request.setAttribute("aluno", alunoEncontrado);

        request.getRequestDispatcher("editarAluno.jsp").forward(request, response);
    }
}
