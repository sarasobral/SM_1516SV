package SM;

import java.io.*;
import java.nio.file.Files;

public class Encoding {

    public static void encodingFile(String filename, String extension) {
        File file = new File(filename+extension);
        byte[] allBytes;
        FileOutputStream fileout;
        try {
            allBytes = Files.readAllBytes(file.toPath());
            fileout = new FileOutputStream(new File(filename+"_enc.txt"));
            int count=1;
            for(int i=0, j=1; i<allBytes.length;++i,++j){
                while(j<allBytes.length && allBytes[i] == allBytes[j]){
                    count++;
                    i++;
                    j++;
                }
                if(count==1) fileout.write(allBytes[i]);
                else{
                    fileout.write(allBytes[i]);
                    fileout.write(allBytes[i]);
                    fileout.write(count);
                }
                count=1;
            }
            fileout.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static void encodingCGFile(String filename, String extension)  {
        String line = null;
        StringBuilder codingString = new StringBuilder();
        int count = 1;
        char currentChar = 0;
        DataInputStream dataIn = null;
        try {
            dataIn = new DataInputStream(new FileInputStream(filename+extension));
            while(dataIn.available()>0){
                line = dataIn.readLine();
                if(line.length()<1)
                    return;
                currentChar = line.charAt(0);
                for (int i = 1; i < line.length(); i++) {
                    if(line.charAt(i)!=currentChar) {
                        if(count==1) codingString.append(currentChar+"\n");
                        else codingString.append(count+""+currentChar+"\n");
                        currentChar=line.charAt(i);
                        count=0;
                    }
                    ++count;
                }
                codingString.append('\n'+"\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(count==1) codingString.append(currentChar);
        else codingString.append(count+""+currentChar);
        writeFile (filename+"_enc.txt",codingString);
    }

    // escreve a string num ficheiro
    public static void writeFile(String fileName, StringBuilder s) {
        PrintWriter writer = null;
        try {
            writer = new PrintWriter(fileName, "ISO-8859-1");
            writer.println(s);
        } catch (IOException e) {
            System.out.println("Impossivel abrir ou escrever no ficheiro");
        } finally {
            if (writer != null) writer.close();
        }
    }
}
