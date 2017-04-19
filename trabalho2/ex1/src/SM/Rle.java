package SM;

import java.io.*;
import java.util.Scanner;

import static SM.Decoding.decodingCGFile;
import static SM.Decoding.decodingFile;
import static SM.Encoding.encodingCGFile;
import static SM.Encoding.encodingFile;

public class Rle {

    public static void grayImages(String path,String extension){
        String[] files = {"bird","camera","face","safe","lena","finger"};
        for ( String name : files ){
            encodingFile(path+name,extension);
            decodingFile(path+name,"_enc.txt",extension);
            File encodingfile =new File(path+name+"_enc.txt");
            File decodingfile =new File(path+name+"_dec"+extension);
            float encodingbytes = encodingfile.length();
            float decodingbytes = decodingfile.length();
            float tc = (decodingbytes/encodingbytes);
            System.out.println(name+extension+" TC:"+tc*100+"%");
        }

    }
    public static void grayCGImages(String path,String extension){
        String[] files = {"circles","squares"};
        for ( String name : files ){
            encodingCGFile(path+name,extension);
            decodingCGFile(path+name,"_enc.txt",extension);
            File encodingfile =new File(path+name+"_enc.txt");
            File decodingfile =new File(path+name+"_dec"+extension);
            float encodingbytes = encodingfile.length();
            float decodingbytes = decodingfile.length();
            float tc = (decodingbytes/encodingbytes);
            System.out.println(name+extension+" TC:"+tc*100+"%");
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Escreva 1 para avaliar os ficheiros raw ou 2 para avaliar os ficheiros bmp");
        int i = sc.nextInt();
        if(i==1) {
            grayImages("grayscaleRawImages/", ".raw");
            grayCGImages("grayscaleRawImages/", ".raw");
        }
        else if(i==2) {
            grayImages("grayscaleBMPImages/", ".bmp");
            grayCGImages("grayscaleBMPImages/", ".bmp");
        }
    }
}