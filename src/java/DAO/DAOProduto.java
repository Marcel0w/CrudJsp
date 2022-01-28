package DAO;

import MODEL.Produto; // Os métodos get e set do produto estão na classe da model
import java.sql.Connection; // Criar e abrir minha conexão - caminho do database
import java.sql.PreparedStatement; // Responsável por executar instruções SQL (com parametros)
import java.sql.Statement; //igual preparedStatment (sem parametros)
import java.util.ArrayList; // Responsável por exibir o valor de retorno do ResultSet
import java.sql.ResultSet; // Responsável por receber o valor de retorno do database


public class DAOProduto {
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Produto> lista = new ArrayList<>();
    
    //Criar construtor da conexão
    public DAOProduto() {
        conn = new Conexao().getConexao();
    }
    
    //Criar o método Inserir Produto
    public void InserirProduto(Produto produto) {
        // Criar uma variavel para receber instrução SQL
        String sql = "INSERT INTO tb_produtos (nome_produto, qtd_produto) VALUES (?, ?)";
        // Criar um try catch para verificar erro
        try {
            //Qual conexão utilizar e qual comando executar
            stmt = conn.prepareStatement(sql);
            //Passar os valores dos parâmetros
            stmt.setString(1, produto.getNome());
            stmt.setInt(2, produto.getQuantidade());
            // Executar a instrução sql
            stmt.execute();
            // Fechar conexão
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro inserir usuário: "+erro);
        }
    }
    
    // Método listar todos os Produtos
    public ArrayList<Produto> listarProduto() {
        // váriavel que recebe a instrução SQL
        String sql = "SELECT * FROM tb_produtos";
        try {
            // Passar o caminho da conexão para o st - Statment
            st = conn.createStatement();
            // Passar para o ResultSet rs o retorno da instrução SQL
            rs = st.executeQuery(sql);
            // Estrutura repetição para carregar linha por linha no ArrayList
            while(rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("id_produto"));
                produto.setNome(rs.getString("nome_produto"));
                produto.setQuantidade(rs.getInt("qtd_produto"));
                lista.add(produto);
            }
            
        } catch (Exception erro) {
            throw new RuntimeException("Erro listar todos usuários: " +erro);
        }
        return lista;
    }
    
     // Método listar Produtos por NOME
    public ArrayList<Produto> listarProdutoNome(String valor) {
        // váriavel que recebe a instrução SQL
        String sql = "SELECT * FROM tb_produtos WHERE nome_produto LIKE '%"+valor+"%' ";
        try {
            // Passar o caminho da conexão para o st - Statment
            st = conn.createStatement();
            // Passar para o ResultSet rs o retorno da instrução SQL
            rs = st.executeQuery(sql);
            // Estrutura repetição para carregar linha por linha no ArrayList
            while(rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("id_produto"));
                produto.setNome(rs.getString("nome_produto"));
                produto.setQuantidade(rs.getInt("qtd_produto"));
                lista.add(produto);
            }
            
        } catch (Exception erro) {
            throw new RuntimeException("Erro listar todos usuários: " +erro);
        }
        return lista;
    }
    
     //Criar o método Excluir Produto
    public void ExcluirProduto(Produto produto) {
        // Criar uma variavel para receber instrução SQL
        String sql = "DELETE FROM tb_produtos WHERE id_produto =?";
        // Criar um try catch para verificar erro
        try {
            //Qual conexão utilizar e qual comando executar
            stmt = conn.prepareStatement(sql);
            //Passar os valores dos parâmetros
            stmt.setInt(1, produto.getId());
            // Executar a instrução sql
            stmt.execute();
            // Fechar conexão
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro excluir produto: "+erro);
        }
    }
    
       //Criar o método Editar Produto
    public void EditarProduto(Produto produto) {
        // Criar uma variavel para receber instrução SQL
        String sql = "UPDATE tb_produtos SET nome_produto = ?, qtd_produto = ? WHERE id_produto = ?";
        // Criar um try catch para verificar erro
        try {
            //Qual conexão utilizar e qual comando executar
            stmt = conn.prepareStatement(sql);
            //Passar os valores dos parâmetros
            stmt.setString(1, produto.getNome());
            stmt.setInt(2, produto.getQuantidade());
            stmt.setInt(3, produto.getId());
            // Executar a instrução sql
            stmt.execute();
            // Fechar conexão
            stmt.close();
        } catch (Exception erro) {
            throw new RuntimeException("Erro alterar produto: "+erro);
        }
    }
    
}
