//<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->

<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>
<%@page import="model.dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="InvControl" />
        <meta name="author" content="André & Rodrigo" />
        <link rel="icon" type="image/x-icon" href="assets/img/fundoPreto.PNG" />

        <title>Dashboard - InvControl</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


    </head>
    <body class="sb-nav-fixed">
        <!--Pega o atributo salvo na session-->
        <%
            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
            if (usuarioLogado != null) {

            } else {
                //        caso não estiver logado, é mandado de volta para a pagina de login
                response.sendRedirect("login/login.html");
                return;
            }

            //Select "Geral" da lista dos produtos
            List<Produto> lista = new ArrayList<>();
            ProdutoDAO prodDAO = new ProdutoDAO();
            try {

                lista = prodDAO.consultarProdutos();
                if (lista == null) {
                    lista = new ArrayList<>(); // Garante que a lista esteja inicializada
                }
            } catch (Exception e) {
                lista = new ArrayList<>(); // Evita que o erro da lista estar vazia quebre a página
                e.printStackTrace();
            }


        %> 

        <!--navbar-->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!--logo e nome do site-->
            <a class="navbar-brand ps-3" href=index.jsp><img src="assets/img/logoBranca.png" alt="alt" height="50px" width="50px" class="img-fluidg"/>&nbspInv Control</a>
            <!-- menu sanduiche-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!--opções de perfil-->
            <ul class="navbar-nav ms-auto me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="login/editar-perfil.jsp">Editar perfil</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="login/logout.jsp">Sair</a></li>
                    </ul>
                </li>                
            </ul>
        </nav>


        <div id="layoutSidenav" class="">
            <div id="layoutSidenav_nav" class="">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Principal</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Início - Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Gerenciamento</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Produtos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="tabelas/inserirP.jsp">Cadastrar</a>
                                    <a class="nav-link" href="tabelas/alterar.jsp">Alterar</a>
                                </nav>
                            </div>

                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Entrou como:</div>
                        <!--pega o nome do usuario que está logado na session Caso não tenha niguem logado é mandado de volta para a pagina de login-->
                        <%                            if (usuarioLogado != null) {
                        %>
                        <%= usuarioLogado.getNome()%>
                        <%
                        } else {
                        %>
                        Usuario não encontrado
                        <%
                            }
                        %>
                    </div>
                </nav>
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Resumo</li>
                        </ol>

                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Exemplo de quantidade de produtos cadastrados/dia
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Exemplo de categorias de produtos cadastrados
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Tabela
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <!--cabeçalho e footer da tabela-->
                                            <th>Cód.</th>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th>Preço</th>
                                            <th>Qtd.</th>
                                            <th>Categoria</th>
                                            <th>Fornecedor</th>
                                            <th>Alt&nbsp|&nbspExc</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Cód.</th>
                                            <th>Nome</th>
                                            <th>Descrição</th>
                                            <th>Preço</th>
                                            <th>Qtd.</th>
                                            <th>Categoria</th>
                                            <th>Fornecedor</th>
                                            <th>Alt&nbsp|&nbspExc</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <!--verifica se a tabela está vazia, caso sim, é exibido a mensagem-->
                                        <% if (lista.isEmpty()) { %>
                                        <tr>
                                            <td>Nenhum produto encontrado.</td>
                                            <td>Nenhum produto encontrado.</td>
                                            <td>Nenhum produto encontrado.</td>
                                            <td>Nenhum produto encontrado.</td>
                                            <td>Nenhum produto encontrado.</td>
                                            <td>Nenhum produto encontrado.</td>
                                            <td>Nenhum produto encontrado.</td>
                                            <td>Nenhum produto encontrado.</td>                                           
                                        </tr>
                                        <% } else {
//caso não esteja vazia, pega e mostra todos os produtos armazenados
                                            for (int i = 0; i < lista.size(); i++) {%>        
                                        <tr >
                                            <td     ><%= lista.get(i).getId_Produto()%> </td>
                                            <td><%= lista.get(i).getNome()%> </td>
                                            <td><%= lista.get(i).getDescricao()%></td>
                                            <td>R$ <%= lista.get(i).getPreco()%></td>
                                            <td><%= lista.get(i).getQtd()%> uni.</td>
                                            <td><%= lista.get(i).getCategoria()%></td>
                                            <td><%= lista.get(i).getFornecedor()%></td>
                                            <td>
                                                <form action="tabelas/alterar.jsp" method="POST" style="display:inline;">
                                                    <input type="hidden" name="id_produto" value="<%= lista.get(i).getId_Produto()%>">
                                                    <button type="submit" class="btn btn-sm btn-success">
                                                        <i class="bi bi-arrow-repeat"></i>
                                                    </button>
                                                </form>
                                                <form action="tabelas/deletar.jsp" method="POST" style="display:inline;">
                                                    <input type="hidden" name="id_produto" value="<%= lista.get(i).getId_Produto()%>">
                                                    <button type="submit" class="btn btn-sm btn-danger">
                                                        <i class="bi bi-x"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        <% }
                                            }%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!--footer-->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Inv Control 2024</div>
                            <div>
                                <a href="#">Políticas de Privacidade</a>
                                &middot;
                                <a href="#">Termos &amp; Condições</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</html>

