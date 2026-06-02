package builder;

import java.time.LocalDate;
import model.Aluno;

public class AlunoBuilder {

    private Aluno aluno;

    public AlunoBuilder() {
        this.aluno = new Aluno();
    }

    public AlunoBuilder id(Long id) {
        this.aluno.setId(id);
        return this;
    }

    public AlunoBuilder nome(String nome) {
        this.aluno.setNome(nome);
        return this;
    }

    public AlunoBuilder cpf(String cpf) {
        this.aluno.setCpf(cpf);
        return this;
    }

    public AlunoBuilder email(String email) {
        this.aluno.setEmail(email);
        return this;
    }

    public AlunoBuilder senha(String senha) {
        this.aluno.setSenha(senha);
        return this;
    }

    public AlunoBuilder telefone(String telefone) {
        this.aluno.setTelefone(telefone);
        return this;
    }

    public AlunoBuilder peso(Double peso) {
        this.aluno.setPeso(peso);
        return this;
    }

    public AlunoBuilder altura(Double altura) {
        this.aluno.setAltura(altura);
        return this;
    }

    public AlunoBuilder objetivo(String objetivo) {
        this.aluno.setObjetivo(objetivo);
        return this;
    }

    public AlunoBuilder dataMatricula(LocalDate dataMatricula) {
        this.aluno.setDataMatricula(dataMatricula);
        return this;
    }

    public AlunoBuilder statusMensalidade(String status) {
        this.aluno.setStatusMensalidade(status);
        return this;
    }

    public AlunoBuilder planoAtual(String planoAtual) {
        this.aluno.setPlanoAtual(planoAtual);
        return this;
    }

    public AlunoBuilder servicosAdicionais(String servicosAdicionais) {
        this.aluno.setServicosAdicionais(servicosAdicionais);
        return this;
    }

    public Aluno build() {
        return this.aluno;
    }
}