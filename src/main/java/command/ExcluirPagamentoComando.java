package command;

import dao.PagamentoDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ExcluirPagamentoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idParam = request.getParameter("id");

        if (idParam != null) {
            Long id = Long.parseLong(idParam);
            PagamentoDAO dao = new PagamentoDAO();
            dao.excluir(id);
        }

        response.sendRedirect("sistema?acao=listarPagamentos");
    }
}
