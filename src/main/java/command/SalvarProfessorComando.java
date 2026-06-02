package command;

import dao.ProfessorDAO;
import model.Professor;
import builder.ProfessorBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SalvarProfessorComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        try {
            String salStr = request.getParameter("salario");
            Double salario = 0.0;

            if (salStr != null && !salStr.trim().isEmpty()) {
                try {
                    salario = Double.parseDouble(salStr.replace(",", "."));
                } catch (NumberFormatException e) {
                    System.err.println("Erro ao converter salário: " + salStr);
                }
            }

            Professor p = new ProfessorBuilder()
                    .nome(request.getParameter("nome"))
                    .cpf(request.getParameter("cpf"))
                    .email(request.getParameter("email"))
                    .senha(request.getParameter("senha"))
                    .turno(request.getParameter("turno"))
                    .cref(request.getParameter("cref"))
                    .salario(salario)
                    .build();

            new ProfessorDAO().salvar(p);

            response.sendRedirect("sistema?acao=listarProfessores");

        } catch (Exception e) {
            System.err.println("Erro ao processar SalvarProfessor: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("sistema?acao=listarProfessores&erro=houve um problema ao salvar");
        }
    }
}
