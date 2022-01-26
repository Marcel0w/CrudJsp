package DAO;
// Importar 2 bibliotecas de conexão
import java.sql.DriverManager;
import java.sql.Connection;

public class Conexao {
    /* // getConnection add by netbeans and DAOUsuario
    static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }*/
    // Criando método de conexão
    public Connection getConexao() {
        // try - verifica se tem algum erro no código que está dentro dele
        try{
            // Caminho para buscar o driver
            Class.forName("com.mysql.jdbc.Driver");
           // JDBC - Java Database Connectivity
           return DriverManager.getConnection("jdbc:mysql://localhost/BDAvaliacao", "root", "1010"); //banco que tenho que criar (senha vazia no root)
        } catch(Exception erro) { // caso algum problema no try, executa o catch
            throw new RuntimeException("Erro classe conexão: "+erro); // erro do try
        }
    }
}
