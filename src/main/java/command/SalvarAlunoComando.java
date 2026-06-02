package command;

import dao.AlunoDAO;
import model.Aluno;
import service.plano.Plano;
import service.plano.PlanoBasico;
import service.plano.PlanoPremium;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import builder.AlunoBuilder;

public class SalvarAlunoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        double peso = Double.parseDouble(request.getParameter("peso"));
        double altura = Double.parseDouble(request.getParameter("altura"));
        String objetivo = request.getParameter("objetivo");

        String tipoPlano = request.getParameter("tipoPlano");

        String[] adicionaisMarcados = request.getParameterValues("adicionais");
        String servicosSalvar = "";

        if (adicionaisMarcados != null) {
            servicosSalvar = String.join(", ", adicionaisMarcados);
        }

        Plano plano = new PlanoBasico();
        if (tipoPlano != null && tipoPlano.equalsIgnoreCase("premium")) {
            plano = new PlanoPremium(plano);
        }

        Aluno novoAluno = new AlunoBuilder()
                .nome(nome)
                .cpf(cpf)
                .email(email)
                .peso(peso)
                .altura(altura)
                .objetivo(objetivo)
                .dataMatricula(LocalDate.now())
                .statusMensalidade("ATIVO")
                .planoAtual(plano.getDescricao())
                .servicosAdicionais(servicosSalvar)
                .build();

        AlunoDAO dao = new AlunoDAO();
        dao.salvar(novoAluno);

        response.sendRedirect("sistema?acao=listarAlunos");
    }
}
