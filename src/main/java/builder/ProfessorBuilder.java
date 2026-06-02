package builder;

import java.time.LocalDate;
import model.Professor;

public class ProfessorBuilder {

    private Professor professor;

    public ProfessorBuilder() {
        this.professor = new Professor();
    }

    public ProfessorBuilder id(Long id) {
        this.professor.setId(id);
        return this;
    }

    public ProfessorBuilder nome(String nome) {
        this.professor.setNome(nome);
        return this;
    }

    public ProfessorBuilder cpf(String cpf) {
        this.professor.setCpf(cpf);
        return this;
    }

    public ProfessorBuilder email(String email) {
        this.professor.setEmail(email);
        return this;
    }

    public ProfessorBuilder senha(String senha) {
        this.professor.setSenha(senha);
        return this;
    }

    public ProfessorBuilder telefone(String telefone) {
        this.professor.setTelefone(telefone);
        return this;
    }

    public ProfessorBuilder cref(String cref) {
        this.professor.setCref(cref);
        return this;
    }

    public ProfessorBuilder especialidade(String especialidade) {
        this.professor.setEspecialidade(especialidade);
        return this;
    }

    public ProfessorBuilder salario(Double salario) {
        this.professor.setSalario(salario);
        return this;
    }

    public ProfessorBuilder turno(String turno) {
        this.professor.setTurno(turno);
        return this;
    }

    public ProfessorBuilder dataContratacao(LocalDate dataContratacao) {
        this.professor.setDataContratacao(dataContratacao);
        return this;
    }

    public Professor build() {
        return this.professor;
    }
}
