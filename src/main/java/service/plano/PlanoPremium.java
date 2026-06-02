package service.plano;

public class PlanoPremium extends PlanoDecorator {

    public PlanoPremium(Plano plano) {
        super(plano);
    }

    @Override
    public double getValor() {
        return plano.getValor() + 80;
    }

    @Override
    public String getDescricao() {
        return plano.getDescricao() + "+ Premium";
    }
}
