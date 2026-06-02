package com.mycompany.sistemaacademia.resources;

import dao.AlunoDAO;
import model.Aluno;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("alunos")
public class AlunoResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response listarAlunosRest() {
        try {

            List<Aluno> lista = new AlunoDAO().listarTodos();

            return Response
                    .ok(lista)
                    .build();
        } catch (Exception e) {
            return Response
                    .status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("Erro ao buscar dados para a API: " + e.getMessage())
                    .build();
        }
    }
}
