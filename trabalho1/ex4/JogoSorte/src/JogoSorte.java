import tableObjects.Apostas;
import tableObjects.Individuos;
import java.io.*;
import java.util.*;

public class JogoSorte {
    static BufferedReader br = null;

    static LinkedList<String> nomes = new LinkedList<String>();
    static LinkedList<String> apelidos = new LinkedList<String >();
    static LinkedList<String> concelhos = new LinkedList<String>();
    static LinkedList<String> profissoes = new LinkedList<String>();

    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
        // ler Nomes.txt, Apelidos.txt, Concelhos.txt e Profiss~oes.txt
        lerFicheiro("Nomes.txt", nomes);
        lerFicheiro("Apelidos.txt", apelidos);
        lerFicheiro("Concelhos.txt", concelhos);
        lerFicheiro("Profissões.txt", profissoes);

        HashSet<Individuos> individuos = criarIndividuos();
        HashSet<Apostas> apostas = criarApostas(individuos);
        // imprimir as tabelas
/*      System.out.println(tabelaIndividuos(individuos));
        System.out.println();
        System.out.println(tabbelaAposta(apostas));
        */
        // Escrever num ficheiro
        escreverFicheiro("TabelaIndividuos.txt", tabelaIndividuos(individuos));
        escreverFicheiro("TabelaApostas.txt", tabbelaAposta(apostas));

