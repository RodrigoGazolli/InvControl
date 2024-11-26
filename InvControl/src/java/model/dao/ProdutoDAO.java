//<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->
// pacote dao
package model.dao;

// imports 
import model.Produto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.ConectaDB;

// nome da classe
public class ProdutoDAO {

    // Atrib.
    ResultSet rs;
    PreparedStatement sql;
    Connection conexao;

    //Método de inserir produto
    public boolean inserirProduto(Produto prod) throws ClassNotFoundException {
        String sql = "INSERT INTO Produtos(nome, descricao, preco, quantidade, categoria, fornecedor) VALUES (?, ?, ?, ?, ?, ?)";

        try (
                Connection conexao = ConectaDB.conectar(); // Estabelece a conexão com o banco de dados
                 PreparedStatement stmt = conexao.prepareStatement(sql) // Prepara o comando SQL
                ) {
            // Configura os parâmetros da instrução SQL
            stmt.setString(1, prod.getNome());
            stmt.setString(2, prod.getDescricao());
            stmt.setDouble(3, prod.getPreco());
            stmt.setInt(4, prod.getQtd());
            stmt.setString(5, prod.getCategoria());
            stmt.setString(6, prod.getFornecedor());

            // Executa a instrução SQL
            return stmt.executeUpdate() > 0; // Retorna `true` se ao menos uma linha foi inserida
        } catch (SQLException e) {
            e.printStackTrace(); // Imprime o erro no console para depuração
            return false; // Retorna `false` em caso de falha
        }
    }

    // metodo de excluir algum produto
    public boolean deletarProduto(String id) throws ClassNotFoundException {

        // delete onde o id for igual na tabela produtos
        String sql = "DELETE FROM produtos WHERE id = ?";

        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            stmt.setInt(1, Integer.parseInt(id));

            stmt.executeUpdate();

            // retorna true
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
    }

    // metodo de lista para consultar os produtos cadastrados
    public List<Produto> consultarProdutos() throws ClassNotFoundException {

        // inicia a lista
        List<Produto> lista = new ArrayList<>();

        try (Connection conexao = ConectaDB.conectar(); Statement stmt = conexao.createStatement()) {

            // seleciona os profutos e guarda na lista
            String sql = "SELECT * FROM produtos";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Produto prod = new Produto();

                prod.setId_Produto(rs.getInt("id"));
                prod.setNome(rs.getString("nome"));
                prod.setDescricao(rs.getString("descricao"));
                prod.setPreco(rs.getDouble("preco"));
                prod.setQtd(rs.getInt("quantidade"));
                prod.setCategoria(rs.getString("categoria"));
                prod.setFornecedor(rs.getString("fornecedor"));

                lista.add(prod);
            }

            return lista.isEmpty() ? null : lista;

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return null;
        }
    }

    // metodo para alterar os dados do produto
    public boolean alterarProduto(Produto prod) throws ClassNotFoundException {

        String sql = "UPDATE produtos SET nome = ?, descricao = ?, preco = ?, quantidade = ?, categoria = ?, fornecedor = ? WHERE id = ?";


        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {


            stmt.setString(1, prod.getNome());       // Set nome (String)
            stmt.setString(2, prod.getDescricao());  // Set descricao (String)
            stmt.setDouble(3, prod.getPreco());      // Set preco (Double)
            stmt.setInt(4, prod.getQtd());           // Set qtd (Int)
            stmt.setString(5, prod.getCategoria());  // Set categoria (String)
            stmt.setString(6, prod.getFornecedor()); // Set fornecedor (String)
            stmt.setInt(7, prod.getId_Produto());    // Set id (Int)


            int rowsAffected = stmt.executeUpdate();


            return rowsAffected > 0;

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
    }

    // recebe os dados do produto e guarda nos setters
    public Produto receberProd(int id) throws ClassNotFoundException {
        Produto prod = null; // Inicialize um novo objeto Usuario

        try {
            conexao = ConectaDB.conectar();
            sql = conexao.prepareStatement("SELECT * FROM produtos WHERE id= ?");
            sql.setInt(1, id);
            rs = sql.executeQuery();
            if (rs.next()) {
                prod = new Produto();
                prod.setId_Produto(id);
                prod.setNome(rs.getString("nome"));
                prod.setDescricao(rs.getString("descricao"));
                prod.setPreco(Double.parseDouble(rs.getString("preco")));
                prod.setQtd(Integer.parseInt(rs.getString("quantidade")));
                prod.setCategoria(rs.getString("categoria"));
                prod.setFornecedor(rs.getString("fornecedor"));
            }
            conexao.close(); // Fecha a conexão

        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.toString());
        }

        return prod; // Retorna o objeto Usuario completo ou null se não encontrado
    }
}
