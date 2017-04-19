package tableObjects;

public class Apostas {
    //Número de Cidadão | Aposta | Data
    private Individuos cidadao;
    private int aposta;
    private String data;

    public Apostas(Individuos cidadao, int aposta, String data){
        this.cidadao = cidadao;
        this.aposta = aposta;
        this.data = data;
    }

    public Individuos getCidadao() {
        return cidadao;
    }

    public int getAposta() {
        return aposta;
    }

    public String getData() {
        return data;
    }



}
