<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
17314-PADRÕES DE PROJETOS ORIENTADOS A OBJETOS
PROFESSOR: PEDRO TOLEDO
07/11/2024
PROJETO REDE SOCIAL-->

<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>

<html lang="pt-br">

    <body>
        <%
            // Captura o email e a senha do formulário
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            // Instância do UsuarioDAO para verificar os dados no banco
            UsuarioDAO usuDAO = new UsuarioDAO();
            Usuario usuario = usuDAO.receberDados(email, senha);
            if (usuario != null) {
                session.setAttribute("usuarioLogado", usuario);
                response.sendRedirect("../index.jsp");
            } else {

                // Credenciais incorretas - redireciona para página de erro ou login novamente
        %>
    <head>
<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="InvControl" />
        <meta name="author" content="André & Rodrigo" />
        <link rel="icon" type="image/x-icon" href="../assets/img/fundoPreto.PNG" />

        <title>Erro - InvControl</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!--barra de navegação-->
    </head>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark justify-content-center">
        <!--logo e nome do site-->
        <a class="navbar-brand ps-3 " href=../landing-page/index.html><img src="../assets/img/logoBranca.png" alt="alt" height="50" width="50" class="img-fluidg"/>&nbspInv Control</a>           
    </nav>

    <div class="custom-bg text-dark ">
        <div class="d-flex align-items-center justify-content-center px-2 min-vh-100">
            <div class="text-center">
                <h1 class="display-1 fw-bold">Erro!</h1>
                <p class="fs-2 fw-medium">Tente fazer login novamente</p>
                <button class="btn btn-dark" onclick=history.back()>Voltar</button>                   
            </div>
        </div>
    </div>

    <!-- Footer-->
    <div id="layoutAuthentication_footer">
        <footer class="py-4 bg-dark mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-white">Copyright &copy; Inv Control 2024</div>
                    <div>
                        <a href="#" class="text-white">Políticas de Privacidade</a>
                        &middot;
                        <a href="#" class="text-white">Termos &amp; Condições</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <%        }
    %>
</body>
</html>

