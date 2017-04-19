package SM;

import java.io.*;
import java.nio.file.Files;

/**
 * Created by Utilizador on 06/07/2016.
 */
public class Decoding {
    public static void decodingFile(String fileName,String stri, String extension)  {
        File file = new File(fileName+stri);
        byte[] allBytes;
        FileOutputStream fileout;
        try {
            allBytes = Files.readAllBytes(file.toPath());
            fileout = new FileOutputStream(new File(fileName+"_dec"+extension));
            int count=1;
            byte b;
            for(int i=0; i<allBytes.length; ) {
                b = allBytes[i];
                if (i < allBytes.length - 1 && b == allBytes[i + 1]) {
                    count = (int) allBytes[i + 2];
                    while (count-- > 0)
                        fileout.write(allBytes[i]);
                    i += 3;
                } else {
                    fileout.write(allBytes[i]);
                    i += 1;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void decodingCGFile(String fileName, String stri, String extension)  {
        String  countChar = "", encodingString = "";
        StringBuilder res=new StringBuilder();
        int count = 0;
        DataInputStream dataIn = null;
        PrintWriter writer = null;
        try {
            dataIn = new DataInputStream(new FileInputStream(fileName+stri));
            writer = new PrintWriter(fileName+"_dec"+extension, "ISO-8859-1");
            while (dataIn.available() > 0) {
                encodingString = dataIn.readLine();
                if(encodingString.length()==1){
                    writer.print(encodingString.charAt(0));
                }
                else {
                    for (int i=0; i < encodingString.length(); i++) {
                        //obter o numero
                        while (encodingString.charAt(i) >= '0' && encodingString.charAt(i) <= '9' && i<encodingString.length()-1) {
                            countChar += encodingString.charAt(i);
                            i++;
                        }
                        count = Integer.parseInt(countChar);
                        for (int j = 0; j < count; j++) {
                            writer.print(encodingString.charAt(i));
                        }
                    }
                }
                countChar = "";
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.getMessage();
        }finally {
            writer.close();
            try {
                dataIn.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
