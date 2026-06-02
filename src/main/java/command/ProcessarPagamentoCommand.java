package command;

import dao.PagamentoDAO;
import model.Pagamento;
import service.plano.Plano;
import service.plano.PlanoBasico;
import service.plano.PlanoPremium;
import java.sql.Date;

public class ProcessarPagamentoCommand {

    private PagamentoDAO pagamentoDAO;

    public ProcessarPagamentoCommand() {
        this.pagamentoDAO = new PagamentoDAO();
    }

    public void executar(Long alunoId, String tipoPlano,
            String metodoPagamento,
            String referenciaMes) {

        Plano plano = new PlanoBasico();
        if (tipoPlano != null && tipoPlano.equalsIgnoreCase("premium")) {
            plano = new PlanoPremium(plano);
        }
        
        double valorFinalCalculado = plano.getValor();

        Pagamento p = new Pagamento();
        p.setAlunoId(alunoId);
        p.setValor(valorFinalCalculado);
        p.setDataPagamento(new Date(System.currentTimeMillis()));
        p.setMetodoPagamento(metodoPagamento);
        p.setReferenciaMes(referenciaMes);
        
        p.setDescricaoPlano(plano.getDescricao()); 

        pagamentoDAO.salvar(p);
    }
}