package command;

import dao.TreinoDAO;
import model.Treino;
import model.Professor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SalvarTreinoComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        String idAlunoStr = request.getParameter("idAluno");
        String professorIdStr = request.getParameter("professorId");

        if (idAlunoStr != null && !idAlunoStr.isEmpty()) {
            Treino treino = new Treino();
            treino.setAlunoId(Long.parseLong(idAlunoStr));
            treino.setExercicio(request.getParameter("exercicio"));

            String s = request.getParameter("series");
            String r = request.getParameter("repeticoes");
            treino.setSeries((s != null && !s.isEmpty()) ? Integer.parseInt(s) : 0);
            treino.setRepeticoes((r != null && !r.isEmpty()) ? Integer.parseInt(r) : 0);

            treino.setCarga(request.getParameter("carga"));
            treino.setDiaSemana(request.getParameter("diaSemana"));

            if (professorIdStr != null && !professorIdStr.isEmpty()) {
                Professor prof = new Professor();
                prof.setId(Long.parseLong(professorIdStr));
                treino.setInstrutorResponsavel(prof);
            }

            new TreinoDAO().salvar(treino);
        }

        response.sendRedirect("sistema?acao=listarTreinos&idAluno=" + idAlunoStr);
    }
}
