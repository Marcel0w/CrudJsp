<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Produto"%>
<%@page import="DAO.DAOProduto"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">

        <title>Consulta de Produtos</title>
    </head>
    <body>
        <div id="conteudo">
            <form action="consultar_produto.jsp" method="post">
                <h1>CONSULTAR PRODUTOS</h1>
                <p>
                    <label> <b>Pesquisar por nome</b> </label><br>
                    <input type="text" name="nome" placeholder="Digite o nome"/>
                </p>
                <p>
                    <input type="submit" value="Pesquisar"/>
                </p>
            </form><br>
        </div>

        <div id="tabela">

            <%
                out.print("<table>");
                out.print("<tr>");
                out.print("<th>CÓDIGO</th>");
                out.print("<th>NOME</th>");
                out.print("<th>QUANTIDADE</th>");
                out.print("<th>EDITAR</th>");
                out.print("<th>EXCLUIR</th>");
                out.print("</tr>");
                DAOProduto pro = new DAOProduto();
                if (request.getParameter("nome") == "" || request.getParameter("nome") == null) {
                    ArrayList<Produto> lista = pro.listarProduto();
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>" + lista.get(i).getId() + "</td>");
                        out.print("<td>" + lista.get(i).getNome() + "</td>");
                        out.print("<td>" + lista.get(i).getQuantidade() + "</td>");
                        out.print("<td><a href='alterar_produto.jsp?id="
                                + lista.get(i).getId() + "&nome=" + lista.get(i).getNome()
                                + "&quantidade=" + lista.get(i).getQuantidade()
                                + "'</a>CLIQUE</td>");
                        out.print("<td><a href='ExExcluirProduto.jsp?id="
                                + lista.get(i).getId() + "'</a>CLIQUE</td>");
                        out.print("</tr>");
                    }

                } else {
                    ArrayList<Produto> lista = pro.listarProdutoNome(request.getParameter("nome"));
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>" + lista.get(i).getId() + "</td>");
                        out.print("<td>" + lista.get(i).getNome() + "</td>");
                        out.print("<td>" + lista.get(i).getQuantidade() + "</td>");
                        out.print("<td><a href='alterar_produto.jsp?id="
                                + lista.get(i).getId() + "&nome=" + lista.get(i).getNome()
                                + "&quantidade=" + lista.get(i).getQuantidade()
                                + "'</a>CLIQUE</td>");
                        out.print("<td><a href='ExExcluirProduto.jsp?id="
                                + lista.get(i).getId() + "'</a>CLIQUE</td>");
                        out.print("</tr>");
                    }
                }
                out.print("</table><br>");
            %>
            <p class="link">
                <a href="index.jsp"> VOLTAR </a>
            </p>
        </div>
    </body>
</html>
