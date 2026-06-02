package command;

import dao.ProfessorDAO;
import model.Professor;
import builder.ProfessorBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AtualizarProfessorComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        String salStr = request.getParameter("salario");
        Double salario = null;
        if (salStr != null && !salStr.isEmpty()) {
            salario = Double.valueOf(salStr.replace(",", "."));
        }

        Professor p = new ProfessorBuilder()
                .id(Long.valueOf(request.getParameter("idProfessor")))
                .nome(request.getParameter("nome"))
                .cpf(request.getParameter("cpf"))
                .email(request.getParameter("email"))
                .senha(request.getParameter("senha"))
                .turno(request.getParameter("turno"))
                .cref(request.getParameter("cref"))
                .salario(salario)
                .build();

        new ProfessorDAO().atualizar(p);

        response.sendRedirect("sistema?acao=listarProfessores");
    }
}
