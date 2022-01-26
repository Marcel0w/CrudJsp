<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="MODEL.Cliente"%>
<%@page import="DAO.DAOCliente"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">

        <title>Consulta de Clientes</title>
    </head>
    <body>
        <div id="conteudo">
            <form action="consultar_cliente.jsp" method="post">
                <h1>CONSULTAR CLIENTES</h1>
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
                out.print("<th>EMAIL</th>");
                out.print("<th>TELEFONE</th>");
                out.print("<th>EDITAR</th>");
                out.print("<th>EXCLUIR</th>");
                out.print("</tr>");

                DAOCliente cli = new DAOCliente();
                if (request.getParameter("nome") == "" || request.getParameter("nome") == null) {
                    ArrayList<Cliente> lista = cli.listarCliente();
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>" + lista.get(i).getId() + "</td>");
                        out.print("<td>" + lista.get(i).getNome() + "</td>");
                        out.print("<td>" + lista.get(i).getEmail() + "</td>");
                        out.print("<td>" + lista.get(i).getTelefone() + "</td>");
                        out.print("<td><a href='alterar_cliente.jsp?id="
                                + lista.get(i).getId() + "&nome=" + lista.get(i).getNome()
                                + "&email=" + lista.get(i).getEmail() + "&telefone=" + lista.get(i).getTelefone()
                                + "'</a>CLIQUE</td>");
                        out.print("<td><a href='ExExcluirCliente.jsp?id="
                                + lista.get(i).getId() + "'</a>CLIQUE</td>");
                        out.print("</tr>");


            %><%                                }

                } else {
                    ArrayList<Cliente> lista = cli.listarClienteNome(request.getParameter("nome"));
                    for (int i = 0; i < lista.size(); i++) {
                        out.print("<tr>");
                        out.print("<td>" + lista.get(i).getId() + "</td>");
                        out.print("<td>" + lista.get(i).getNome() + "</td>");
                        out.print("<td>" + lista.get(i).getEmail() + "</td>");
                        out.print("<td>" + lista.get(i).getTelefone() + "</td>");
                        out.print("<td><a href='alterar_cliente.jsp?id="
                                + lista.get(i).getId() + "&nome=" + lista.get(i).getNome()
                                + "&email=" + lista.get(i).getEmail() + "&telefone=" + lista.get(i).getTelefone()
                                + "'</a>CLIQUE</td>");
                        out.print("<td><a href='ExExcluirCliente.jsp?id="
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
