package command;

import dao.AlunoDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrepararPagamentoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("listaAlunos", new AlunoDAO().listarTodos());

        request.getRequestDispatcher("cadastroPagamento.jsp").forward(request, response);
    }
}
