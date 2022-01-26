package DAO;

import MODEL.Cliente; // Os métodos get e set do usuário estão na classe da model
import java.sql.Connection; // Criar e abrir minha conexão - caminho do database
import java.sql.PreparedStatement; // Responsável por executar instruções SQL (com parametros)
import java.sql.Statement; //igual preparedStatment (sem parametros)
import java.util.ArrayList; // Responsável por exibir o valor de retorno do ResultSet
import java.sql.ResultSet; // Responsável por receber o valor de retorno do database


public class DAOCliente {
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Cliente> lista = new ArrayList<>();
    
    //Criar construtor da conexão
    public DAOCliente() {
        conn = new Conexao().getConexao();
    }
    
    //Criar o método Inserir Usuário
    public void InserirCliente(Cliente cliente) {
        // Criar uma variavel para receber instrução SQL
        String sql = "INSERT INTO tb_cliente (nome_cliente, email_cliente, telefone_cliente) VALUES (?, ?, ?)";
        // Criar um try catch para verificar erro
        try {
            //Qual conexão utilizar e qual comando executar
            stmt = conn.prepareStatement(sql);
            //Passar os valores dos parâmetros
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getEmail());
            stmt.setString(3, cliente.getTelefone());
            // Executar a instrução sql
            stmt.execute();
            // Fechar conexão
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro inserir usuário: "+erro);
        }
    }
    
    // Método listar todos os usuários
    public ArrayList<Cliente> listarCliente() {
        // váriavel que recebe a instrução SQL
        String sql = "SELECT * FROM tb_cliente";
        try {
            // Passar o caminho da conexão para o st - Statment
            st = conn.createStatement();
            // Passar para o ResultSet rs o retorno da instrução SQL
            rs = st.executeQuery(sql);
            // Estrutura repetição para carregar linha por linha no ArrayList
            while(rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setNome(rs.getString("nome_cliente"));
                cliente.setEmail(rs.getString("email_cliente"));
                cliente.setTelefone(rs.getString("telefone_cliente"));
                lista.add(cliente);
            }
            
        } catch (Exception erro) {
            throw new RuntimeException("Erro listar todos os clientes: " +erro);
        }
        return lista;
    }
    
     // Método listar usuários por NOME
    public ArrayList<Cliente> listarClienteNome(String valor) {
        // váriavel que recebe a instrução SQL
        String sql = "SELECT * FROM tb_cliente WHERE nome_cliente LIKE '%"+valor+"%' ";
        try {
            // Passar o caminho da conexão para o st - Statment
            st = conn.createStatement();
            // Passar para o ResultSet rs o retorno da instrução SQL
            rs = st.executeQuery(sql);
            // Estrutura repetição para carregar linha por linha no ArrayList
            while(rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id_cliente"));
                cliente.setNome(rs.getString("nome_cliente"));
                cliente.setEmail(rs.getString("email_cliente"));
                cliente.setTelefone(rs.getString("telefone_cliente"));
                lista.add(cliente);
            }
            
        } catch (Exception erro) {
            throw new RuntimeException("Erro listar clientes por nome: " +erro);
        }
        return lista;
    }
    
      //Criar o método Inserir Usuário
    public void ExcluirCliente(Cliente cliente) {
        // Criar uma variavel para receber instrução SQL
        String sql = "DELETE FROM tb_cliente WHERE id_cliente =?";
        // Criar um try catch para verificar erro
        try {
            //Qual conexão utilizar e qual comando executar
            stmt = conn.prepareStatement(sql);
            //Passar os valores dos parâmetros
            stmt.setInt(1, cliente.getId());
            // Executar a instrução sql
            stmt.execute();
            // Fechar conexão
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro excluir cliente: "+erro);
        }
    }
    
       //Criar o método Inserir Usuário
    public void EditarCliente(Cliente cliente) {
        // Criar uma variavel para receber instrução SQL
        String sql = "UPDATE tb_cliente SET nome_cliente = ?,email_cliente = ?, telefone_cliente = ? WHERE id_cliente = ?";
        // Criar um try catch para verificar erro
        try {
            //Qual conexão utilizar e qual comando executar
            stmt = conn.prepareStatement(sql);
            //Passar os valores dos parâmetros
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getEmail());
            stmt.setString(3, cliente.getTelefone());
            stmt.setInt(4, cliente.getId());
            // Executar a instrução sql
            stmt.execute();
            // Fechar conexão
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro editar cliente: "+erro);
        }
    }
    
}

