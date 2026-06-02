package controller;

import command.Comando;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SistemaServlet", urlPatterns = {"/sistema"})
public class SistemaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String acao = request.getParameter("acao");

        try {
            Comando comando = FabricaDeComandos.obterComando(acao);

            if (comando != null) {
                comando.executar(request, response);
            } else {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<h1>Ação '" + acao + "' não encontrada ou não implementada ainda!</h1>");
            }

        } catch (Exception e) {
            throw new ServletException("Erro grave ao tentar executar o comando.", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
