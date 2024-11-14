/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Produto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.ConectaDB;

/**
 *
 * @author alunocmc
 */
public class ProdutoDAO {

    // Atrib.
    //Método
    public boolean inserirProduto(Produto prod) throws ClassNotFoundException {
        ConectaDB conexao = new ConectaDB();

        String sql = "INSERT INTO Produto(nome, descricao, preco, qtd, categoria, fornecedor) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
            stmt.setString(1, prod.getNome());
            stmt.setString(2, prod.getDescricao());
            stmt.setDouble(3, prod.getPreco());
            stmt.setInt(4, prod.getQtd());
            stmt.setString(5, prod.getCategoria());
            stmt.setString(6, prod.getFornecedor());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deletarProduto(Produto prod) throws ClassNotFoundException {
        // Define the SQL query with a placeholder for the product id
        String sql = "DELETE FROM produto WHERE id = ?";

        // Use try-with-resources to ensure resources are closed automatically
        try (Connection conexao = ConectaDB.conectar(); PreparedStatement stmt = conexao.prepareStatement(sql)) {

            // Set the id value into the prepared statement
            stmt.setInt(1, prod.getId_Produto()); // Set the id parameter

            // Execute the delete operation
            stmt.executeUpdate();  // No need to check the rows affected

            // Return true if no exception occurred
            return true;

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
    }

    public List<Produto> consultarProdutos() throws ClassNotFoundException {
    // Create a list to store the products
    List<Produto> lista = new ArrayList<>(); 

    // Connection and SQL logic within a try-with-resources block
    try (Connection conexao = ConectaDB.conectar(); 
         Statement stmt = conexao.createStatement()) {

        String sql = "SELECT * FROM produtos";
        ResultSet rs = stmt.executeQuery(sql); // Execute the SELECT query

        // Iterate through the ResultSet and populate the product list
        while (rs.next()) {
            Produto prod = new Produto();  // Create a new Produto object

            // Set fields for the Produto object
            prod.setId_Produto(rs.getInt("id"));  // Assuming "id" is an integer
            prod.setNome(rs.getString("nome"));
            prod.setDescricao(rs.getString("descricao"));
            prod.setPreco(rs.getDouble("preco"));
            prod.setQtd(rs.getInt("quantidade"));
            prod.setCategoria(rs.getString("categoria"));
            prod.setFornecedor(rs.getString("fornecedor"));


            // Add the populated Produto object to the list
            lista.add(prod);
        }

        // Return the list (null if empty will be handled later)
        return lista.isEmpty() ? null : lista;

    } catch (SQLException ex) {
        System.out.println("Erro: " + ex.getMessage());
        return null;
    }
}

    public boolean alterarProduto(Produto prod) throws ClassNotFoundException {
    // Define the SQL query with placeholders for parameters
    String sql = "UPDATE produto SET nome = ?, descricao = ?, preco = ?, qtd = ?, categoria = ?, fornecedor = ? WHERE id = ?";

    // Use try-with-resources to ensure resources are closed automatically
    try (Connection conexao = ConectaDB.conectar(); 
         PreparedStatement stmt = conexao.prepareStatement(sql)) {

        // Set the values for the prepared statement
        stmt.setString(1, prod.getNome());       // Set nome (String)
        stmt.setString(2, prod.getDescricao());  // Set descricao (String)
        stmt.setDouble(3, prod.getPreco());      // Set preco (Double)
        stmt.setInt(4, prod.getQtd());           // Set qtd (Int)
        stmt.setString(5, prod.getCategoria());  // Set categoria (String)
        stmt.setString(6, prod.getFornecedor()); // Set fornecedor (String)
        stmt.setInt(7, prod.getId_Produto());    // Set id (Int)

        // Execute the update operation
        int rowsAffected = stmt.executeUpdate();

        // Return true if the update was successful (i.e., at least one row was affected)
        return rowsAffected > 0;

    } catch (SQLException ex) {
        System.out.println("Erro: " + ex.getMessage());
        return false;
    }
}
}
