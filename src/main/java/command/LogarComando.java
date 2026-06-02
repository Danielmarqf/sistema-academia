package command;

import util.FabricaConexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogarComando implements Comando {

    @Override
    public void executar(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String emailDigitado = request.getParameter("username");
        String senhaDigitada = request.getParameter("password");

        Connection conexao = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conexao = FabricaConexao.obterConexao();
            HttpSession sessao = request.getSession();

            String sqlProf = "SELECT * FROM professores WHERE email = ? AND senha = ?";
            stmt = conexao.prepareStatement(sqlProf);
            stmt.setString(1, emailDigitado);
            stmt.setString(2, senhaDigitada);
            rs = stmt.executeQuery();

            if (rs.next()) {
                sessao.setAttribute("usuarioLogado", rs.getString("nome"));
                sessao.setAttribute("tipoUsuario", "Instrutor");
                sessao.setAttribute("idUsuario", rs.getInt("id"));
                response.sendRedirect("painel.jsp");
                return;
            }

            rs.close();
            stmt.close();

            String sqlAluno = "SELECT * FROM alunos WHERE email = ? AND senha = ?";
            stmt = conexao.prepareStatement(sqlAluno);
            stmt.setString(1, emailDigitado);
            stmt.setString(2, senhaDigitada);
            rs = stmt.executeQuery();

            if (rs.next()) {
                sessao.setAttribute("usuarioLogado", rs.getString("nome"));
                sessao.setAttribute("tipoUsuario", "Aluno");
                sessao.setAttribute("idUsuario", rs.getInt("id"));
                response.sendRedirect("painel.jsp");
                return;
            }

            response.sendRedirect("login.jsp?erro=1");

        } catch (Exception e) {
            System.out.println("Erro no login: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("login.jsp?erro=2");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
            } catch (Exception e) {
                System.out.println("Erro ao fechar conexões: " + e.getMessage());
            }
        }
    }
}
