package command;

import dao.TreinoDAO;
import model.Treino;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarTreinosAlunoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String idParam = request.getParameter("idAluno");

        Long idAluno = Long.parseLong(idParam);

        TreinoDAO dao = new TreinoDAO();
        List<Treino> treinos = dao.listarPorAluno(idAluno);

        request.setAttribute("listaTreinos", treinos);

        request.getRequestDispatcher("listarTreinosAluno.jsp").forward(request, response);
    }
}
