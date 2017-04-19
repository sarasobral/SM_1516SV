import java.io.*;
import java.util.LinkedList;

/**
 * Created by Utilizador on 06/05/2016.
 */
public class LZ78Tokenize {
    static LinkedList<String> dicionario;
    static LinkedList<String> tokens;
    static final int DICIONARIO_SIZE = 512;

    public static void main(String[] args) {
        LinkedList<String> ficheirosParaCodificar = ficheirosParaCodificar("ficheiros.txt");
        for (String ficheiroEntrada : ficheirosParaCodificar) {
            dicionario = new LinkedList<String>();
            dicionario.add("");
            tokens  = new LinkedList<String>();

            codificarFicheiro(ficheiroEntrada);
            long doBit = dimensaoArquivo(ficheiroEntrada)*8;
            
            String ficheiroCofificado = ficheiroEntrada+"-LZ78.txt";
            int nTokens = tokens.size();
            double dimensaoToken = (Math.log(DICIONARIO_SIZE)/Math.log(2))+8;
            double dcBit = dimensaoToken*nTokens;
            double taxaCompressao = (dcBit/doBit);
            escreverDicionarioFicheiro(ficheiroCofificado, taxaCompressao);
        }
    }

    private static LinkedList<String> ficheirosParaCodificar(String path) {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "ISO-8859-1"));
        } catch (UnsupportedEncodingException e) {
            System.out.println("Impossível codififcar ficheiro");
        } catch (FileNotFoundException e) {
            System.out.println("Impossível abrir ficheiro");
        }
        LinkedList<String> ficheirosParaCodificar = new LinkedList<String>();
        try{
            String line;
            while ((line = br.readLine()) != null)
                ficheirosParaCodificar.add(line);
        }catch (IOException e){
            System.out.println("Impossivel ler ficheiro");
        }finally {
            if (br != null)
                try {
                    br.close();
                } catch (IOException e) {
                    System.out.println("Impossivel fechar BufferedReader");
                }
        }
        return ficheirosParaCodificar;
    }

    public static long dimensaoArquivo(String caminhoArquivo) {
        File arquivo = new File(caminhoArquivo);
        if (arquivo.exists()) {
            return arquivo.length();
        }
        return 0;
    }

    private static void codificarFicheiro(String path) {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "ISO-8859-1"));
        } catch (UnsupportedEncodingException e) {
            System.out.println("Impossível codififcar ficheiro");
        } catch (FileNotFoundException e) {
            System.out.println("Impossível abrir ficheiro "+path);
        }
        String line = "", sequencia="";
        try{
            while ((line = br.readLine()) != null) {
                for (int i = 0; i < line.length(); i++) {
                    sequencia += line.charAt(i);
                    // procurar no dicionario
                    if (!dicionario.contains(sequencia)){
                        // nao está presente vamos adicionar ao dicionario
                        criarToken(sequencia);
                        sequencia = "";
                    }
                }
            }
        }catch (IOException e){
            System.out.println("Impossivel ler ficheiro");
        }finally {
            if (br != null)
                try {
                    br.close();
                } catch (IOException e) {
                    System.out.println("Impossivel fechar BufferedReader");
                }
        }
    }

    private static void criarToken(String sequencia){
        if (dicionario.size()<DICIONARIO_SIZE)
            dicionario.add(sequencia);
        String s = "";
        for (int i = 0; i < sequencia.length()-1; i++)
            s+=sequencia.charAt(i);
        // (indice de da sequencia antes da quebra, simbolo da quebra)
        String token = "("+dicionario.indexOf(s)+",'"+sequencia.charAt(sequencia.length()-1)+"')";
        tokens.add(token);
    }

    private static void escreverDicionarioFicheiro(String outputFile, double taxa) {
        PrintWriter writer = null;
        try {
            writer = new PrintWriter(outputFile, "ISO-8859-1");
            for (String token : tokens)
                writer.println(token);
            writer.println();
            writer.println("Dicionario:");
            int i=0;
            for (String dic : dicionario)
                writer.println(i++ +" - '"+ dic+"'");
            writer.println();
            writer.println("Taxa de compressão: "+taxa);
        } catch (IOException e) {
            System.out.println("Impossivel abrir ou escrever no ficheiro");
        } finally {
            if (writer != null) writer.close();
        }
    }
}
