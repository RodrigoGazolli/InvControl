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


<!DOCTYPE html>
<html lang="pt-br">
    <body>
        <%
            //Entrada/Request dos dados                 
            String nome = request.getParameter("nome"); // Captura o nome do usuario
            String email = request.getParameter("email"); // Captura o sobrenome do usuario
            String senha = request.getParameter("senha"); // Captura o email do usuario
            String telefone = request.getParameter("telefone"); // Captura a senha do usuario
            String rg = request.getParameter("rg"); // Captura o resumo de hab. do usuario
            String cpf = request.getParameter("cpf"); // Captura o aceite dos termos
            String estado = request.getParameter("estado"); // Captura o aceite dos termos
            String aceite = request.getParameter("aceite"); // Captura o aceite dos termos

            // Com base nos dados que o próprio usuário do site colocou, é capturado pelo request
            Usuario usu = new Usuario();
            usu.setNome(nome);
            usu.setEmail(email);
            usu.setSenha(senha);
            usu.setTelefone(telefone);
            usu.setRg(rg);
            usu.setCpf(cpf);
            usu.setEstado(estado);
            usu.setAceite(aceite != null); // Para o aceiteTermo retornar true (obrigatório) para o banco de dados            

            // Instancia de objeto da classe UsuarioDAO
            UsuarioDAO usuDAO = new UsuarioDAO();

            // Verifica se o email já existe no banco de dados
            if (usuDAO.emailExiste(usu.getEmail())) {
                // Redireciona para a página de email duplicado se o email já está cadastrado
        %>
    <head>
<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="InvControl" />
        <meta name="author" content="André & Rodrigo" />
        <link rel="icon" type="image/x-icon" href="../assets/img/fundoPreto.PNG" />

        <title>Cadastro Duplicado - InvControl</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!--barra de navegação-->
    </head>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark justify-content-center">
        <!--logo e nome do site-->
        <a class="navbar-brand ps-3 " href=../landing-page/index.html><img src="../assets/img/logoBranca.png" alt="alt" height="50" width="50" class="img-fluidg"/>&nbspInv Control</a>           
    </nav>

    <div class="custom-bg text-dark">
        <div class="d-flex align-items-center justify-content-center min-vh-100 px-2">
            <div class="text-center">
                <h1 class="display-1 fw-bold">Erro!</h1>
                <p class="fs-2 fw-medium">Parece que esse e-mail já existe</p>
                <p class="">Tente fazer login.</p>
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
    <%
    } else {
        // Tenta inserir o usuário no banco de dados
        if (usuDAO.insUsu(usu)) {
            // Redireciona para a página de login se a inserção for bem-sucedida
            response.sendRedirect("login.html");
        } else {
            // Redireciona para a página de erro em caso de erro na inserção
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
        <a class="navbar-brand ps-3 " href=index.jsp><img src="../assets/img/logoBranca.png" alt="alt" height="50" width="50" class="img-fluidg"/>&nbspInv Control</a>           
    </nav>

    <div class="custom-bg text-dark">
        <div class="d-flex align-items-center justify-content-center min-vh-100 px-2">
            <div class="text-center">
                <h1 class="display-1 fw-bold">Oops!</h1>
                <p class="fs-2 fw-medium">Ocorreu um erro de cadastro</p>
                <p class="">Tente novamente</p>
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
    </div><%
            }
        }
    %>
</body>
</html>

