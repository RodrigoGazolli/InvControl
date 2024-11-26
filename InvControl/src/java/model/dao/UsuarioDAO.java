//<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->

// pacote dao
package model.dao;

//imports do SQL para comandos SQL, pacote model.Usuario para fazer o insert, pacote util.ConcectaDB para conexão ao banco
import java.sql.*;
import model.Usuario;
import util.ConectaDB;

// Classe UsuarioDAO
public class UsuarioDAO {

    ResultSet rs;
    PreparedStatement sql;
    Connection conexao;

    //Método booleano para capturar se a inserção foi sucedida ou não
    public boolean insUsu(Usuario p_usuario) throws ClassNotFoundException {
        String sql = "INSERT INTO usuarios (nome, email, senha, telefone, rg, cpf, estado, aceite) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (
                Connection conexao = ConectaDB.conectar(); // Obtém a conexão com o banco de dados
                 PreparedStatement stmt = conexao.prepareStatement(sql) // Prepara o SQL com parâmetros
                ) {
            // Substitui os parâmetros do SQL pelos valores do objeto `p_usuario`
            stmt.setString(1, p_usuario.getNome());
            stmt.setString(2, p_usuario.getEmail());
            stmt.setString(3, p_usuario.getSenha());
            stmt.setString(4, p_usuario.getTelefone());
            stmt.setString(5, p_usuario.getRg());
            stmt.setString(6, p_usuario.getCpf());
            stmt.setString(7, p_usuario.getEstado());
            stmt.setBoolean(8, p_usuario.getAceite()); // Alterado para `isAceite`, se for um boolean

            // Executa a instrução SQL e verifica se houve inserção
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace(); // Exibe o erro no console para depuração
            return false;
        }
    }

    // Metodo para verificar se o email existe no bacno de dados
    public boolean emailExiste(String email) throws ClassNotFoundException {
        boolean emailEncontrado = false;
        try {
            conexao = ConectaDB.conectar();
            sql = conexao.prepareStatement("SELECT email FROM usuarios WHERE email = ?");
            sql.setString(1, email);
            rs = sql.executeQuery();

            if (rs.next()) {
                emailEncontrado = true; // Retorna true se o email for encontrado no banco de dados
            }
            conexao.close(); // Fecha a conexão
        } catch (SQLException ex) {
            // Registra o erro para diagnóstico
            System.out.println("Exception: " + ex.toString());

        }
        return emailEncontrado;
    }

    // Armazena no objto usuario os dados do banco de dados
    public Usuario receberDados(String email, String senha) throws ClassNotFoundException {
        Usuario usuario = null; // Inicialize um novo objeto Usuario

        try {
            conexao = ConectaDB.conectar();
            sql = conexao.prepareStatement("SELECT * FROM usuarios WHERE email = ? AND senha = ?");
            sql.setString(1, email);
            sql.setString(2, senha);
            rs = sql.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(Integer.parseInt(rs.getString("id")));
                usuario.setEmail(email);
                usuario.setSenha(senha);
                usuario.setNome(rs.getString("nome"));
                usuario.setTelefone(rs.getString("telefone"));
                usuario.setRg(rs.getString("rg"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEstado(rs.getString("estado"));
            }
            conexao.close(); // Fecha a conexão

        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.toString());
        }

        return usuario; // Retorna o objeto Usuario completo ou null se não encontrado
    }

    // Alterar o cadastro
    public void AlterarCadastro(Usuario ac_usuario) {

        try {
            // Conecta ao banco de dados
            conexao = ConectaDB.conectar();

            // Preparar o comando SQL com os novos campos
            sql = conexao.prepareStatement(
                    "UPDATE usuarios SET email = ?, senha = ?, nome = ?, telefone = ?, rg = ?, cpf = ?, estado = ?, aceite= ? WHERE id = ?"
            );

            // Definir os parâmetros na query SQL
            sql.setString(1, ac_usuario.getEmail());
            sql.setString(2, ac_usuario.getSenha());
            sql.setString(3, ac_usuario.getNome());
            sql.setString(4, ac_usuario.getTelefone());
            sql.setString(5, ac_usuario.getRg());
            sql.setString(6, ac_usuario.getCpf());
            sql.setString(7, ac_usuario.getEstado());
            sql.setBoolean(8, ac_usuario.getAceite()); // 
            sql.setInt(9, ac_usuario.getId()); // 

            // Executar a atualização no banco de dados
            int verifica = sql.executeUpdate();

            if (verifica > 0) {
                System.out.println("Registro alterado com sucesso !!!");
            } else {
                System.out.println("Registro não alterado !!!");
            }

            // Fecha a conexão
            conexao.close();

        } catch (Exception e) {
            System.out.println("Exception: " + e.toString());
        }
    }

    // Deletar cadastro
    public boolean Deletar(Usuario del) throws ClassNotFoundException {
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            //DELETE from pesquisa WHERE id = 100            
            String sql = "DELETE from usuarios WHERE id = " + del.getId();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            conexao.close(); // Fecha a conexão
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex);
            return false;
        }
    }

}
