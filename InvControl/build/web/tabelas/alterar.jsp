<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
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

        <title>Alterar - InvControl</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


    </head>

    <!--body-->
    <body class="sb-nav-fixed">
        <%
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
            <a class="navbar-brand ps-3" href=../index.jsp><img src="../assets/img/logoBranca.png" alt="alt" height="50px" width="50px" class="img-fluidg"/>&nbspInv Control</a>
            <!-- menu sanduiche-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!--opções de perfil-->
            <ul class="navbar-nav ms-auto me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="../login/editar-perfil.jsp">Editar perfil</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="../login/logout.jsp">Sair</a></li>
                    </ul>
                </li>                
            </ul>
        </nav>

        <!--sidebar-->
        <div id="layoutSidenav" class="">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Principal</div>
                            <a class="nav-link" href="../index.jsp">
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
                                    <a class="nav-link" href="inserirP.jsp">Cadastrar</a>
                                    <a class="nav-link" href="alterar.jsp">Alterar</a>
                                </nav>
                            </div>

                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Entrou como:</div>
                        <!--pega o nome do usuario que está logado na session Caso não tenha niguem logado é mandado de volta para a pagina de login-->
                        <%                            Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
                            if (usuarioLogado != null) {
                        %>
                        <%= usuarioLogado.getNome()%>
                        <%
                            } else {
                                response.sendRedirect("login.html");
                                return;

                            }
                        %>
                    </div>
                </nav>
            </div>
            <!--opções de navegação dentro da pagina-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Produtos</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="inserirP.jsp" style="text-decoration: none; color: gray">Inserir</a></li>
                            <li class="breadcrumb-item active"><a href="alterar.jsp" style="text-decoration: none; color: black">Alterar</a></li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <!--salva os dados do produto no qual o usuario clicou para poder alterar-->
                                <%
                                    int idProduto = 0;
                                    try {
                                        idProduto = Integer.parseInt(request.getParameter("id_produto"));
                                    } catch (NumberFormatException e) {
                                    }
//                                    verifica se o id do produto é maior que 0 caso sim, ele recebe esse id, caso não ele fica como null para que o campo fique vazio
                                    Produto prod = idProduto > 0 ? prodDAO.receberProd(idProduto) : null;

                                %>
                                <!--forms para alterar produtos-->
                                <form method="post" action="alterarProd.jsp">
                                    <div class="row mb-1 mt-2" style="margin-left: 0.5rem">

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="p_nome" type="text" name="p_nome" value="<%=prod != null ? prod.getNome() : ""%>" placeholder="Nome do Produto" maxlength="50" required/>
                                                    <label for="p_nome">Nome do produto</label>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" id="p_desc" type="text" name="p_desc" value="<%=prod != null ? prod.getDescricao() : ""%>" placeholder="Descrição" maxlength="50" required/>
                                                    <label for="p_desc">Descrição</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="p_preco" type="number" name="p_preco" value="<%=prod != null ? prod.getPreco() : ""%>" step="0.01" min="0.01" placeholder="0.00" required/>
                                                    <label for="p_preco">Preço</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" id="p_qtd" type="number" name="p_qtd" value="<%=prod != null ? prod.getQtd() : ""%>" placeholder="Quantidade" step="1" min="1" max="9999" required/>
                                                    <label for="p_qtd form-check-label">Quantidade</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">                                                
                                                    <select class="form-select" id="p_categoria" name="p_categoria" required>
                                                        <option value="" disabled selected hidden>Selecione</option>
                                                        <option value="Perfumaria & Cosmético">Perfumaria e Cosméticos</option> 
                                                        <option value="Alimentos e Bebidas">Alimentos e Bebidas</option>
                                                        <option value="Saúde e Bem-estar">Saúde e Bem-estar</option>
                                                        <option value="Utensílios Domésticos">Utensílios Domésticos</option>
                                                        <option value="Produtos para Pets">Produtos para Pets</option>
                                                        <option value="Equipamentos de Escritório">Equipamentos de Escritório</option>
                                                    </select>
                                                    <label for="p_categoria">Categoria</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 ">
                                                <div class="form-floating">
                                                    <input class="form-control" id="p_fornecedor" type="text" name="p_fornecedor" value="<%=prod != null ? prod.getFornecedor() : ""%>" placeholder="Fornecedor" maxlength="50" required/>
                                                    <label for="p_fornecedor">Fornecedor</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="p_id" type="text" name="p_id" readonly="true" value="<%=prod != null ? prod.getId_Produto() : ""%>" placeholder="Código do Produto" maxlength="50" required/>
                                                    <label for="p_id">Código do Produto</label>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="d-flex justify-content-end mt-3 ">
                                                    <div class="d-grid"><button class="btn btn-primary btn-block" type="submit" name="button">Alterar Produto</button></div>
                                                </div>
                                            </div>
                                        </div>                                    

                                    </div>
                                </form>
                            </div>
                        </div>                       
                        <!--<div class="alert alert-warning alert-dismissible fade show" role="alert">
                          <strong>Holy guacamole!</strong> You should check in on some of those fields below.
                          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>-->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                <!--tabela-->
                                Tabela
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <!--cabeçalho e footer da tabela-->
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
                                            <td><%= lista.get(i).getId_Produto()%> </td>
                                            <td><%= lista.get(i).getNome()%> </td>
                                            <td><%= lista.get(i).getDescricao()%></td>
                                            <td>R$ <%= lista.get(i).getPreco()%></td>
                                            <td><%= lista.get(i).getQtd()%> uni.</td>
                                            <td><%= lista.get(i).getCategoria()%></td>
                                            <td><%= lista.get(i).getFornecedor()%></td>
                                            <td>
                                                <form action="alterar.jsp" method="POST" style="display:inline;">
                                                    <input type="hidden" name="id_produto" value="<%= lista.get(i).getId_Produto()%>">
                                                    <button type="submit" class="btn btn-sm btn-success">
                                                        <i class="bi bi-arrow-repeat"></i>
                                                    </button>
                                                </form>
                                                <form action="deletar.jsp" method="POST" style="display:inline;">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
    </body>
</html>
