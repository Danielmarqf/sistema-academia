
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nomeDaAcao = request.getParameter("acao");

        String nomeDaClasse = "br.com.sistemaacademia.acao." + nomeDaAcao;

        try {
            Class<?> classe = Class.forName(nomeDaClasse);
            Command comando = (Command) classe.getDeclaredConstructor().newInstance();

            String paginaDeRetorno = comando.execute(request, response);

            request.getRequestDispatcher(paginaDeRetorno).forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Erro ao executar comando", e);
        }
    }
}
