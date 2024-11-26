<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->

<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>

<html lang="pt-br">
    <body>
        <%
            

            String nome = request.getParameter("nome"); // Captura o nome do usuario
            String email = request.getParameter("email"); // Captura o sobrenome do usuario
            String senha = request.getParameter("senha"); // Captura o email do usuario
            String telefone = request.getParameter("telefone"); // Captura a senha do usuario
            String rg = request.getParameter("rg"); // Captura o resumo de hab. do usuario
            String cpf = request.getParameter("cpf"); // Captura o aceite dos termos
            String estado = request.getParameter("estado"); // Captura o aceite dos termos
            String aceite = request.getParameter("aceite"); // Captura o aceite dos termos

            //Inicia um objto do usuario baseado no atributo da session
            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");            
            // Criar e preencher o objeto Usuario com os dados atualizados
            Usuario usu = new Usuario();
            usu.setId(usuarioLogado.getId());
            usu.setNome(nome);
            usu.setEmail(email);
            usu.setSenha(senha);
            usu.setTelefone(telefone);
            usu.setRg(rg);
            usu.setCpf(cpf);
            usu.setEstado(estado);
            usu.setAceite(aceite != null); // Para o aceiteTermo retornar true (obrigatório) para o banco de dados            

            // Atualizar o cadastro no banco
            UsuarioDAO usuDAO = new UsuarioDAO();
            usuDAO.AlterarCadastro(usu);

            // Atualizar os dados da sessão com o usuário atualizado
            usuarioLogado = usuDAO.receberDados(usuarioLogado.getEmail(), usuarioLogado.getSenha());
            session.setAttribute("usuarioLogado", usuarioLogado);

            // Redirecionar para o index
            response.sendRedirect("../index.jsp");
        %>
    </body>
</html>

