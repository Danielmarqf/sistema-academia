package command;

import dao.AlunoDAO;
import model.Aluno;
import service.plano.Plano;
import service.plano.PlanoBasico;
import service.plano.PlanoPremium;
import builder.AlunoBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AtualizarAlunoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        try {
            String pStr = request.getParameter("peso");
            String aStr = request.getParameter("altura");
            Double peso = (pStr != null && !pStr.isEmpty()) ? Double.parseDouble(pStr) : null;
            Double altura = (aStr != null && !aStr.isEmpty()) ? Double.parseDouble(aStr) : null;

            String tipoPlano = request.getParameter("tipoPlano");
            String planoAtualStr = null;

            if (tipoPlano != null && !tipoPlano.isEmpty()) {
                Plano plano = new PlanoBasico();
                if (tipoPlano.equalsIgnoreCase("premium")) {
                    plano = new PlanoPremium(plano);
                }
                planoAtualStr = plano.getDescricao();
            }

            String[] adicionaisMarcados = request.getParameterValues("adicionais");
            String servicosSalvar = (adicionaisMarcados != null) ? String.join(", ", adicionaisMarcados) : "";

            Aluno aluno = new AlunoBuilder()
                    .id(Long.parseLong(request.getParameter("idAluno")))
                    .nome(request.getParameter("nome"))
                    .cpf(request.getParameter("cpf"))
                    .email(request.getParameter("email"))
                    .objetivo(request.getParameter("objetivo"))
                    .peso(peso)
                    .altura(altura)
                    .planoAtual(planoAtualStr)
                    .servicosAdicionais(servicosSalvar)
                    .build();

            new AlunoDAO().atualizar(aluno);

        } catch (Exception e) {
            System.err.println("Erro no comando Atualizar: " + e.getMessage());
        }

        response.sendRedirect("sistema?acao=listarAlunos");
    }
}
