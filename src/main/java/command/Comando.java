package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Comando {

    void executar(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
