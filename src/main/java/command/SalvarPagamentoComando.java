package command;

import dao.PagamentoDAO;
import model.Pagamento;
import service.plano.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

public class SalvarPagamentoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String alunoIdStr = request.getParameter("alunoId");
        String metodoPagamento = request.getParameter("metodoPagamento");
        String referenciaMes = request.getParameter("referenciaMes");
        String tipoPlano = request.getParameter("tipoPlano");
        String[] adicionais = request.getParameterValues("adicionais");

        if (alunoIdStr == null || alunoIdStr.trim().isEmpty()) {
            response.sendRedirect("sistema?acao=listarPagamentos&erro=AlunoNaoSelecionado");
            return;
        }

        Plano plano;

        if ("premium".equalsIgnoreCase(tipoPlano)) {
            plano = new PlanoPremium(new PlanoBasico());
        } else {
            plano = new PlanoBasico();

            if (adicionais != null) {
                for (String adicional : adicionais) {
                    if ("pilates".equalsIgnoreCase(adicional)) {
                        plano = new PilatesDecorator(plano);
                    } else if ("dieta".equalsIgnoreCase(adicional)) {
                        plano = new DietaDecorator(plano);
                    } else if ("massagem".equalsIgnoreCase(adicional)) {
                        plano = new MassagemDecorator(plano);
                    }
                }
            }
        }

        double valorFinal = plano.getValor();

        try {
            Pagamento p = new Pagamento();
            p.setAlunoId(Long.parseLong(alunoIdStr));
            p.setValor(valorFinal);
            p.setMetodoPagamento(metodoPagamento != null ? metodoPagamento : "Não Informado");
            p.setReferenciaMes(referenciaMes != null ? referenciaMes : "Não Informado");
            p.setDataPagamento(new Date(System.currentTimeMillis()));

            PagamentoDAO dao = new PagamentoDAO();
            dao.salvar(p);

            response.sendRedirect("sistema?acao=listarPagamentos");

        } catch (NumberFormatException e) {
            response.sendRedirect("sistema?acao=listarPagamentos&erro=IdAlunoInvalido");
        }
    }
}
