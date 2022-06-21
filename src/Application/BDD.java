package Application;


import java.net.Socket;
import java.sql.*;

public class BDD
{
    Connection connection;
    Statement statement;
    String SQL;
    String url;
    String username;
    String password;
    Socket client; 
    int Port;
    String Host;
    
    //constructeur 
    public BDD(String url,String username,String password,String Host,int Port)
    {
    this.url=url;
    this.username=username;
    this.password=password;
    }
    
    //fonction pour se connecter à la base de donnée
    public Connection connecter_BD()
    {
        try 
            {
            Class.forName("com.mysql.jdbc.Driver"); //Charger le pilote de la base de donnée 
            connection =DriverManager.getConnection(url,username,password);
            /*créer une instance de la classe Connection grâce à la méthode getConnection de 
            l'objet DriverManager en indiquant la base de données à charger */
            }
        
        catch(Exception e) 
            {
            System.err.println(e.getMessage()); //err is error and e.getMessage is to know where's the problem
            
            }
        return connection;
    }
      
    //fonction pour fermer la base de donnée
    public Connection close_connexion()
    {
    try 
    {
       connection.close(); 
    }
    catch (Exception e) 
    {
        System.err.println(e.getMessage());
    }
    return connection;
    }
    // pour l'execution de requete 
    public ResultSet executionQuery(String sql) 
    {
      connecter_BD();
      ResultSet resultSet=null;
      try
      {
          statement= connection.createStatement();
          resultSet=statement.executeQuery(sql);
          
      }
      catch (SQLException ex) 
      {
          System.err.println(ex);
      }
      return resultSet;
    }
    // pour l'execution de requete update 
    public String executionUpdate(String sql)
    {
        connecter_BD();
        String result="";
        try
        {
         statement= connection.createStatement();
         statement.executeUpdate(sql);
         result =sql;
        }
        catch(SQLException ex)
        {
             result=ex.toString();
             
        }
        return result;
    }
    //pour selectionner avec condition
    public ResultSet querySelectAll(String nomTable,String condition)
    {
        connecter_BD();
        SQL="SELECT * FROM "+nomTable+" WHERE "+condition;
        System.out.println(SQL);
        return this.executionQuery(SQL);
    }
    //pour l'insertion dans la base de donnée 
    public String queryInsert(String nomTable,String[] contenuTableau)
    {
      connecter_BD();
      int i;
      SQL="INSERT INTO "+nomTable+ "VALUES(";
      for(i=0;i<=contenuTableau.length-1;i++)
      {
          SQL+="'"+contenuTableau[i]+"'";
          if(i<contenuTableau.length-1)
              SQL+=",";
          
      }
      SQL+=")";
      return this.executionUpdate(SQL);
    }
    //pour l'insertion de  quelques données dans la base de donnée
    public String queryInsert(String nomTable,String[] nomColonne,String[] contenuTableau)
    {
      connecter_BD();
      int i;
      SQL="INSERT INTO "+nomTable+ "(";
      for(i=0;i<=nomColonne.length-1;i++)
      {
          SQL+=nomColonne[i];
          if(i<nomColonne.length-1)
              SQL+=",";
          
      }
      SQL+=") VALUES(";
      for(i=0;i<=contenuTableau.length-1;i++)
      {
          SQL+="'"+contenuTableau[i]+"'";
          if(i<contenuTableau.length-1)
              SQL+=",";
          
      }
      SQL+=")";
      return this.executionUpdate(SQL);
    }
    
    
}

















