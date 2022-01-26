<%@page import="DAO.DAOProduto"%>
<%@page import="MODEL.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">

        <title>Alterar Produto</title>
    </head>
    <body>
        <div class="conf">
            <p id="conf">
                <%
                    Produto pro = new Produto();
                    DAOProduto prd = new DAOProduto();
                    try {
                        // Pegar os valores passados pelo navegador via método POST
                        int id = Integer.parseInt(request.getParameter("id"));
                        String nome = request.getParameter("nome");
                        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                        String telefone = request.getParameter("telefone");
                        // Passar os valores para a MODEL
                        pro.setId(id);
                        pro.setNome(nome);
                        pro.setQuantidade(quantidade);
                        prd.EditarProduto(pro);
                        out.print("Produto " + pro.getNome() + " alterado com sucesso!");
                        out.print("<meta http-equiv+'refresh' content='3, url=index.jsp'>");
                    } catch (Exception erro) {
                        throw new RuntimeException("Erro executar alterar produto: " + erro);
                    }
                %>
            </p>
            <p class="link">
                <a href="consultar_produto.jsp"> VOLTAR </a>
            </p>
        </div>
        <script>
            alert("Produto alterado com sucesso!");
        </script>
    </body>
</html>