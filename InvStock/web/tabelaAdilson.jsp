<%-- 
    Document   : index
    Created on : 28 de out. de 2024, 21:11:41
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Produto"%>
<%@page import="model.dao.ProdutoDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa - Consulta Geral</title>
    </head>
    <body>
        <h1>Pesquisa - Geral (Modo Tabela)</h1>        
        <%                    
            //Select "Geral"

            ProdutoDAO prodDAO = new ProdutoDAO();
            
            List<Produto> lista = new ArrayList<>();
            lista = prodDAO.consultarProdutos();
            
            int n_reg = 0 ;
            out.println("<br> <b>Pesquisa de Satisfação</b>");
            
        %>    
        <table style="width: 100%"; border="1">
            <tr>
                <th>#</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th>Categoria</th>
                <th>Fornecedor</th>
            </tr>                          
            
        <%   
            for( int i = 0; i <= lista.size()-1; i++){                
                //Minha tabela - DT/TR/...
        %>        
            <tr>
                <td><%= n_reg+1 %> </td>
                <td><%= lista.get(i).getNome()%> </td>
                <td><%= lista.get(i).getDescricao()%></td>
                <td><%= lista.get(i).getPreco()%></td>
                <td><%= lista.get(i).getQtd()%></td>
                <td><%= lista.get(i).getCategoria()%></td>
                <td><%= lista.get(i).getFornecedor()%></td>
            </tr>                                                 
        <%
                n_reg++;                           
            }
        %>
        </table>
        <%                                                     
            out.println("<b>Registros: </b>" + n_reg + "<br>");
            out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");  
        %>
        
        <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Nome</th>
                                                <th>Descrição</th>
                                                <th>Preço</th>
                                                <th>Quantidade</th>
                                                <th>Categoria</th>
                                                <th>Fornecedor</th>F
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>#</th>
                                                <th>Nome</th>
                                                <th>Descrição</th>
                                                <th>Preço</th>
                                                <th>Quantidade</th>
                                                <th>Categoria</th>
                                                <th>Fornecedor</th>
                                            </tr>
                                        </tfoot>
                                        <%
                                            //Select "Geral"

                                            ProdutoDAO prodDAO = new ProdutoDAO();

                                            List<Produto> lista = new ArrayList<>();
                                            lista = prodDAO.consultarProdutos();

                                            int n_reg = 0;
                                            

                                        %> 
                                        <tbody>
                                            <%          
                                      for (int i = 0; i <= lista.size() - 1; i++) {
                                                    //Minha tabela - DT/TR/...
                                            %>        
                                            <tr>
                                                <td><%= n_reg + 1%> </td>
                                                <td><%= lista.get(i).getNome()%> </td>
                                                <td><%= lista.get(i).getDescricao()%></td>
                                                <td><%= lista.get(i).getPreco()%></td>
                                                <td><%= lista.get(i).getQtd()%></td>
                                                <td><%= lista.get(i).getCategoria()%></td>
                                                <td><%= lista.get(i).getFornecedor()%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
        
        
        
        
        
    </body>
</html>
