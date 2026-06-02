package command;

import dao.PagamentoDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarPagamentosComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("listaPagamentos", new PagamentoDAO().listarTodos());

        request.getRequestDispatcher("listaPagamentos.jsp").forward(request, response);
    }
}
