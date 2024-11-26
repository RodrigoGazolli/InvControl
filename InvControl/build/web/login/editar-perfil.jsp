<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->

<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
<%@page import="model.Usuario"%>
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
        <link rel="icon" type="image/x-icon" href="../assets/img/fundoPreto.PNG" />

        <title>Editar Perfil - InvControl</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <!--Pega o atributo salvo na session-->
    <%
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        if (usuarioLogado != null) {

        } else {
//        caso não estiver logado, é mandado de volta para a pagina de login
            response.sendRedirect("login.html");
            return;
        }
    %>

    <!--body-->
    <body class="sb-nav-fixed">
        <!--nav bar-->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark justify-content-center">
            <!--logo e nome do site-->
            <a class="navbar-brand ps-3 " href=../index.jsp><img src="../assets/img/logoBranca.png" alt="alt" height="50" width="50" class="img-fluidg"/>&nbspInv Control</a>           
        </nav>

        <!--forms para editar o perfil-->
        <div id="layoutAuthentication" class="mt-2">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Editar Perfil</h3></div>
                                    <div class="card-body">
                                        <form method="post" action="editar-perfil1.jsp">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="nome" name="nome" type="text" value="<%= usuarioLogado.getNome()%>" placeholder="Nome Completo" maxlength="50" required/>
                                                        <label for="nome">Nome Completo</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="telefone" name="telefone" value="<%= usuarioLogado.getTelefone()%>" type="tel" placeholder="Telefone" maxlength="11" required/>
                                                        <label for="telefone">Telefone com DDD</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="rg" type="text" name="rg" value="<%= usuarioLogado.getRg()%>" placeholder="RG" maxlength="9" required/>
                                                        <label for="rg">RG - Sem pontos e traços</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="cpf" type="text" name="cpf" placeholder="CPF" value="<%= usuarioLogado.getCpf()%>" maxlength="11" required/>
                                                        <label for="cpf">CPF - Sem pontos e traços</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-floating mb-3">                                                
                                                <select class="form-select" id="estado" name="estado" required >
                                                    <option value="" disabled selected hidden>Selecione</option>
                                                    <option value="AC">Acre</option>
                                                    <option value="AL">Alagoas</option>
                                                    <option value="AP">Amapá</option>
                                                    <option value="AM">Amazonas</option>
                                                    <option value="BA">Bahia</option>
                                                    <option value="CE">Ceará</option>
                                                    <option value="DF">Distrito Federal</option>
                                                    <option value="ES">Espirito Santo</option>
                                                    <option value="GO">Goiás</option>
                                                    <option value="MA">Maranhão</option>
                                                    <option value="MS">Mato Grosso do Sul</option>
                                                    <option value="MT">Mato Grosso</option>
                                                    <option value="MG">Minas Gerais</option>
                                                    <option value="PA">Pará</option>
                                                    <option value="PB">Paraíba</option>
                                                    <option value="PR">Paraná</option>
                                                    <option value="PE">Pernambuco</option>
                                                    <option value="PI">Piauí</option>
                                                    <option value="RJ">Rio de Janeiro</option>
                                                    <option value="RN">Rio Grande do Norte</option>
                                                    <option value="RS">Rio Grande do Sul</option>
                                                    <option value="RO">Rondônia</option>
                                                    <option value="RR">Roraima</option>
                                                    <option value="SC">Santa Catarina</option>
                                                    <option value="SP">São Paulo</option>
                                                    <option value="SE">Sergipe</option>
                                                    <option value="TO">Tocantins</option>
                                                </select>
                                                <label for="estado">UF</label>
                                            </div>

                                            <div class="row mb-0">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="email" value="<%= usuarioLogado.getEmail()%>" type="email" name="email" placeholder="nome@exemplo.com"  maxlength="50" required/>
                                                        <label for="email">Endereço de Email</label>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="senha" type="password" value="<%= usuarioLogado.getSenha()%>" name="senha" placeholder="Senha"  maxlength="50" required/>
                                                        <label for="senha">Senha</label>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="form-check mb-3 d-flex ">                                                
                                                <input class="form-check-input" style="margin-right: 0.5rem" id="aceite" type="checkbox" required name="aceite"/>
                                                <label class="form-check-label me-auto" for="aceite">Confirmo as alterações</label>
                                                <a class="ms-auto link-primary" href="excluir-perfil.jsp">Deseja Excluir o Perfil?</a>
                                            </div>                                      


                                            <div class="mt-0 mb-0">
                                                <div class="d-grid"><button class="btn btn-primary btn-block " type="submit" name="button">Editar Perfil</button></div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <!--footer-->
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
