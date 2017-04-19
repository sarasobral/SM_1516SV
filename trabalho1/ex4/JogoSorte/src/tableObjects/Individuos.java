package tableObjects;

import java.util.Random;
import java.util.regex.Matcher;

public class Individuos {
    private static int idInd = 10000000;;
    //Número de Cidadão | Nome(s) Próprio(s) e Apelido(s) | Concelho de Residência | Profissão

    private int cidadao;
    private String nomeProprio;
    private String nomeApelido;
    private String concelho;
    private String profissao;
    private int contadorApostas;

    public Individuos(String nomeProprio, String nomeApelido, String concelho, String profissao) {
        this.cidadao=idInd;
        this.nomeProprio = nomeProprio;
        this.nomeApelido =  nomeApelido;
        this.concelho = concelho;
        this.profissao = profissao;
        contadorApostas=0;
        idInd = (int) (Math.random()*(99999999-10000000))+10000000;

    }

    public int getCidadao() {
        return cidadao;
    }

    public String getNomeProprio() {
        return nomeProprio;
    }

    public String getNomeApelido() {
        return nomeApelido;
    }

    public String getConcelho() {
        return concelho;
    }

    public String getProfissao() {
        return profissao;
    }

    public int getContadorApostas() {
        return contadorApostas;
    }

    public void incContadorApostas() {
        this.contadorApostas += 1;
    }
}