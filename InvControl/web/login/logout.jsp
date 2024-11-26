<!--UNIVERSIDADE DE MOGI DAS CRUZES - UMC
//ANDRÉ HIDEKI HATAISHI DA SILVA - 11231100985
//RODRIGO GAZOLLI DE OLIVEIRA - 11231101823
//ANÁLISE E IMPLEMENTAÇÃO DE SOFTWARE
//PROFESSOR: ADILSON LIMA
//19/11/2024
//PROJETO INVCONTROL-->
<!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <!--Cabeçalho com titulo, link css, tags meta, import de bootstrap, etc-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!--Remove a session e retorna para a landing page-->
        <%
            session.removeAttribute("usuarioLogado");
            response.sendRedirect("../landing-page/index.html");
        %>
    </body>
</html>
