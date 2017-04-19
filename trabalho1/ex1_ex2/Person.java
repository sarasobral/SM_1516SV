
import java.util.StringTokenizer;
import java.util.GregorianCalendar;
import java.util.Calendar;

import oursource.comparacoes.*;

/**
   Classe Pessoa.
   Esta classe implementa a interface Serializable de forma a
   permitir escrever instancias suas em ficheiro. 
 */
public class Person implements java.io.Serializable, Comparable  {
      
   /* Atributos que n�o podem variar numa pessoa. */
   private String name;
   private Calendar birthDay;
   /* Atributos susceptiveis de serem alterados.  */  
   private String address;
   private Contact contact;       

  /**
      Classe interna para implementar o crit�rio alternativo 
      de compara��o por idades.
   */ 
   public static class CompareByAge extends Compare {       

      public int compare( Object firstObject, Object secondObject ) {
         /* Obter as datas de nascimento das duas pessoas. */
         Calendar firstDate = ((Person)firstObject).getBirthDay();           
         Calendar secondDate = ((Person)secondObject).getBirthDay();           
               
         /* Testar a data mais recente. */
         if(firstDate.after(secondDate)) 
            /* Uma data mais recente � maior que uma data anterior. */
            return CompareConstants.BIGGER;
         return CompareConstants.SMALLER;
      }
   }  

  /**
      M�odo est�tico privado que compara dois nomes independentemente 
      do n�mero de espa�os brancos entres os nomes,
   */
   private static boolean compareNames( String nameFirstPerson, String nameSecondPerson ) {              

      /* Criar os Tokenizer's com o separador "  " */
      StringTokenizer st1 = new StringTokenizer(nameFirstPerson,"  ");
      StringTokenizer st2 = new StringTokenizer(nameSecondPerson,"  ");                
                
      /* Se nao t�m o mesmo numero de "nomes", ent�o s�o 
         nomes de pessoas diferentes. */
      if(st1.countTokens()!=st2.countTokens())
         return false;

      /* Ambas os nomes completos t�m o mesmo n�mero de "nomes". */
      /* Comparar os sucessivos "nomes" (tokens).  */
      while (st1.hasMoreTokens() && st2.hasMoreTokens()) {
         if(st1.nextToken().equalsIgnoreCase(st2.nextToken())==false )
            return false;
      }                     
      /* Todos os nomes parciais s�o iguais, logo trata-se da mesma pessoa. */
      return true;                        
   }

  /** 
      Construtor para iniciar um objecto Person.
   */
   public Person( String fullName, Calendar birthDay, String address, Contact contact ) {

      this.name = fullName; 
      this.birthDay  = birthDay;
      this.address   = address;
      this.contact = contact;
   }

  /**
      Obter o primeiro nome.
   */
   public String getFirstName()   { 
      /* Criar o Tokenizer com o separador "  " sobre o nome. */
      StringTokenizer st = new StringTokenizer(name," ");
      /* O primeiro token � o primeioro nome da pessoa. */
      return st.nextToken();
   }                

  /**
      Obter o �ltimo nome.
   */
   public String getLastName()    {       
      /* Criar o Tokenizer com o separador " " sobre o nome. */
      StringTokenizer st = new StringTokenizer(name,"  ");
      /* Verificar o n�mero de nomes. */                
      if(st.countTokens()==1) return "";
      /* Avan�ar os tokens at� ao pen�ltimo */                                
      while (st.countTokens()>1) 
         st.nextToken();
      /* O �ltimo token � o �ltimo nome (apelido) da pessoa. */
      return st.nextToken();
   }
        
  /**
      Obter o nome completo.
   */
   public String getFullName()   { return name; }        

  /**
      Obter a data de nascimento.
   */
   public Calendar getBirthDay() {  return birthDay;   }

  /**
      Obter o endere�o.
   */
   public String getAddress()     { return address;     }

  /**
      Obter os contactos.
   */
   public Contact getContact() { return contact; }

   // M�todos para alterar os atributos da pessoa.
   
  /**
      Alterar a data de nascimento.
   */
   public void setBirthDay( Calendar newBirthDay) {  birthDay = newBirthDay;  }

  /**
      Alterar a morada.
   */
   public void setAddress(String newAddress) { address = newAddress;  }

  /**
      Alterar os contactos.
   */
   public void setContact(Contact newContact) { contact = newContact; }        
      
  /**
      Construir uma String com os campos que descrevem a pessoa.
   */ 
   public String toString() {
      return getFirstName() +' '+ getLastName();
   }

  /**
      Comparar com outro objecto Pessoa.
      O crit�rio de compara��o � o primeiro nome.
      Tem que se garantir que o objecto passado como parametro � uma instancia da 
      classe Person. Caso contr�rio � um erro de programa��o.
   */
   public int compare( Comparable person )  {

      if( getFirstName().compareTo( ((Person)person).getFirstName() ) <0 )
         /* O nome do "this" � alfabeticamente inferior. */
         return CompareConstants.SMALLER;
      /* O nome do "this" � alfabeticamente superior ou igual. */
      return CompareConstants.BIGGER;
   }
        
  /**
      Verificar se duas pessoas s�o a mesma.
      A compara��o tem como base os campos que definem univocamente a pessoa:
      - Nome.
      - Data de nascimento.
   */
   public boolean equals( Object object )  {
      if(object==null)
         /* O objecto "this" nao � "null". */
         return false;
               
      if( (object instanceof Person) == false ) 
         /* O objecto passado como parametro n�o � uma inst�ncia da classe Person. */   
         return false;   

      /* Efectuar a compara��o dos objectos. */
      if(this==object) 
         /* "this" e "object" referem o mesmo objecto. */
         return true;
                
      /* Comparar apenas os atributos que definem univocamente uma pessoa. */                           
      if( compareNames(name,((Person)object).name) == true ) {
         if(birthDay.equals(((Person)object).birthDay)) 
            /* Trata-se da mesma pessoa. */  
            return true;
      }
      /* S�o pessoas diferentes. */                        
      return false;
   }

  /**
      Obter um objecto que implementa o crit�rio de compara��o por idade.
   */
   public static Compare getByAgeCriteria() {
      return new CompareByAge();
   }
}  /* Fim da classe Person */

