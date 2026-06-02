package service.plano;

public class PlanoBasico implements Plano {

    @Override
    public double getValor() {
        return 100;
    }

    @Override
    public String getDescricao() {
        return "Plano Básico";
    }
}
