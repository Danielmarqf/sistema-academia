package controller;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Supplier;
import command.AtualizarAlunoComando;
import command.AtualizarProfessorComando;
import command.CarregarAlunoComando;
import command.Comando;
import command.EditarAlunoComando;
import command.EditarProfessorComando;
import command.ExcluirAlunoComando;
import command.ExcluirProfessorComando;
import command.ListarAlunosComando;
import command.ListarPagamentosComando;
import command.ListarProfessoresComando;
import command.ListarTreinosAlunoComando;
import command.ListarTreinosComando;
import command.LogarComando;
import command.LogoutComando;
import command.PrepararPagamentoComando;
import command.PrepararProfessorComando;
import command.PrepararTreinoComando;
import command.SalvarAlunoComando;
import command.SalvarPagamentoComando;
import command.SalvarProfessorComando;
import command.SalvarTreinoComando;
import command.ExcluirPagamentoComando;

public class FabricaDeComandos {

    private static final Map<String, Supplier<Comando>> comandos = new HashMap<>();

    static {
        comandos.put("salvarAluno", SalvarAlunoComando::new);
        comandos.put("listarAlunos", ListarAlunosComando::new);
        comandos.put("excluirAluno", ExcluirAlunoComando::new);
        comandos.put("carregarAluno", CarregarAlunoComando::new);
        comandos.put("editarAluno", EditarAlunoComando::new);
        comandos.put("atualizarAluno", AtualizarAlunoComando::new);
        comandos.put("salvarProfessor", SalvarProfessorComando::new);
        comandos.put("listarProfessores", ListarProfessoresComando::new);
        comandos.put("prepararTreino", PrepararTreinoComando::new);
        comandos.put("salvarTreino", SalvarTreinoComando::new);
        comandos.put("listarTreinos", ListarTreinosComando::new);
        comandos.put("verFichaTreino", ListarTreinosComando::new);
        comandos.put("prepararPagamento", PrepararPagamentoComando::new);
        comandos.put("salvarPagamento", SalvarPagamentoComando::new);
        comandos.put("listarPagamentos", ListarPagamentosComando::new);
        comandos.put("logar", LogarComando::new);
        comandos.put("logout", LogoutComando::new);
        comandos.put("editarProfessor", EditarProfessorComando::new);
        comandos.put("atualizarProfessor", AtualizarProfessorComando::new);
        comandos.put("prepararProfessor", PrepararProfessorComando::new);
        comandos.put("excluirProfessor", ExcluirProfessorComando::new);
        comandos.put("listarTreinosAluno", ListarTreinosAlunoComando::new);
        comandos.put("excluirPagamento", ExcluirPagamentoComando::new);
    }

    public static Comando obterComando(String acao) {
        Supplier<Comando> supplier = comandos.get(acao);
        return supplier != null ? supplier.get() : null;
    }
}
