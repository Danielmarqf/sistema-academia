package command;

import dao.TreinoDAO;
import model.Treino;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarTreinosComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String idStr = request.getParameter("idAluno");

        if (idStr != null && !idStr.isEmpty()) {
            Long id = Long.parseLong(idStr);
            List<Treino> lista = new TreinoDAO().listarPorAluno(id);
            request.setAttribute("listaTreinos", lista);
            request.setAttribute("idAluno", id);
        }

        request.getRequestDispatcher("listaTreinos.jsp").forward(request, response);
    }
}
