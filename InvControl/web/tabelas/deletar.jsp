<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->

<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
<%@page import="model.Produto"%>
<%@page import="model.dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <body>
<%

        ProdutoDAO prodDAO = new ProdutoDAO();

        // Verifica se o email já existe no banco de dados
        if (prodDAO.deletarProduto(request.getParameter("id_produto"))) {
        // Redireciona para a página de sucesso
        %>
    <head>
<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="InvControl" />
        <meta name="author" content="André & Rodrigo" />
        <link rel="icon" type="image/x-icon" href="../assets/img/fundoPreto.PNG" />

        <title>Sucesso - InvControl</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!--barra de navegação-->
    </head>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark justify-content-center">
        <!--logo e nome do site-->
        <a class="navbar-brand ps-3 " href=../index.jsp><img src="../assets/img/logoBranca.png" alt="alt" height="50" width="50" class="img-fluidg"/>&nbspInv Control</a>           
    </nav>

    <div class="custom-bg text-dark ">
        <div class="d-flex align-items-center justify-content-center px-2 min-vh-100">
            <div class="text-center">
                <h1 class="display-1 fw-bold">Sucesso!</h1>
                <p class="fs-2 fw-medium">O produto foi excluído com sucesso</p>
                <button class="btn btn-dark"> <a style="text-decoration: none; color: white" href="inserirP.jsp">Voltar</a></button>                                
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
        // Redireciona para a página de erro em caso de erro na exclusão
        %>
    <head>
<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="InvControl" />
        <meta name="author" content="André & Rodrigo" />
        <link rel="icon" type="image/x-icon" href="../assets/img/fundoPreto.PNG" />

        <title>Erro de exclusão - InvControl</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!--barra de navegação-->
    </head>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark justify-content-center">
        <!--logo e nome do site-->
        <a class="navbar-brand ps-3 " href=../index.jsp><img src="../assets/img/logoBranca.png" alt="alt" height="50" width="50" class="img-fluidg"/>&nbspInv Control</a>           
    </nav>

    <div class="custom-bg text-dark ">
        <div class="d-flex align-items-center justify-content-center px-2 min-vh-100">
            <div class="text-center">
                <h1 class="display-1 fw-bold">Erro!</h1>
                <p class="fs-2 fw-medium">Tente fazer a exclusão novamente</p>
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
        }
    %>
    </body>
</html>
