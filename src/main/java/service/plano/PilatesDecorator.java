package service.plano;

public class PilatesDecorator extends PlanoDecorator {

    public PilatesDecorator(Plano plano) {
        super(plano);
    }

    @Override
    public double getValor() {
        return super.getValor() + 50.00;
    }

    @Override
    public String getDescricao() {
        return super.getDescricao() + " + Pilates";
    }
}