        try {
        if (br != null)
            if (br != null)
                br.close();
        } catch (IOException e) {
            System.out.println("Erro ao encerrar BufferedReader");;
        }
    }

    private static void escreverFicheiro(String fileName, StringBuilder sb) {
        PrintWriter writer = null;
        try {
            writer = new PrintWriter(fileName, "ISO-8859-1");
            writer.println(sb);
        } catch (IOException e) {
            System.out.println("Impossivel abrir ou escrever no ficheiro");
        } finally {
            if (writer != null) writer.close();
        }
    }

    private static void lerFicheiro (String path, LinkedList<String> list)  {
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "ISO-8859-1"));
        } catch (UnsupportedEncodingException e) {
            System.out.println("Impossível codififcar ficheiro");;
        } catch (FileNotFoundException e) {
            System.out.println("Impossível abrir ficheiro");
        }

        String nome = "";
        try {
            while ((nome = br.readLine()) != null) {
                list.add(nome);
            }
        } catch (IOException e) {
            System.out.println("Impossivel ler linha");;
        }
    }

    private static HashSet<Individuos> criarIndividuos() {
        HashSet<Individuos> individuos = new HashSet<Individuos>();
        // ir buscar mais de 1000 individuos
        int rand = (int) (Math.random()*9);
        int numeroDeIndiv = (int) (Math.random()*(rand*1000))+1000;
        for (int i = 0; i < numeroDeIndiv; i++)
            individuos.add(getIndividuo()); // le dos ficheiros e cria um individuo
        return individuos;
    }

    public static Individuos getIndividuo() {
        String nomeProp = "", nomeApelido = "", concelho, profissao;
        int index = 0;
        //vou buscar 1 ou 2 nomes proprios
        for (int i = (int) (Math.random() * 2)+1; i > 0; i--) {
            index = (int) (Math.random() * (nomes.size()));
            nomeProp += nomes.get(index)+" ";
        }
        //vou buscar 1 ou 2 apelidos
        for (int i = (int) (Math.random() * 2)+1; i > 0; i--) {
            index = (int) (Math.random() * (apelidos.size()));
            nomeApelido += apelidos.get(index)+" ";
        }
        index = (int) (Math.random() * (concelhos.size()));
        concelho = concelhos.get(index);
        index = (int) (Math.random() * (profissoes.size()));
        profissao = profissoes.get(index);

        return new Individuos(nomeProp, nomeApelido, concelho, profissao);
    }

    private static HashSet<Apostas> criarApostas(HashSet<Individuos> individuos) {
        HashSet<Apostas> apostas = new HashSet<Apostas>();
        Individuos ind = null;
        int number;
        String date = null;
        GregorianCalendar gc = new GregorianCalendar();

        // fazer apostas
        for (int i = 0; i < (int) (Math.random() * individuos.size()); i++) {
            // vai buscar um individuo para apostar
            ind = getRandomIndividuo(individuos);
            while ( ind.getContadorApostas() >=4 )
                ind = getRandomIndividuo(individuos);
            ind.incContadorApostas();
            // gerar aposta formada por 5 n??meros inteiros (diferentes) no intervalo [1, 50]
            // seguidos de outros 2 n??meros inteiros (diferentes) no intervalo [1, 11]
            number=0;
            number += (int) ((Math.random() * (50-1)) + 1) * 1000000;
            number += (int) ((Math.random() * (50-1)) + 1) * 100000;
            number += (int) ((Math.random() * (50-1)) + 1) * 10000;
            number += (int) ((Math.random() * (50-1)) + 1) * 1000;
            number += (int) ((Math.random() * (50-1)) + 1) * 100;
            number += (int) ((Math.random() * (11-1)) + 1) * 10;
            number += (int) ((Math.random() * (11-1)) + 1);

            // data da aposta
            gc.set(gc.YEAR, ((int) (Math.random()*(2016-2010)+1)+2010));
            gc.set(gc.DAY_OF_YEAR, ((int)(Math.random()*gc.getActualMaximum(gc.DAY_OF_YEAR))+1));
            date =  gc.get(gc.DAY_OF_MONTH) + "-" + (gc.get(gc.MONTH) + 1) + "-" + gc.get(gc.YEAR);

            apostas.add(new Apostas(ind, number, date));
        }
        return apostas;
    }

    private static Individuos getRandomIndividuo(HashSet<Individuos> individuos) {
        int index = (int) ((Math.random() * (individuos.size())));
        return (Individuos) individuos.toArray()[index];
    }

    public static StringBuilder tabelaIndividuos(HashSet<Individuos> individuos) {
        StringBuilder sb = new StringBuilder();
        sb.append("+-------------------+------------------------------------------+--------------------------------+-----------------------------------------------------------------------------------------+\n");
        sb.append("| Número de Cidadão |      Nome(s) Próprio(s) e Apelido(s)     |     Concelho de Residência     |                                       Profissão                                         |\n");
        sb.append("+-------------------+------------------------------------------+--------------------------------+-----------------------------------------------------------------------------------------+\n");

        for (Individuos ind : individuos) {
            sb.append("|     "+ind.getCidadao()+ "      |");
            sb.append(appendTuple(40, ind.getNomeProprio() + ind.getNomeApelido()));
            sb.append(appendTuple(30 , ind.getConcelho()));
            sb.append(appendTuple(86 , ind.getProfissao()));
            sb.append("\n");
        }
        sb.append("+-------------------+------------------------------------------+--------------------------------+-----------------------------------------------------------------------------------------+");
        return sb;
    }

    public static StringBuilder tabbelaAposta(HashSet<Apostas> apostas) {
        StringBuilder sb = new StringBuilder();
        sb.append("+-------------------+------------+------------+\n");
        sb.append("| Número de Cidadão |   Aposta   |    Data    |\n");
        sb.append("+-------------------+------------+------------+\n");
        for (Apostas apost : apostas) {
            sb.append("|     "+apost.getCidadao().getCidadao()+ "      |");
            sb.append(appendTuple(10, Integer.toString(apost.getAposta())));
            sb.append(appendTuple(10, apost.getData()));
            sb.append("\n");
        }
        sb.append("+-------------------+------------+------------+");
        return sb;
    }

    private static String appendTuple(int n, String nome) {
        String s=" "+nome;
        for (int i = nome.length(); i <= n; i++) {
            s += " ";
        }
        return s+="|";
    }

}
